from Function import updateRoom
from Function import updateRoom3D
from Plot import displayRoom
import numpy as np
L,W,H = 3,3
Grid = np.zeros((L,W))
plant = [[2,1]]
a = [1]
D = 0.001
source = [[0,0]]
Q = 27*(10**-6)
model = int(input("Which model?"))
mean = []
def test():
    print(Grid[0,1])
    print(Grid[1,1])
    print(Grid[2,1])
for t in range(1, int(input("How many seconds?"))+1):
    updateRoom(Grid, plant, source, t, Q, a,D,L,W,model)
    test()
    #displayRoom(Grid,t)
    mean.append(np.mean(Grid, dtype=np.float64))
print(mean)
