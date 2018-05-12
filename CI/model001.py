#first deep learning model 

#forward propagation algorithm 
#multiply-add process
#dot product

import numpy as np 

input_data = np.array([2,3])

print(input_data)

weights = {
    'node_0':np.array([1,1]),
    'node_1':np.array([-1,1]),
    'output':np.array([2,-1]),
}

node_0_value = (input_data * weights['node_0']).sum()
node_1_value = (input_data * weights['node_1']).sum()

hidden_layer_outputs = np.array([node_0_value, node_1_value])
output = (hidden_layer_outputs*weights['output']).sum()
print(output)
