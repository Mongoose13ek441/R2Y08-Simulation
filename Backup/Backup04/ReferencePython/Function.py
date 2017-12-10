import math
import mpmath

def updateRoom (grid = [3,3],t = 90,Q = 27*(10**-6),D = 0.001,equation = 1):
    for a in range(0,5):
        for b in range(0,5):
             #gas dispersion
             grid[a,b] = gasDisp(x = a,y = b,z = None,t = t, Q = Q, D = D, eq = equation)
    return grid

def updateRoom3D (grid = [3,3,3],t = 90,Q = 27*(10**-6),D = 0.001,equation = 11):
    for a in range(0,5):
        for b in range(0,5):
            for c in range(0,5):
                #gas dispersion
                grid[a,b,c] = gasDisp(x = a,y = b,z = c,t = t, Q = Q, D = D, eq = equation)
    return grid
def gasDisp (x,y,z, t = 90, Q = 27, D = 0.001, x0 = 0, y0 = 0, z0 = 0, L = 3, W = 3, H = 3, A = 54, V = 27, eq = 1):
    if eq == 1:
        Rx = mpmath.nsum(lambda n: (math.exp(-((x + (2 * n * L) - x0) ** 2) / (4 * D * t)) + math.exp(
            -((x + (2 * n * L) + x0) ** 2) / (4 * D * t))), [-math.inf, math.inf])
        Ry = mpmath.nsum(lambda n: (math.exp(-((y + (2 * n * W) - y0) ** 2) / (4 * D * t)) + math.exp(
            -((y + (2 * n * W) + y0) ** 2) / (4 * D * t))), [-math.inf, math.inf])
        c = (((Q*math.exp(0)/((4*math.pi*D*t)**(3/2))))*Rx*Ry)
        return c
    elif eq == 11:
        Rx = mpmath.nsum(lambda n: (math.exp(-((x + (2 * n * L) - x0) ** 2) / (4 * D * t)) + math.exp(
            -((x + (2 * n * L) + x0) ** 2) / (4 * D * t))), [-math.inf, math.inf])
        Ry = mpmath.nsum(lambda n: (math.exp(-((y + (2 * n * W) - y0) ** 2) / (4 * D * t)) + math.exp(
            -((y + (2 * n * W) + y0) ** 2) / (4 * D * t))), [-math.inf, math.inf])
        Rz = mpmath.nsum(lambda n: (math.exp(-((z + (2 * n * H) - z0) ** 2) / (4 * D * t)) + math.exp(
            -((z + (2 * n * H) + z0) ** 2) / (4 * D * t))), [-math.inf, math.inf])
        c = (((Q*math.exp(0)/((4*math.pi*D*t)**(3/2))))*Rx*Ry*Rz)
        return c
