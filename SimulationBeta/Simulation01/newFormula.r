output <- 0
concent <- function(x, y, z, T, Q, a, A, w, V, D, Rx, Ry, Rz){
	output <- ((Q*(2.78281828)^-(a+((w*A)/V)))/(4*D*T)^(3/2))*Rx*Ry*Rz
}
#calculate Rx, Ry, and Rz using a normal regular physical calculator since it is easier than encoding the formula here

#x, y, and z indicate position of chosen point
#T is time
#a is fresh air ventilation rate and w is deposition rate
#V is volume of room and A is area of room surfaces that will be deposited on
#D is effective indoor diffusion coefficent
#Rx, Ry, and Rz are in the paper and depend on the dimensions of the room

#sorry it took a long time to make this. it was hard to understand the formula at first, especially the R variables

#D for CO is 0.19312 cm^2/s , while D for HCHO is 0.18 cm^2/s