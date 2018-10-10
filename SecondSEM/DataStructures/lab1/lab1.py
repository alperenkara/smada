import networkx as nx

path = 'C:\\Users\\alper\\Documents\\GitHub\\smada\\SecondSEM\\DataStructures\\lab1\\graf.txt'
example = open(path, 'r')

G = nx.Graph()
# G1 = nx.path_graph()

for line in example:
    line = line.split()
    #G.add_edge(line[0], line[1], weight=line[2])
    G.add_nodes_from(line[0], line[1])
    #nx.shortest_path(G,[source, target, weight])
    
#print(nx.dijkstra_path(G,0,4))
print(nx.shortest_path(G))
print(nx.average_shortest_path_length(G,method='dijsktra'))
