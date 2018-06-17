import numpy as np
import random
import math
import sys

ni = 12
nh = 3
no = 2 

iNodes = np.zeros(shape=[ni], dtype=np.float32)
hNodes = np.zeros(shape=[nh], dtype=np.float32)
oNodes = np.zeros(shape=[no], dtype=np.float32)

print(iNodes)
idx = 0
for i in range(ni):
    for j in range(nh):
        ihWeights[i,j] = weights[idx]
        idx += 1