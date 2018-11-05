import networkx as nx
import math
from collections import defaultdict
import scipy
from scipy import sparse

path = r"C:\Users\alper\Documents\GitHub\smada\SecondSEM\DataStructures\lab2\graf1.txt"
graph = nx.DiGraph()
graph = nx.read_edgelist(path, delimiter="\t",
                         create_using=nx.DiGraph(), nodetype=int, data=(('capacity', float), ))

for i in graph.edges():           #To genurate and print the founded cycles
    graph[i[0]][i[1]]['flow'] = 0.00
    adjacency = [(n, nbrdict) for n, nbrdict in graph.adjacency ()]
#print("cycles found :")
#print(nx.find_cycle(graph))
X = nx.adj_matrix(graph)
X = X.todense()
adjacencySparse = X


def ford_fulkerson(graph, source, sink, debug=None):          # To implement ford fulkerson algorithm:
    graph = nx.graph.deepcopy(graph)
    flow, path = 0, True
    graph2 = nx.to_dict_of_dicts(graph)
    path = nx.shortest_path(graph, source, sink)
    while path:               # searching for the path with the flow reserve
        reserve = float(math.inf)
        #print(path)
        for x in range(0,len(path)-1):
            rate = graph[path[x]][path[x+1]]['capacity']
            if (rate < reserve):
                reserve = graph[path[x]][path[x+1]]['capacity']
        flow += reserve
        for x in range(0, len(path) - 1):
            graph[path[x]][path[x + 1]]['capacity'] -= reserve
            graph[path[x]][path[x + 1]]['flow'] += reserve

        for x in range(0, len(path) - 1):           #The removed vertices
            if(graph[path[x]][path[x + 1]]['capacity']) <=0:
                #print("Deleted :",path[x], path[x+1])
                graph.remove_edge(path[x], path[x+1])

        for v, u in zip(path, path[1:]):                     # Increasing the flow along the path
            if graph.has_edge(v, u):
                graph[v][u]['flow'] += reserve
            else:
                if( graph.has_edge(u,v)):
                    graph[u][v]['flow'] -= reserve

        try:
            path = nx.shortest_path(graph,source,sink)
        except:
            path = None

        if callable(debug):                         # showing interpose results
            debug(graph, path, reserve, flow)
    return flow


def depth_first_search(J, source, sink):
    not_directed = J.to_undirected()
    not_directed = nx.to_dict_of_dicts(not_directed)
    scout = {source}
    heap = [(source, 0, not_directed[source])]

    while heap:                 #searching neighbors
        v, _, neighbours = heap[-1]
        if v == sink:
            break

        while neighbours:         #function searching the next neighbor
            u, e = neighbours.popitem()
            if u not in scout:
                break
        else:
            heap.pop()
            continue

        in_direction = G.has_edge(v, u)     #The capacity
        capacity = e['capacity']
        flow = e['flow']

        if in_direction and flow < capacity:    #to make the flow from edges increasing
            heap.append((u, capacity - flow, not_directed[u]))
            scout.add(u)
        elif not in_direction and flow:
            heap.append((u, flow, not_directed[u]))
            scout.add(u)

    reserve = min((f for _, f, _ in stack[1:]), default=0)
    path = [v for v, _, _ in stack]

    return path, reserve


f = ford_fulkerson(graph, 10, 60)
print("from 10 to 60")
print(f)

mmax = -1
xx = None
for x in graph.nodes():
        y =  ford_fulkerson(graph, 10,x )
        if (mmax < y):
            xx = x
            print(y, "  ", xx)
        mmax = max(y,mmax)

print(mmax, "  ",xx)
