import networkx as nx
import math
from collections import defaultdict
import scipy
from scipy import sparse

path = r"C:\Users\alper\Documents\GitHub\smada\SecondSEM\DataStructures\lab2\graf1.txt"
graph = nx.DiGraph()
graph = nx.read_edgelist(path, delimiter="\t",
                         create_using=nx.DiGraph(), nodetype=int, data=(('capacity', float), ))
for i in graph.edges():
    graph[i[0]][i[1]]['flow'] = 0.00

adjacency = [(n, nbrdict) for n, nbrdict in graph.adjacency()]
print("Cycles")
print(nx.find_cycle(graph))


A = nx.adj_matrix(graph)
A = A.todense()
adjacencySparse = A


def ford_fulkerson(graph, source, sink, debug=None):
    flow, path = 0, True
    graph2 = nx.to_dict_of_dicts(graph)
    path = nx.shortest_path(graph, source, sink)

    while path:

        reserve = float(math.inf)
        print(path)
        for x in range(0, len(path)-1):
            value = graph[path[x]][path[x+1]]['capacity']
            if (value < reserve):
                reserve = graph[path[x]][path[x+1]]['capacity']
        flow += reserve

        for x in range(0, len(path) - 1):
            graph[path[x]][path[x + 1]]['capacity'] -= reserve
            graph[path[x]][path[x + 1]]['flow'] += reserve

        for x in range(0, len(path) - 1):
            if(graph[path[x]][path[x + 1]]['capacity']) <= 0:
                print("REMOVED", path[x], path[x+1])
                graph.remove_edge(path[x], path[x+1])

        # increase flow along the path
        for v, u in zip(path, path[1:]):
            if graph.has_edge(v, u):
                graph[v][u]['flow'] += reserve
            else:
                if(graph.has_edge(u, v)):
                    graph[u][v]['flow'] -= reserve

        try:
            path = nx.shortest_path(graph, source, sink)
        except:
            path = None

        # show intermediate results
        if callable(debug):
            debug(graph, path, reserve, flow)
    return flow


def depth_first_search(G, source, sink):
    undirected = G.to_undirected()
    undirected = nx.to_dict_of_dicts(undirected)
    explored = {source}
    stack = [(source, 0, undirected[source])]

    while stack:
        v, _, neighbours = stack[-1]
        if v == sink:
            break

        while neighbours:
            u, e = neighbours.popitem()
            if u not in explored:
                break
        else:
            stack.pop()
            continue

        # current flow and capacity
        in_direction = G.has_edge(v, u)
        capacity = e['capacity']
        flow = e['flow']

        # edge
        if in_direction and flow < capacity:
            stack.append((u, capacity - flow, undirected[u]))
            explored.add(u)
        elif not in_direction and flow:
            stack.append((u, flow, undirected[u]))
            explored.add(u)

    # source and sink
    reserve = min((f for _, f, _ in stack[1:]), default=0)
    path = [v for v, _, _ in stack]

    return path, reserve


f = ford_fulkerson(graph, 10, 60)
print(f)

#  flow from the source s=10 is reached.
mmax = -1
xx = None
for x in graph.nodes():
    y = ford_fulkerson(graph, 10, x)
    if (mmax < y):
        xx = x
        print(y, "  ", xx)
    mmax = max(y, mmax)

print(mmax, "  ", xx)
