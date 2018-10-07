%%%%%%%%%%%%% 
% VARIABLES 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% add variables with correct domains 
% tip:                       
% var 1..N: x; declares a variable with domain 1..N   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
int: N = 5;
%int: rows;
array [1..N] of var 1..N: q; % queen is column i is in row q[i]
array [1..N] of var 1..N: c;
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
constraint forall (i in 1..N, j in i+1..N) (q[i] != q[j]);
constraint forall (i in 1..N, j in i+1..N) (q[i] != q[j]+j-i);
constraint forall (i in 1..N, j in i+1..N) (q[i] != q[j]-(j-i));      
constraint forall (i in 1..N, j in i+1..N) (c[j] != c[i]);
constraint forall (i in 1..N, j in i+1..N) (c[j] != c[i]+i-j);
constraint forall (i in 1..N, j in i+1..N) (c[j] != c[i]-(i-j)); 
constraint inverse()
solve satisfy; 
  
%%%%%%%%%%%%%%%%%%%
% OUTPUT EXAMPLE  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - rows[i] - queen's position in the ith row   
% - N - number of queens                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

output [ if fix(q[j]) == i then "Q" else "." endif ++
  if j == N then "\n" else "" endif | i,j in 1..N]
