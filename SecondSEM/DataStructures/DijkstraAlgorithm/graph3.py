import networkx as nx
import matplotlib
import math

#drawing and the creation of the graph
path = 'C:\\Users\\alper\\Documents\\GitHub\\smada\\SecondSEM\\DataStructures\\lab1\\graf.txt'
graph = nx.Graph()
graph = nx.read_edgelist(path, delimiter=";", create_using=nx.DiGraph(), nodetype=int, data=(('weight',float),))
print(graph.edges())
#[(1, 16), (1, 9), (1, 10), (1, 5), (1, 18), (1, 2), (16, 1), (16, 11), (16, 15), (16, 13), (8, 20), (8, 19), (8, 18), (8, 3), (8, 2), (8, 12), (8, 4), (8, 14), (20, 8), (20, 13), (20, 16), (20, 5), (20, 4), (20, 15), (20, 12), (17, 16), (17, 6), (17, 18), (10, 1), (10, 7), (10, 11), (10, 16), (10, 15), (10, 18), (6, 20), (6, 9), (6, 5), (6, 2), (15, 5), (15, 3), (15, 18), (5, 9), (5, 19), (5, 18), (5, 7), (5, 1), (5, 10), (5, 11), (13, 9), (13, 14), (13, 18), (13, 12), (13, 11), (13, 10), (13, 17), (9, 16), (9, 8), (9, 1), (9, 17), (9, 5), (19, 7), (19, 18), (19, 1), (19, 16), (19, 11), (19, 9), (19, 13), (19, 15), (7, 12), (7, 3), (7, 6), (18, 5), (18, 12), (18, 13), (14, 19), (14, 13), (14, 2), (14, 12), (14, 9), (14, 20), (14, 4), (4, 15), (4, 9), (4, 14), (4, 7), (12, 2), (12, 20), (12, 18), (12, 15), (12, 17), (3, 15), (3, 10), (3, 9), (3, 1), (3, 6), (2, 3), (2, 1), (11, 10), (11, 5), (11, 3)]
print(graph.nodes())
#[1, 16, 8, 20, 17, 10, 6, 15, 5, 13, 9, 19, 7, 18, 14, 4, 12, 3, 2, 11]
#printing node_edges
node_edges = graph.edges([1])
print(node_edges)
#[(1, 16), (1, 9), (1, 10), (1, 5), (1, 18), (1, 2)]
#getting out weights
weight12 = graph[1][2]["weight"]
print(weight12)