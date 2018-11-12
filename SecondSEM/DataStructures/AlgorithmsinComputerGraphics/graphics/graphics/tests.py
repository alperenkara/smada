import unittest
from parameterized import parameterized
from math import sqrt
from distances import dist
from classes import *


class DistanceTests(unittest.TestCase):
    @parameterized.expand([
        [Point(1, 0, 0), Point(2, 0, 0), 1],
        [Point(0, 0, 0), Point(2, 2, 0), 2*sqrt(2)]
    ])
    def test_points(self, p1, p2, distance):
        self.assertEqual(dist(p1, p2), distance)

    @parameterized.expand([
        [Edge(Point(1, 1, 0), Point(6, 1, 0)), Point(-1, 3, 0), 2*sqrt(2)],
        [Edge(Point(1, 1, 0), Point(6, 1, 0)), Point(1, -2, 0), 3],
        [Edge(Point(1, 1, 0), Point(6, 1, 0)), Point(3, -1, 0), 2],
        [Edge(Point(1, 1, 0), Point(6, 1, 0)), Point(6, 2, 0), 1],
        [Edge(Point(1, 1, 0), Point(6, 1, 0)), Point(8, 1, 0), 2],
        [Edge(Point(-1, 5, 3), Point(1, 7, 2)), Point(1, 5, 0), sqrt(68)/3]
    ])
    def test_edge_point(self, e, p, distance):
        self.assertEqual(dist(e, p), distance)

    @parameterized.expand([
        [Edge(Point(1, 0, 0), Point(7, 0, 0)), Edge(
            Point(-5, 4, 0), Point(0, 4, 0)), sqrt(17)],
        [Edge(Point(0,2,0), Point(2, 0, 2)), Edge(
            Point(1, 1, 0), Point(1, 5, 0)), 0.5*sqrt(2)],
        [Edge(Point(5, 5,0), Point(7, 3, 0)), Edge(
            Point(1, 1, 0), Point(5, 1, 0)), 2*sqrt(2)],
        [Edge(Point(-8, -1,0), Point(-9, -2, 0)), Edge(
            Point(4, 7, 0), Point(3, 6, 0)), sqrt(170)],
    ])
    def test_edges(self, e1, e2, distance):
        self.assertEqual(dist(e1, e2), distance)

    @parameterized.expand([
        [Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)),  Point(3, 1, 0), 0],
        [Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)),  Point(1, 7, 0), 2],
        [Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)), Point(4, 3, 0), 0.5 * sqrt(2)],
        [Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)),  Point(3, 1, 2), 2],
    ])
    def test_face_point(self, f, p, distance):
        self.assertEqual(dist(f, p), distance)

    @parameterized.expand([
        [Edge(Point(2,1,0), Point(3, 1, 0)), Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)),  0],
        [Edge(Point(0,2,0), Point(3, 0, 0)), Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)),  0],
        [Edge(Point(0,2,2), Point(3, 0, 2)), Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)),  2],
        [Edge(Point(0,2,0), Point(2, 0, 2)), Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)), 0.5 * sqrt(2)],
        [Edge(Point(4,4,-3), Point(4, 4, 5)), Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)), sqrt(2)],
        [Edge(Point(1,7,2), Point(-1, 5, 3)), Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)), sqrt(68)/3],
        [Edge(Point(5, 5, 0), Point(7, 3, 0)), Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)), 2*sqrt(2)],
        [Edge(Point(5, 0, 5), Point(7, 0, 3)), Face(Point(1, 0, 1), Point(5, 0, 1), Point(1, 0, 5)), 2*sqrt(2)],
        [Edge(Point(4, 0, 0), Point(3, 5, 0)), Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)), 0],
        [Edge(Point(2, 2, 0), Point(3, 3, 0)), Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)), 0],
    ])
    def test_edge_face(self, e, f, distance):
        self.assertEqual(dist(e, f), distance)

    @parameterized.expand([
        [Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)), Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)), 0],
        [Face(Point(1, 1, 0), Point(5, 1, 0), Point(1, 5, 0)), Face(Point(2, 2, 0), Point(3, 2, 0), Point(3, 3, 0)), 0],
    ])
    def test_faces(self, f1, f2, distance):
        self.assertEqual(dist(f1, f2), distance)

if __name__ == '__main__':
    unittest.main()
