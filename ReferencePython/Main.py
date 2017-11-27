#importing packages
import numpy as np
import math
import mpmath
import plotly.plotly as py
import plotly.graph_objs as go
from plotly.offline import download_plotlyjs, init_notebook_mode, plot, iplot
#initialize arrays for rooms
objectGrid = np.zeros((5,5))
coGrid = np.zeros((5,5))
hchoGrid = np.zeros((5,5))
t = 1
#place elements in object grid
print(objectGrid)
objectGrid[2,2] = 5
print(objectGrid)
#function for updating room
def roomUpdate():
    for x in range(0,5):
        for y in range(0,5):
            #gas dispersion
            coGrid[x,y] = gasdisp(x,y,t, 5, 0.19)
            hchoGrid[x,y] = gasdisp(x,y,t, 5, 0.18)
            #plant depollution
#function for plotting room data
def plotData():
    trace = go.Heatmap(z=[[1, 20, 30, 50, 1], [20, 1, 60, 80, 30], [30, 60, 1, -10, 20]],
                       x=['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
                       y=['Morning', 'Afternoon', 'Evening'])
    data = [trace]
    py.image.save_as(data, filename='labelled-heatmap.png')
#function for recording data

#function for gas dispersion
def gasdisp(x = 1,y = 1, t = 1, Q = 5, D = 0.18, x0 = 2, y0 = 2, L = 5, W = 5):
    Rx = mpmath.nsum(lambda n: (math.exp(-((x+(2*n*L)-x0)**2)/(4*D*t))+math.exp(-((x+(2*n*L)+x0)**2)/(4*D*t))),[-math.inf,math.inf])
    Ry = mpmath.nsum(lambda n: (math.exp(-((y+(2*n*L)-y0)**2)/(4*D*t))+math.exp(-((y+(2*n*W)+y0)**2)/(4*D*t))),[-math.inf,math.inf])
    return round(((Q/((4*D*t)**(3/2)))*Rx*Ry),8)
roomUpdate()
print("coGrid t2")
print(coGrid)
t+=1
roomUpdate()
print("coGrid t3")
print(coGrid)
plotData()