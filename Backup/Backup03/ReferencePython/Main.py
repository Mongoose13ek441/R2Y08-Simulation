from Function import updateRoom
from Plot import displayRoom
import numpy as np
Grid = np.zeros((5,5))
objectGrid = np.zeros((5,5))
mean = []
t = 0
for k in range(0, int(input("How many seconds?"))):
    updateRoom(Grid, t)
    displayRoom(Grid,t)
    mean.append(np.mean(Grid, dtype=np.float64))
print(mean)