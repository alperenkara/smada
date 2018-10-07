import numpy as np
def relu(input):
    '''Define your relu activation function here'''
    # Calculate the value for the output of the relu function: output
    output = max(input, 0)
    # Return the value just calculated
    return(output)
def predict_with_network(input_data):
    # Calculate node 0 in the first hidden layer
    node_0_0_input = (weights['node_0_0']* input_data).sum()
    node_0_0_output = relu(node_0_0_input)

    # Calculate node 1 in the first hidden layer
    node_0_1_input = (weights['node_0_1']* input_data).sum()
    node_0_1_output = relu(node_0_1_input)

    # Put node values into array: hidden_0_outputs
    hidden_0_outputs = np.array([node_0_0_output, node_0_1_output])
    
    # Calculate node 0 in the second hidden layer
    node_1_0_input = (weights['node_1_0']*hidden_0_outputs).sum()
    node_1_0_output = relu(node_1_0_input)

    # Calculate node 1 in the second hidden layer
    node_1_1_input = (weights['node_1_1']* hidden_0_outputs).sum()
    node_1_1_output = relu(node_1_1_input)

    # Put node values into array: hidden_1_outputs
    hidden_1_outputs = np.array([node_1_0_output, node_1_1_output])

    # Calculate model output: model_output
    model_output = (weights['output']* hidden_1_outputs).sum()
    
    # Return model_output
    return(model_output)