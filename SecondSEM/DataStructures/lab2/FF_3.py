import networkx as nx
import math

# drawing and the creation of the graph
path = r"C:\Users\alper\Documents\GitHub\smada\SecondSEM\DataStructures\lab2\graf1.txt"
graph = nx.DiGraph()
graph = nx.read_edgelist(path, delimiter="\t",
                         create_using=nx.DiGraph(), nodetype=int, data=(('capacity', float), ))
for i in graph.edges():
    graph[i[0]][i[1]]['flow'] = 0.00
adjacency = [(n, nbrdict) for n, nbrdict in graph.adjacency()]


A = nx.adj_matrix(graph)
A = A.todense()
adjacencySparse = A


def ford_fulkerson(initialGraph, source, sink):
    flow, path = 0, True
    graph = nx.graph.deepcopy(initialGraph)
    
    path, res = depth_first_search(graph, source, sink)
    while path:
       
        reserve = float(math.inf)
        for x in range(0,len(path)-1):
            value = graph[path[x]][path[x+1]]['capacity']
            if (value < reserve):
                reserve = graph[path[x]][path[x+1]]['capacity']
        flow += reserve

        for x in range(0, len(path) - 1):
            graph[path[x]][path[x + 1]]['capacity'] -= reserve
            graph[path[x]][path[x + 1]]['flow'] += reserve

        for x in range(0, len(path) - 1):
            if(graph[path[x]][path[x + 1]]['capacity']) <= 0:
                graph.remove_edge(path[x], path[x+1])

       
        for v, u in zip(path, path[1:]):
            if graph.has_edge(v, u):
                graph[v][u]['flow'] += reserve
            else:
                if( graph.has_edge(u,v)):
                    graph[u][v]['flow'] -= reserve

        try:
            path = nx.shortest_path(graph,source,sink)
        except:
            path = None

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

        # search the next neighbour
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

        # increase or redirect flow at the edge
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


def traverseGraph(G, start):
    successors = G[start]
    stack = []
    traversed = []
    for x in successors:
        traversed.append(x)
        stack.append(x)
    while len(stack) != 0:
        element = stack[-1]
        successors = G[element]
        stack.remove(element)
        for x in successors:
            if x not in traversed:
                traversed.append(x)
                stack.append(x)
    return traversed


def findAllMax(G, source):
    
    lista = []
    stack = traverseGraph(G, source)
    while len(stack) != 0:
        element = stack[-1]
        if (element != source):
            m = ford_fulkerson(G, source, element)
            #m = nx.maximum_flow_value(G, source, element)
            tuple = (m, element)
            lista.append(tuple)
        stack.remove(element)
    return lista

def MaximumResult(list):
    filteredResults = []
    maximum = -10000
    for x in list:
        if round(x[0], 4) > maximum:
            maximum = round(x[0], 4)
    for x in list:
        
        if round(x[0],4) == maximum:
            filteredResults.append(x)
    return filteredResults


print(nx.maximum_flow_value(graph, 10, 90))
results = findAllMax(graph, 10)


r = MaximumResult(results)

print(r)
