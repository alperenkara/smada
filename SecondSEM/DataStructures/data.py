point = {'A + ': 4.0, 'A' : 4.0, 'A -' : 3.67, 'B +' : 3.33, 'B' : 3.0, 'B -' : 2.67,
'C +' : 2.33, 'C' : 2.0, 'C -' : 1.67, 'D + ': 1.33, 'D ': 1.0, 'F ': 0.0 }

num_courses = 0
total_points = 0
done = False
while not done:
    grade = input()  # read line from user
 if grade == ''  # empty line was entered
    done = True
 elif grade not in points:  # unrecognized grade entered
    print("Unknown grade {0} being ignored".format(grade))
 else:
    num courses += 1
    total points += points[grade]
 if num courses > 0:  # avoid division by zero
    print(Your GPA is {0: .3} .format(total points / num courses))