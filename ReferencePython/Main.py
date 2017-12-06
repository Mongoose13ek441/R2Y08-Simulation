#importing packages
import math
import mpmath
import matplotlib.pyplot as plt
import numpy as np
import csv
#initialize arrays for rooms
objectGrid = np.zeros((5,5))
coGrid = np.zeros((5,5))
hchoGrid = np.zeros((5,5))
t = 0
coRecord = []
hchoRecord = []
#place elements in object grid
print(objectGrid)
objectGrid[2,2] = 5
print(objectGrid)
#function for updating room
def roomUpdate():
    for x in range(0,5):
        for y in range(0,5):
            #gas dispersion
            coGrid[x,y] = gasdisp(x-2,y-2,t, 5, 0.19)
            hchoGrid[x,y] = gasdisp(x-2,y-2,t, 5, 0.18)
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
def gasdisp(x = 1,y = 1, t = 1, Q = 5, D = 0.18, x0 = 0, y0 = 0, L = 5, W = 5):
    Rx = mpmath.nsum(lambda n: (math.exp(-((x+(2*n*L)-x0)**2)/(4*D*t))+math.exp(-((x+(2*n*L)+x0)**2)/(4*D*t))),[-math.inf,math.inf])
    Ry = mpmath.nsum(lambda n: (math.exp(-((y+(2*n*L)-y0)**2)/(4*D*t))+math.exp(-((y+(2*n*W)+y0)**2)/(4*D*t))),[-math.inf,math.inf])
    return round((((Q/(4*D*t))**math.exp(-2*t))*Rx*Ry),8)
#testing
for k in range(1,100):
    t+=1
    roomUpdate()
    print("Time: ", t)
    plotData(coGrid, "co",t)
    plotData(hchoGrid, "hcho",t)
