int: nodesNumber;
array[1..nodesNumber, 1..nodesNumber] of bool: edges;

array[1..nodesNumber] of var 1..nodesNumber: nodes;
var 1..nodesNumber: colorsNumber = max(nodes);

constraint forall(i,j in 1..nodesNumber where edges[i,j])(nodes[i] != nodes[j]);

solve minimize colorsNumber;

%%%%%%%%%%%%%%%%%%%%%%%%
% OUTPUT EXAMPLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - colorsNumber - number of used colors
% - nodes - array of vertices with assigned colors                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output [show(colorsNumber), " colors\n",] ++
       [show(nodes[i]) ++ " " | i in 1..nodesNumber]