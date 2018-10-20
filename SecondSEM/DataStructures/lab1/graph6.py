import networkx as nx
import matplotlib.pyplot as plt
import math
import pylab


graph = nx.Graph()
graph = nx.read_edgelist(r'C:\\Users\\alper\\Documents\\GitHub\\smada\\SecondSEM\\DataStructures\\lab1\\graf.txt', delimiter=";",
                         create_using=nx.DiGraph(), nodetype=int, data=(('weight', float),))
edges = graph.edges()

nodes = graph.nodes()

node_edges = graph.edges([1])

weight12 = graph[1][2]["weight"]

neighbors = graph[1]




#  1  function Dijkstra(Graph, source):
def dijkstra(G, source):
    #  3      create vertex set Q
    Q = []
    dist = {}
    prev = {}

    #  5      for each vertex v in Graph:             // Initialization
    for v in G:
        #  6          dist[v] ← INFINITY                  // Unknown distance from source to v
        dist[v] = float('inf')
        #  7          prev[v] ← UNDEFINED                 // Previous node in optimal path from source
        prev[v] = None
        #  8          add v to Q                          // All nodes initially in Q (unvisited nodes)
        Q.append(v)

    # 10      dist[source] ← 0                        // Distance from source to source
    dist[source] = 0.0
    # 12      while Q is not empty:

    #print("Q", Q)
    minimum_vertex = -1
    while len(Q) > 0:
        # 13          u ← vertex in Q with min dist[u]    // Node with the least distance will be selected first
        minimum = float(math.inf)
        for vertex in Q:
            if dist[vertex] < minimum:
                minimum = dist[vertex]
                minimum_vertex = vertex
        # 15          remove u from Q
        Q.remove(minimum_vertex)

        # 17          for each neighbor v of u:           // where v is still in Q.
        for v in G[minimum_vertex]:
            # 18              alt ← dist[u] + length(u, v)
            alt = dist[minimum_vertex] + G[minimum_vertex][v]["weight"]
            # 19              if alt < dist[v]:               // A shorter path to v has been found
            if alt < dist[v]:
                # 20                  dist[v] ← alt
                dist[v] = alt
                # 21                  prev[v] ← u
                prev[v] = minimum_vertex
                # 23      return dist[], prev[]
    return dist, prev


# 0 reverse_iteration
def find_shortest_path(prev, start, finish):
    # 1  S ← empty sequence
    sequence = []
    # 2  u ← target
    u = finish
    # 3  if prev[u] is defined or u = source:          // Do something only if the vertex is reachable
    if u == start or u in prev.keys():
        # 4      while u is defined:                       // Construct the shortest path with a stack S
        while u is not None:
            # 5          insert u at the beginning of S        // Push the vertex onto the stack
            sequence.append(u)
            # 6          u ← prev[u]                           // Traverse from target to source
            u = prev[u]
    sequence = list(reversed(sequence))
    return sequence


distance, previous = dijkstra(graph, 1)

road = find_shortest_path(previous, 1, 20)
print(road)


fig = plt.figure(tight_layout=False)
for e in graph.edges():
    graph[e[0]][e[1]]['color'] = 'yellow'
    graph[e[0]][e[1]]['width'] = 1.0

for i in range(0, len(road)-1):
    graph[road[i]][road[i+1]]['color'] = 'red'
    graph[road[i]][road[i+1]]['width'] = 5.0


pos = nx.spring_layout(graph)
edge_labels = dict([((u, v,), d['weight'])
                    for u, v, d in graph.edges(data=True)])
edge_color_list = [graph[e[0]][e[1]]['color'] for e in graph.edges()]
widths = [graph[u][v]["width"] for u, v in edges]
nx.draw(graph, pos, edges=edges, edge_color=edge_color_list,
        with_labels=True, font_weight='bold', width=widths)



dges2 = []
nodes2 = []
weights2 = []
graph2 = nx.DiGraph()
for i in range(0, len(road)-1):
    graph2.add_edge(road[i], road[i+1],
                    weight=graph[road[i]][road[i+1]]['weight'])
    graph2.add_node(road[i])
    if i == len(road)-1:
        graph2.add_node(road[i+1])
    graph2[road[i]][road[i+1]]['width'] = 5.0
    graph2[road[i]][road[i+1]]['color'] = 'red'
pos2 = nx.spring_layout(graph2)
labels2 = nx.get_edge_attributes(graph2, 'weight')
edge_color_list2 = [graph2[e[0]][e[1]]['color'] for e in graph2.edges()]
widths = [graph2[u][v]["width"] for u, v in graph2.edges()]
nx.draw(graph2, pos, edge_color=edge_color_list2, with_labels=True,
        font_weight='bold', width=widths, weight=weights2)
nx.draw_networkx_edge_labels(graph2, pos, edge_labels=labels2)

import networkx as nx

path = 'C:\\Users\\alper\\Documents\\GitHub\\smada\\SecondSEM\\DataStructures\\lab1\\graf.txt'
example = open(path, 'r')

G = nx.Graph()
# G1 = nx.path_graph()

for line in example:
    line = line.split()
    # print(line[0])
    G.add_edge(line[0], line[1], weight=line[2])
    #G.add_nodes_from(line[0], line[1])
    #nx.shortest_path(G,[source, target, weight])

# print(nx.dijkstra_path(G,0,4))
# print(nx.shortest_path(G))
print("average shortest path length")
print(nx.average_shortest_path_length(G, method='dijsktra'))
print(distance[20])
