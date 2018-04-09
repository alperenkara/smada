%four variables
%q1 q2 q3 q4
%select q1 from the left 
%assign a value to q1=1(first step)
%q2 = 3 (impossible!), q2=4 -> q3 = 2 -> 
%we get back to beginning q1 = 2 -> q2 = 4 -> q3 = 1 -> q4 = 3 !!! :)
%choose smallest domain q1 = {1,2,3,4} 
%q2 = {1,2,3,4}
%q3 = {1,2,3,4}, q4 = {1,2,3,4}
%q2 has the smallest domain


%%%%Packing Problem
%packing squere 
%having n squeres (growing size) look for the smallest rectangle 
%test, project
int: x = 3;
int: y = 4;
predicate smallx(var int:y) = -x <= y /\ y <= x;
predicate p(int: u, var bool: y) = 
      exists(x in 1..u)(y \/ smallx(x));
constraint p(x,false);
solve satisfy;