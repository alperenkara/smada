import networkx as nx
import matplotlib.pyplot as plt
import math
import pylab
path = 'C:\\Users\\alper\\Documents\\GitHub\\smada\\SecondSEM\\DataStructures\\lab1\\graf.txt'
example = open(path, 'r')
# drawing and the creation of the graph
graph = nx.Graph()
graph = nx.read_edgelist('C:\\Users\\alper\\Documents\\GitHub\\smada\\SecondSEM\\DataStructures\\lab1\\graf.txt', delimiter=";",
                         create_using=nx.DiGraph(), nodetype=int, data=(('weight', float),))
edges = graph.edges()
#print(graph.edges())
# [(1, 16), (1, 9), (1, 10), (1, 5), (1, 18), (1, 2), (16, 1), (16, 11), (16, 15), (16, 13), (8, 20), (8, 19), (8, 18), (8, 3), (8, 2), (8, 12), (8, 4), (8, 14), (20, 8), (20, 13), (20, 16), (20, 5), (20, 4), (20, 15), (20, 12), (17, 16), (17, 6), (17, 18), (10, 1), (10, 7), (10, 11), (10, 16), (10, 15), (10, 18), (6, 20), (6, 9), (6, 5), (6, 2), (15, 5), (15, 3), (15, 18), (5, 9), (5, 19), (5, 18), (5, 7), (5, 1), (5, 10), (5, 11), (13, 9), (13, 14), (13, 18), (13, 12), (13, 11), (13, 10), (13, 17), (9, 16), (9, 8), (9, 1), (9, 17), (9, 5), (19, 7), (19, 18), (19, 1), (19, 16), (19, 11), (19, 9), (19, 13), (19, 15), (7, 12), (7, 3), (7, 6), (18, 5), (18, 12), (18, 13), (14, 19), (14, 13), (14, 2), (14, 12), (14, 9), (14, 20), (14, 4), (4, 15), (4, 9), (4, 14), (4, 7), (12, 2), (12, 20), (12, 18), (12, 15), (12, 17), (3, 15), (3, 10), (3, 9), (3, 1), (3, 6), (2, 3), (2, 1), (11, 10), (11, 5), (11, 3)]
nodes = graph.nodes()
#print(graph.nodes())
# [1, 16, 8, 20, 17, 10, 6, 15, 5, 13, 9, 19, 7, 18, 14, 4, 12, 3, 2, 11]
# printing node_edges
node_edges = graph.edges([1])
#print(node_edges)
# [(1, 16), (1, 9), (1, 10), (1, 5), (1, 18), (1, 2)]
# getting out weights
weight12 = graph[1][2]["weight"]
#print(weight12)
# 3.0
neighbors = graph[1]
#print(neighbors)


# {16: {'weight': 48.0}, 9: {'weight': 113.0}, 10: {'weight': 75.0}, 5: {'weight': 97.0}, 18: {'weight': 181.0}, 2: {'weight': 3.0}}

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


""" # 0 reverse_iteration
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
 """

distance, previous = dijkstra(graph, 1)
print("distance", distance)
print("previous", previous)
# road = find_shortest_path(previous, 1, 20)
print(road)
print("comparison with inbuilt function dijkstra_path")
test_path = nx.dijkstra_path(graph, 1, 20)
print("comparison path", test_path)

#now the image of the graph

""" fig = plt.figure(tight_layout=False)
for e in graph.edges():
    graph[e[0]][e[1]]['color'] = 'yellow'
    graph[e[0]][e[1]]['width'] = 1.0

for i in range(0,len(road)-1):
    graph[road[i]][road[i+1]]['color'] = 'red'
    graph[road[i]][road[i+1]]['width'] = 5.0 """


pos = nx.spring_layout(graph)
edge_labels=dict([((u,v,),d['weight']) for u,v,d in graph.edges(data=True)])
edge_color_list = [graph[e[0]][e[1]]['color'] for e in graph.edges() ]
widths = [graph[u][v]["width"] for u,v in edges]
nx.draw(graph, pos, edges = edges, edge_color = edge_color_list, with_labels=True, font_weight='bold', width = widths)
#nx.draw_networkx_edge_labels(G,pos,edge_labels=edge_labels)
#plt.show()
pylab.show()

#a single path
edges2 = []
nodes2 = []
weights2 = []
graph2 = nx.DiGraph()
""" for i in range(0,len(road)-1):
    graph2.add_edge(road[i], road[i+1], weight = graph[road[i]][road[i+1]]['weight'])
    graph2.add_node(road[i])
    if i==len(road)-1:
        graph2.add_node(road[i+1])
    graph2[road[i]][road[i+1]]['width'] = 5.0
    graph2[road[i]][road[i+1]]['color'] = 'red'
pos2 = nx.spring_layout(graph2)
labels2 = nx.get_edge_attributes(graph2, 'weight')
edge_color_list2 = [graph2[e[0]][e[1]]['color'] for e in graph2.edges()]
widths = [graph2[u][v]["width"] for u,v in graph2.edges()]
nx.draw(graph2, pos, edge_color = edge_color_list2, with_labels=True, font_weight='bold', width = widths, weight = weights2)
nx.draw_networkx_edge_labels(graph2,pos,edge_labels=labels2)
#plt.show() """
pylab.show()


#tests
distance, previous = dijkstra(graph, 2)
# road = find_shortest_path(previous, 2, 15)
print(road)
print("comparison with inbuilt function dijkstra_path")
test_path = nx.dijkstra_path(graph, 2, 15)
print("comparison path", test_path)


distance, previous = dijkstra(graph, 3)
# road = find_shortest_path(previous, 3, 11)
print(road)
print("comparison with inbuilt function dijkstra_path")
test_path = nx.dijkstra_path(graph, 3, 11)
print("comparison path", test_path)
