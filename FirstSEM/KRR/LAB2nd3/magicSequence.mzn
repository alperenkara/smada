%%%%%%%%%%%%%% 
% PARAMETERS        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Length of the sequence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
include "globals.mzn";
int: n; 
%%%%%%%%%%%%%% 
% VARIABLES        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The sequence itself
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set of int: range=0..n-1;
array[range] of var range:magic; 
%%%%%%%%%%%%%%%
% Constraints 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tips:                                 
% - sum(array) return sum of the array's elements 
% - you can use bool's like integers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
constraint forall(i in range)(
  magic[i] = sum([bool2int(i == magic[j]) | j in range])

);
constraint forall([magic[i] == count(magic, i) | i in 0..n-1]);

solve satisfy;
%%%%%%%%%%%%%%%%%%%%%%%%
% EXAMPLE OUTPUT  
%%%%%%%%%%%%%%%%%%%%%%%%
% - magic - magic sequence     
%%%%%%%%%%%%%%%%%%%%%%%%
output [ "magic sequence = ", show(magic),";\n"];
