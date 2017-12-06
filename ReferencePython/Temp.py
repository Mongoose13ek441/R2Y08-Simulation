import matplotlib.pyplot as plt
import numpy as np
coGrid = np.zeros((5,5))
for x in range(0,5):
    for y in range(0,5):
        coGrid[x,y] = 5
import seaborn as sns
from matplotlib import colors
for t in ["0:00:00","0:30:00","1:00:00","1:30:00"]:
    sns.heatmap(coGrid, linewidths=1, linecolor = "black", cbar = False, xticklabels = [1,2,3,4,5], yticklabels = [1,2,3,4,5])
    ax = plt.gca()
    ax.set_ylim(ax.get_ylim()[::-1])
    plt.title("Room Concentrations at t = "+str(t))
    plt.xlabel("Room Length")
    plt.ylabel("Room Width")
    plt.show()
    #plt.savefig(gas+"\Roomtime "+str(t))
    plt.close()
