import os
import re
from classes import *
from distances import dist


def getData(filePath):
    script_dir = os.path.dirname(__file__)
    abs_file_path = os.path.join(script_dir, filePath)
    with open(abs_file_path, "r") as f:
        solids = [
            Solid([
                Face(*[
                    Point(*[float(cor) for cor in point.split(";")])
                    for point in face.split("\n") if point != ""
                ]) for face in solid.split("\n\n") if face != ""
            ]) for solid in re.split("--- SOLID \[\d*\]---", f.read())
            if solid != ""
        ]
    return solids


# 2a
exemplaryFaces = [
    Face(Point(1, 0, 0), Point(0, 1, 0), Point(0, 0, 0)),
    Face(Point(100, 0, 0.13), Point(0, 100, 0.13), Point(-100, -100, 0.13))
]

solids = getData('solid_data.txt')
print('Between faces (2a):', dist(exemplaryFaces[0], exemplaryFaces[1]))
print('Between solids:', dist(solids[0], solids[1]))