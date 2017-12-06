import math
import mpmath
def gasdisp(x = 1,y = 1, z = 1, t = 1, Q = 125, D = 0.001, x0 = 0, y0 = 0, z0 = 0, L = 5, W = 5, H = 5):
    Rx = mpmath.nsum(lambda n: (math.exp(-((x+(2*n*L)-x0)**2)/(4*D*t))+math.exp(-((x+(2*n*L)+x0)**2)/(4*D*t))),[-math.inf,math.inf])
    Ry = mpmath.nsum(lambda n: (math.exp(-((y+(2*n*W)-y0)**2)/(4*D*t))+math.exp(-((y+(2*n*W)+y0)**2)/(4*D*t))),[-math.inf,math.inf])
    Rz = mpmath.nsum(lambda n: (math.exp(-((z+(2*n*H)-z0)**2)/(4*D*t))+math.exp(-((z+(2*n*H)+z0)**2)/(4*D*t))),[-math.inf,math.inf])
    return ((((Q*math.exp(0)/((4*math.pi*D*t)**(3/2))))*Rx*Ry*Rz))
print (gasdisp())
