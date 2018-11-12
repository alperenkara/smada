from math import sqrt

class Vector:
    def __init__(self, x: float, y: float, z: float):
        self.x = x
        self.y = y
        self.z = z

    def __repr__(self):
        return f"Vector{self.x, self.y, self.z}"

    def mulScalar(self, x):
        return Vector(self.x * x, self.y * x, self.z * x)

    def __add__(self, other):
        return Vector(self.x + other.x, self.y + other.y, self.z + other.z)

    def __sub__(self, other):
        return Vector(self.x - other.x, self.y - other.y, self.z - other.z)

    def dot(u, v) -> float:
        return (u.x * v.x + u.y * v.y + u.z * v.z)

    def norm(v) -> float:
        return sqrt(v.dot(v))

    def cross(v, u):
        return Vector(v.y * u.z - v.z * u.y, v.z * u.x - v.x * u.z, v.x * u.y - v.y * u.x)


class Point:
    def __init__(self, x: float, y: float, z: float):
        self.x = x
        self.y = y
        self.z = z

    def __repr__(self):
        return f"Point{self.x, self.y, self.z}"

    def __sub__(self, other):
        return Vector(self.x - other.x, self.y - other.y, self.z - other.z)

    def addVector(self, v: Vector):
        return Point(self.x + v.x, self.y + v.y, self.z + v.z)


class Edge:
    def __init__(self, a: Point, b: Point):
        self.a = a
        self.b = b

    def __repr__(self):
        return f"Edge{self.a, self.b}"


class Face:
    def __init__(self, v1: Point, v2: Point, v3: Point):
        self.v1 = v1
        self.v2 = v2
        self.v3 = v3

    def __repr__(self):
        return f"Face{self.v1, self.v2, self.v3}"


class Solid:
    def __init__(self, faces: [Face]):
        self.faces = faces
        self.size = len(faces)

    def __repr__(self):
        return f"Solid{self.faces}"
