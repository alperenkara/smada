0.8::edge(1,2).
0.2::edge(1,3).
0.2::edge(1,4).
0.2::edge(2,3).
0.7::edge(3,5).
0.3::edge(4,5).

% there is a direct path between the nodes, if there is an edge between those nodes
path(A,B) :- edge(A,B).
% there is a indirect path between the nodes, if there is an intermediate node
% that can be reached directly from the first node, and from which you can reach the second node
path(A,C) :- edge(A,B),
             B \= C,
             path(B,C).

query(path(1,5)).