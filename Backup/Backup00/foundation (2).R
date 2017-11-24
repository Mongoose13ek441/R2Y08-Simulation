#stability class A
reflectionCoefficient = 1
gaussTest <- function(x, y, z, h, Q, u){
	sy = 213*(x^0.894)
	sz = (440.8*(x^1.041))+ 9.27
	ey = (exp((-0.5*y*y)/(sy*sy)))
	ez = (exp((-0.5*(h-z)*(h-z))/(sz*sz)))
	#output <- (Q/(2*pi*u*sy))*ey
	output <- ((Q/(2*pi*u*sy*sz))*ey*ez)+(reflectionCoefficient*ez)
}
T <- array(0, dim=c(5,5))
T[3,3]<-5
T[4,3] <-gaussTest(1, 0, 1, 1, 5, 5)
T[4,2] <-gaussTest(1, 1, 1, 1, 5, 5)
T[4,4] <-gaussTest(1, 1, 1, 1, 5, 5)
T[5,3] <-gaussTest(2, 0, 1, 1, 5, 5)
T[5,2] <-gaussTest(2, 1, 1, 1, 5, 5)
T[5,4] <-gaussTest(2, 1, 1, 1, 5, 5)
T[5,1] <-gaussTest(2, 2, 1, 1, 5, 5)
T[5,5] <-gaussTest(2, 2, 1, 1, 5, 5)
T
