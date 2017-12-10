import math
import mpmath

def updateRoom (grid = np.zeros((3,3)),plant = [[0,2]], source = [[0,0]], t = 90, Q = 27*(10**-6), a = [0], D = 0.001, L = 3, W = 3, model = 1):
    for x in range(0,3):
        for y in range(0,3):
            #gas dispersion
            if model == 1:
                #first model
                c = 0
                s = 0
                for src in source:
                    x0 = src[0]
                    y0 = src[1]
                    Rx = mpmath.nsum(lambda n: (math.exp(-((x + (2 * n * L) - x0) ** 2) / (4 * D * t)) +
                        math.exp(-((x + (2 * n * L) + x0) ** 2) / (4 * D * t))), [-math.inf, math.inf])
                    Ry = mpmath.nsum(lambda n: (math.exp(-((y + (2 * n * W) - y0) ** 2) / (4 * D * t)) +
                        math.exp(-((y + (2 * n * W) + y0) ** 2) / (4 * D * t))), [-math.inf, math.inf])
                    #Q0 = Q
                    Q0 = Q*t
                    val = Q0/((4*math.pi*D*t)**(3/2))
                    val *=(Rx*Ry)
                    c+=val
                s = np.sum(a)
                c *=math.exp(s*t)
                grid[x,y] == c
            #elif model ==2:
            else:
                print("Model does not exist. Please try again.")
    return grid

def updateRoom3D (grid = np.zeros((3,3,3)),plant = [[0,2,0]], source = [[0,0,0]], t = 90, Q = 27*(10**-6), a = [0], D = 0.001, L = 3, W = 3, H = 3, model = 1):
    for x in range(0,3):
        for y in range(0,3):
            for z in range(0,3):
               #gas dispersion
               if model == 1:
                c = 0
                s = 0
                for src in source:
                    x0 = src[0]
                    y0 = src[1]
                    z0 = src[2]
                Rx = mpmath.nsum(lambda n: (math.exp(-((x + (2 * n * L) - x0) ** 2) / (4 * D * t)) +
                    math.exp(-((x + (2 * n * L) + x0) ** 2) / (4 * D * t))), [-math.inf, math.inf])
                Ry = mpmath.nsum(lambda n: (math.exp(-((y + (2 * n * W) - y0) ** 2) / (4 * D * t)) +
                    math.exp(-((y + (2 * n * W) + y0) ** 2) / (4 * D * t))), [-math.inf, math.inf])
                Rz = mpmath.nsum(lambda n: (math.exp(-((z + (2 * n * H) - z0) ** 2) / (4 * D * t)) +
                    math.exp(-((z + (2 * n * H) + z0) ** 2) / (4 * D * t))), [-math.inf, math.inf])
                #Q0 = Q
                Q0 = Q*t
                val = Q0/((4*math.pi*D*t)**(3/2))
                    val *=(Rx*Ry*Rz)
                    c+=val
                s = np.sum(a)
                c *=math.exp(s*t)
                grid[x,y,z] == c
            #elif model ==2:
            else:
                print("Model does not exist. Please try again.")
    return grid
