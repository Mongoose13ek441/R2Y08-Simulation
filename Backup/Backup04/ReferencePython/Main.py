from Function import updateRoom
from Function import updateRoom3D
from Plot import displayRoom
import numpy as np
Grid = np.zeros((5,5,5))
objectGrid = np.zeros((5,5,5))
mean = []
def test():
    print(Grid[0,1,0])
    print(Grid[1,1,0])
    print(Grid[2,1,0])
for t in range(1, int(input("How many seconds?"))+1):
    updateRoom3D(Grid, t)
    test()
    #displayRoom(Grid,t)
    mean.append(np.mean(Grid, dtype=np.float64))
print(mean)
