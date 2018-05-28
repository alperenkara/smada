import numpy as np 

weights = np.array([1,2])

input_data = np.array([3,4])
#target prediction value
target = 6

learning_rate = 0.01
#actual prediction value
preds = (weights * input_data).sum()

print("preds " + str(preds))
#error
error = preds - target 

print(error)
#error = 5
gradient = 2*input_data*error
#gradient: array([30,40])
#weights ([1,2]), learningrate = .01 , gradient: ([30,40])

#weights_updated: ([1,2])-(0.01*([30,40]))
weights_updated = weights - learning_rate * gradient
print("weights_updated "+str(weights_updated))

preds_updated = (weights_updated * input_data).sum()
print("preds_updated "+str(preds_updated))

error_updated = preds_updated - target
print(error_updated)