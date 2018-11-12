from math import sqrt
from classes import *

SMALL_NUM = 0.00000001


def dist(a, b) -> float:
    if isinstance(b, Point):
        if isinstance(a, Point):
            return distPoints(a, b)
        if isinstance(a, Edge):
            return distEdgePoint(a, b)
        if isinstance(a, Face):
            return distFacePoint(a, b)
    if isinstance(a, Edge):
        if isinstance(b, Edge):
            return distEdges(a, b)
        if isinstance(b, Face):
            return distEdgeFace(a, b)
    if isinstance(a, Face) and isinstance(b, Face):
        return distFaces(a, b)
    if isinstance(a, Solid) and isinstance(b, Solid):
        return distSolids(a, b)
    return 0


def distPoints(p1: Point, p2: Point) -> float:
    return sqrt((p1.x - p2.x) ** 2 + (p1.y - p2.y) ** 2 + (p1.z - p2.z) ** 2)


def distEdgePoint(e: Edge, p: Point) -> float:
    v = e.b - e.a
    w = p - e.a

    c1 = w.dot(v)
    if c1 <= 0:  # p is before e.a
        return distPoints(p, e.a)

    c2 = v.dot(v)
    if c2 <= c1:  # p is after e.b
        return distPoints(p, e.b)

    b = c1 / c2
    pb = e.a.addVector(v.mulScalar(b))
    return distPoints(p, pb)


def distEdges(e1: Edge, e2: Edge) -> float:
    u = e1.b - e1.a
    v = e2.b - e2.a
    w = e1.a - e2.a
    a = u.dot(u)
    b = u.dot(v)
    c = v.dot(v)
    d = u.dot(w)
    e = v.dot(w)
    D = a * c - b * b
    sc, sN, sD = D, D, D
    tc, tN, tD = D, D, D

    if D < SMALL_NUM:
        sN = 0
        sD = 1
        tN = e
        tD = c
    else:
        sN = b * e - c * d
        tN = a * e - b * d
        if sN < 0:
            sN = 0
            tN = e
            tD = c
        elif sN > sD:
            sN = sD
            tN = e + b
            tD = c

    if tN < 0:
        tN = 0
        if d >= 0:
            sN = 0
        elif d <= a:
            sN = sD
        else:
            sN = -d
            sD = a
    elif tN > tD:
        tN = tD
        if (b - d) < 0:
            sN = 0
        elif (b - d) > a:
            sN = sD
        else:
            sN = b - d
            sD = a

    sc = 0 if abs(sN) < SMALL_NUM else sN / sD
    tc = 0 if abs(tN) < SMALL_NUM else tN / tD

    dP = w + u.mulScalar(sc) - v.mulScalar(tc)

    return dP.norm()


def distEdgeFace(e: Edge, f: Face):
    if intersectsEdgeFace(f, e):
        return 0
    else:
        return distEdgeFaceNoIntersect(e, f)


def distEdgeFaceNoIntersect(e: Edge, f: Face):
    return min(distFacePoint(f, e.a),
               distFacePoint(f, e.b),
               distEdges(e, Edge(f.v1, f.v2)),
               distEdges(e, Edge(f.v2, f.v3)),
               distEdges(e, Edge(f.v3, f.v1)))


def distFacePoint(f: Face, p: Point) -> float:
    v = projectionVector(f, p)
    projection = p.addVector(v)
    if faceContainsPoint(f, projection):
        return distPoints(projection, p)
    else:
        return min(distEdgePoint(Edge(f.v1, f.v2), p),
                   distEdgePoint(Edge(f.v2, f.v3), p),
                   distEdgePoint(Edge(f.v3, f.v1), p))


def distFaces(f1: Face, f2: Face) -> float:
    if facesIntersect(f1, f2):
        return 0
    else:
        return min(distEdgeFaceNoIntersect(Edge(f1.v1, f1.v2), f2),
                   distEdgeFaceNoIntersect(Edge(f1.v3, f1.v2), f2),
                   distEdgeFaceNoIntersect(Edge(f1.v1, f1.v3), f2),
                   distEdgeFaceNoIntersect(Edge(f2.v1, f2.v2), f1),
                   distEdgeFaceNoIntersect(Edge(f2.v3, f2.v2), f1),
                   distEdgeFaceNoIntersect(Edge(f2.v1, f2.v3), f1))


def distSolids(s1: Solid, s2: Solid) -> float:
    currentMinimum = float('inf')
    for f1 in s1.faces:
        for f2 in s2.faces:
            distance = distFaces(f1, f2)
            if distance < currentMinimum:
                currentMinimum = distance
    return currentMinimum


def triangeField(a: float, b: float, c: float) -> float:
    x = (a + b + c)
    y = (a + b - c)
    z = (a - b + c)
    w = (b - a + c)
    x = x if x > 0 else 0
    y = y if y > 0 else 0
    z = z if z > 0 else 0
    w = w if w > 0 else 0
    return (sqrt(x * y * z * w) / 4.0)


def faceContainsPoint(f: Face, p: Point) -> bool:
    a = distPoints(f.v1, f.v2)
    b = distPoints(f.v2, f.v3)
    c = distPoints(f.v3, f.v1)
    f1p = distPoints(f.v1, p)
    f2p = distPoints(f.v2, p)
    f3p = distPoints(f.v3, p)
    PT = triangeField(a, b, c)
    Pt1 = triangeField(a, f1p, f2p)
    Pt2 = triangeField(b, f2p, f3p)
    Pt3 = triangeField(c, f1p, f3p)
    return abs(PT - Pt1 - Pt2 - Pt3) < SMALL_NUM


def projectionVector(f: Face, p: Point) -> Vector:
    normal = (f.v2 - f.v1).cross(f.v3 - f.v1)
    sn = -normal.dot(p - f.v1)
    sd = normal.dot(normal)
    sb = sn / sd
    return normal.mulScalar(sb)


def getPlaneIntersection(f: Face, e: Edge) -> Point:
    normal = (f.v2 - f.v1).cross(f.v3 - f.v1)
    ab = e.b - e.a
    afv1 = f.v1 - e.a
    denominator = normal.dot(ab)
    if denominator < SMALL_NUM:  # plane and edge are parallel
        return None
    numerator = normal.dot(afv1)
    r = numerator / denominator
    if r < 0 or r > 1:
        return None
    I = e.a.addVector(ab.mulScalar(r))
    return I


def intersectsEdgeFace(f: Face, e: Edge) -> bool:
    intersection = getPlaneIntersection(f, e)
    if intersection is not None:
        return faceContainsPoint(f, intersection)
    else:
        return False


def facesIntersect(f1: Face, f2: Face) -> bool:
    return intersectsEdgeFace(f1, Edge(f2.v1, f2.v2)) or \
           intersectsEdgeFace(f1, Edge(f2.v2, f2.v3)) or \
           intersectsEdgeFace(f1, Edge(f2.v3, f2.v1)) or \
           intersectsEdgeFace(f2, Edge(f1.v1, f1.v2)) or \
           intersectsEdgeFace(f2, Edge(f1.v2, f1.v3)) or \
           intersectsEdgeFace(f2, Edge(f1.v3, f1.v1))