%%%%%%%%%%%%% 
% VARIABLES 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% add variables with correct domains 
% tip:                       
% var 1..N: x; declares a variable with domain 1..N   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
int: N;
%int: rows;
array [1..N] of var 1..N: q; % queen is column i is in row q[i]
%
%
% array [1..N] of var 1..N: c;
%%%%%%%%%%%%%
% CONSTRAINTS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% add constraints
% tip:
% row_i = row_j (-/+) (j - i)                 
% matches queens placed on the same diagonal, where:
% - i,j - column index
% - row_n - queen's position in the nth col 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% int_search(q, smallest, indomain_min, complete);
% int_search(q, input_order, indomain_median, complete);
% int_search(q, first_fail, indomain_min, complete);
% int_search(q, first_fail, indomain_median, complete);

constraint forall (i in 1..N, j in i+1..N) 
%N equal to 5 therefore i=[1,2,3,4,5] j=[2,3,4,5]
(q[i] != q[j]);
constraint forall (i in 1..N, j in i+1..N) 
(q[i] != q[j]+j-i);
constraint forall (i in 1..N, j in i+1..N) 
(q[i] != q[j]-(j-i));      

%solve satisfy; 
solve :: int_search(q, first_fail, indomain_max, complete) satisfy;

%%%%%%%%%%%%%%%%%%%
% OUTPUT EXAMPLE  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - rows[i] - queen's position in the ith row   
% - N - number of queens                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output [ if fix(q[j]) == i then "Q" else "." endif ++
  if j == N then "\n" else "" endif | i,j in 1..N]