#importing packages
import math
import mpmath
import matplotlib.pyplot as plt
import numpy as np
import csv
#initialize arrays for rooms
objectGrid = np.zeros((5,5,5))
coGrid = np.zeros((5,5,5))
hchoGrid = np.zeros((5,5,5))
t = 1
#place elements in object grid
objectGrid[0,0,0] = 5
#function for updating room
def roomUpdate():
    for x in range(0,5):
        for y in range(0,5):
            for z in range(0,5):
                #gas dispersion
                coGrid[x,y,z] = gasdisp(x,y,z,t, 125, 0.19)
                hchoGrid[x,y,z] = gasdisp(x,y,z,t, 125, 0.18)
                #plant depollution
#function for plotting room data
def plotData(grid,gas,t):
    print(grid)
    import seaborn as sns
    sns.heatmap(grid, annot=True,  linewidths=.5)
    plt.title("Room Concentrations at t = "+str(t))
    plt.xlabel("length")
    plt.ylabel("width")
    plt.show()
    plt.savefig(gas+"\Roomtime "+str(t))
    plt.close()
    print(test)
#function for recording data

#function for gas dispersion
def gasdisp(x = 1,y = 1, z = 1, t = 1, Q = 125, D = 0.001, x0 = 0, y0 = 0, z0 = 0, L = 5, W = 5, H = 5):
    Rx = mpmath.nsum(lambda n: (math.exp(-((x+(2*n*L)-x0)**2)/(4*D*t))+math.exp(-((x+(2*n*L)+x0)**2)/(4*D*t))),[-math.inf,math.inf])
    Ry = mpmath.nsum(lambda n: (math.exp(-((y+(2*n*W)-y0)**2)/(4*D*t))+math.exp(-((y+(2*n*W)+y0)**2)/(4*D*t))),[-math.inf,math.inf])
    Rz = mpmath.nsum(lambda n: (math.exp(-((z+(2*n*H)-z0)**2)/(4*D*t))+math.exp(-((z+(2*n*H)+z0)**2)/(4*D*t))),[-math.inf,math.inf])
    return round((((Q*math.exp(0)/((4*math.pi*D*t)**(3/2))))*Rx*Ry*Rz),8)

def testCons(grid):
    cons = 0
    for a in range(0,5):
        for b in range(0,5):
            for c in range(0,5):
                cons += grid[a,b,c]
    return cons



#testing
roomUpdate()
print("Time: ", t)
print(testCons(coGrid))
    #plotData(coGrid, "co",t)
    #plotData(hchoGrid, "hcho",t)
