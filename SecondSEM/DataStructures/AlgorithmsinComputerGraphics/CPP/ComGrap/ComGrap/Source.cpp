#include <Bits.h>

using namespace std;

typedef struct {
	double x, y, z;
} Point; 
typedef struct {
	float x, y, z;
} Vector;
typedef struct {
	Point P0, P1;
} Line;
typedef struct {
	Point P0, P1;
} Segment;
typedef struct {
	Point P0, Vector n;
}Plane;

// dot product (3D) which allows vector operations in arguments
#define dot(u,v)   ((u).x * (v).x + (u).y * (v).y + (u).z * (v).z)
#define norm(v)     sqrt(dot(v,v))     // norm = length of  vector
#define d(u,v)      norm(u-v)          // distance = norm of difference

//===================================================================
/*
dist_Point_to_Line(): get the distance of a point to a line
Input:  a Point P and a Line L (in any dimension)
Return: the shortest distance from P to L
*/
float dist_Point_to_Line(Point P, Line L)
{
	Vector v = L.P1 - L.P0;
	Vector w = P - L.P0;
	double c1 = dot(w, v);
	double c2 = dot(v, v);
	double b = c1 / c2;
	Point Pb = L.P0 + b * v;
	return d(P, Pb);
}
//===================================================================
/*
dist_Point_to_Segment(): get the distance of a point to a segment
Input:  a Point P and a Segment S (in any dimension)
Return: the shortest distance from P to S
*/
float dist_Point_to_Segment(Point P, Segment S)
{
	Vector v = S.P1 - S.P0;
	Vector w = P - S.P0;

	double c1 = dot(w, v);
	if (c1 <= 0)
		return d(P, S.P0);

	double c2 = dot(v, v);
	if (c2 <= c1)
		return d(P, S.P1);

	double b = c1 / c2;
	Point Pb = S.P0 + b * v;
	return d(P, Pb);
}
//===================================================================
/* dist_Point_to_Plane(): get distance (and perp base) from a point to a plane
Input:  P  = a 3D point
PL = a  plane with point V0 and normal n
Output: *B = base point on PL of perpendicular from P
Return: the distance from P to the plane PL
*/
float dist_Point_to_Plane(Point P, Plane PL, Point* B)
{
	float    sb, sn, sd;

	sn = -dot(PL.n, (P - PL.V0));
	sd = dot(PL.n, PL.n);
	sb = sn / sd;

	*B = P + sb * PL.n;
	return d(P, *B);
}
//===================================================================