gaussTest <- function(x, y, xdir, ydir, Q, u, sy){	
	output <- (Q/(2*pi*sy*u))*(exp(-0.5(y^2)/(sy^2))
}
polluteSource <- function(emit, x, y){
	T[x,y] += emit

T <- array(0, dim=c(5,5))
T[3,3]<-5
T
T[4,3] <-gaussTest(1, 0, 1, 0, T[3,3], 5, 1)
T[4,2] <-gaussTest(1, 1, 1, 0, T[3,3], 5, 1)
T[4,4] <-gaussTest(1, 1, 1, 0, T[3,3], 5, 1)
T
