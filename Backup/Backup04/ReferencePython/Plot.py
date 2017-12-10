import numpy as np
import seaborn as sns
import matplotlib as plt
def displayRoom (grid, t, method = 1, display = False):
    if method ==1:
        sns.heatmap(grid, annot=True, linewidths=.5)
    elif method ==2:
        ax = plt.gca()
        ax.set_ylim(ax.get_ylim()[::-1])


    plt.title("Room Concentrations at t = " + str(t))
    plt.xlabel("Room Length")
    plt.ylabel("Room Width")
    if display == True:
        plt.show()
    plt.savefig(gas + "\Roomtime " + str(t))
    plt.close()