import math

# An immutable point


class Point:
    """A simple Point class. It comprises two numbers, x and y."""

    def __init__(self, x=0, y=0):
        # holding x and y variables
        self.__x = x
        self.__y = y

    @property
    def x(self):
        """Return the x value of the point."""
        return self.__x

    @property
    def y(self):
        """Return the y value of the point."""
        return self.__y
        # test for equality between two points

    def __eq__(self, p):
        return (self.x == p.x) and (self.y == p.y)

    def __ne__(self, p):
        return (self.x != p.x) or (self.y != p.y)
        # addition

    def __add__(self, p):
        return Point(self.x + p.x, self.y + p.y)
        # subtraction

    def __sub__(self, p):
        return Point(self.x - p.x, self.y - p.y)
        # multiplication

    def __mul__(self, p):
        return Point(self.x * p.x, self.y * p.y)
        # division

    def __truediv__(self, p):
        return Point(self.x/p.x, self.y/p.y)
        # returns a unique identifier for a Point object

    def __hash__(self):
        return hash((self.x, self.y))
        #  __iter__ allows us to access the x and y attributes of a Point object e.g. a, b = Point(x,y).

    def __iter__(self):
        return iter((self.x, self.y))

    def __str__(self):
        return "({},{})".format(self.x, self.y)

    def __repr__(self):
        return "Point({!r},{!r})".format(self.x, self.y)

    def roundXY(self):
        """Round the x an y values to make them integers."""
        return Point(round(self.x), round(self.y))

    def distance(p1, p2):
        """ Calculate the distance between two Point objects. """
        return math.hypot(p2.x - p1.x, p2.y - p1.y)
    
#Demo
def _demoPoints():
    p1 = Point(1,1)
    p2 = Point(2,2)
    p3 = Point(3,4)
    print("p3 == p1 is {}".format(p3 == p1))
    print("p3 != p1 is {}".format(p3 != p1))
    print("p1 + p2 = {}".format(p1 + p2))
    print("p1 - p2 = {}".format(p1 - p2))
    print("p2 * p3 = {}".format(p2 * p3))
    print("p2 / p3 = {}".format(p2 / p3))
    print("(p2 / p3).roundXY() = {}".format((p2 / p3).roundXY()))
    print("p1 as string = {!s}".format(p1))
    print("p3 as code = {!r}".format(p3))
    print()
    x, y = Point(5,7)
    print("Destructuring: the expression x, y = Point(5,7) gives x = {}, y = {}".format(x,y))
    
_demoPoints()
#Demo
# the funtion math.hypot
def distance(p1,p2):
    return math.hypot(p2.x-p1.x,p2.y-p1.y)

def _demoDistance():
    p1 = Point(1,1)
    p2 = Point(2,2)
    print("Distance between p1 and p2 = {}".format(distance(p1,p2)))

_demoDistance()
