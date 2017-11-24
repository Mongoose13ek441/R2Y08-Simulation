##Reads data from a file
##RmSize:size of the room in squares
##RmObj:type of room object:1 means pollutant source, 2 means plant, 3 means vent, 4 means wall
##Emit:emmission rate for pollutant sources, depollution rate for plants, and windspeed for vents
##Pos:position of the object in the room array.
##SDev:standard deviation of pollutants for pollutant sources

initData = read.csv("SimData.csv")
initData

##Initializes all parameters

room <- R6Class("room",
	public = list(
	time = 1
	roomGrid = array(0, dim=c(initData[1,1],initData[2,1]))
	displayRoom = function(){

		}
	updateRoom = function(){

		}
	recordRoom = function(){
		cat("Time: "+this.time,roomGrid,"\n", file="output.txt, "sep = \n",append=TRUE)
		this.time +=1
		}
	)
)
room
source <- setRefClass("gasPlume", fields = list())
plant <- setRefClass("plant, fields = list(depollutionRate = "numeric", posX = "integer", posY = "integer", posZ = "integer"))
vent <- setRefClass("vent", fields = list(airCurrent = "numeric", posX = "integer", posY = "integer", posZ = "integer", dirX = "numeric", dirY = "numeric", dirZ = "numeric"))
source <- R6Class("source",
	public = list(
	emissionRate = NULL,
 	posX = NULL,
 	posY = NULL,
 	posZ = NULL,
 	sdY = NULL,
 	sdZ = NULL,
 	gasPlume = array(0,dim=c(initData[1,1],initData[2,1])
	initialize = function(emissionRate = 1, posX = 3, posY = 3, posZ = 3, sdY = 1, sdZ = 1){
		this$emissionRate <- emissionRate
		this$posX <- posX
		this$posY <- posY
		this$posZ <- posZ
		this$sdY <- sdY
		this$sdZ <- sdZ
		this$gasPlume[posX,posY] <- emissionRate
	}
	propogateGas = function(){

		}
	)
)
plant <- R6Class("plant,
	public = list(
	depollutionRate = NULL,
	posX = NULL,
	posY = NULL,
	posZ = NULL
	initialize = function(depollutionRate = 1, posX = 3, posY = 3, posZ = 3){
		this.depollutionRate <- depollutionRate
		this$posX <- posX
		this$posY <- posY
		this$posZ <- posZ
		}
	)
)
vent <- R6Class("vent",
	public = list(
	airCurrent = NULL,
	posX = NULL,
	posY = NULL,
	posZ = NULL
	initialize = function(airCurrent = 1, posX = 0, posY = 3, posZ = 3){
		this$airCurrent <- airCurrent
		this$posX <- posX
		this$posY <- posY
		this$posZ <- posZ
		}

	)
)










gaussTest <- function(x, y, xdir, ydir, Q, u, sy){	
	output <- (Q/(2*pi*sy*u))*(exp(-0.5(y^2)/(sy^2))
}
funcTest <- function(x, y){
	if (y==2){
output <- ((T[(x-1),(y+1)]+T[(x-1),(y)])/2)

}
else if (y==6){
output <- ((T[(x-1),(y-1)]+T[(x-1),(y)])/2)
}
else{
	output <- ((T[(x-1),(y-1)]+T[(x-1),(y+1)]+T[(x-1),(y)])/3)
}
}
polluteSource <- function(emit, x, y){
	T[x,y] == T[x,y] + emit
}
T <- array(0, dim=c(7,7))
T[1,4]<-9
T
for (i in 2:6){
	for (j in 2:6){
		T[i,j] <- funcTest(i,j)
}
}
T

