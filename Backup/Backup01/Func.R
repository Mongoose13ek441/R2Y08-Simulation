roomWidth = 150
roomLength = 150
roomCurrent = array(0L, dim=c(roomWidth, roomLength))


room <- R6Class("room",
  public = list(
    time = 1,
    roomGrid = array(0L, dim=c(roomWidth, roomLength)),
    updateRoom = function(){
      roomGrid[] <- 0L
      print(roomGrid)
      for (i in sourceList){
            roomGrid = roomGrid + i.plumeGrid
      }
      time = time+1
      print(roomGrid)
      #insert plotting function here
      this.recordRoom()
    },
    recordRoom = function(){
      print(paste("Time =",this.time))
      print(roomGrid)
      sink(output.txt)
      cat("Time=")
      cat(this.time)
      cat("\n")
      cat(roomGrid)
      cat("\n")
      sink()
    }
    )
  )
source <- setRefClass("gasPlume",
  fields = list(
    rate = "numeric",
    posX = "integer",
    posY = "integer",
    posZ = "integer",
    sdY = "integer",
    sdZ = "integer",
    plumeGrid = array(0L, dim=c(roomWidth,roomLength)),
    initialize <- function(pollutionRate = 1, posX = 3, posY = 3, posZ = 3, sdY = 1, sdZ = 1){
      this$rate = pollutionRate
      this$posX = posX
      this$posY = posY
      this$posZ = posZ
      this$sdY = sdY
      this$sdZ = sdZ
    }
    propogatePlume <- function(rate, posX, posY, posZ, sdY, sdZ){
      #insert propogation here
          #insert wall reflection function here
      for (i in plantList){
        #insert depollution here
      }
    }
    )
  )
plant <- setRefClass("plant",
  fields = list(
    rate = "numeric",
    posX = "integer",
    posY = "integer",
    posZ = "integer",
    initialize <- function(depollutionRate = 1, posX = 3, posY = 3, posZ = 3){
      this$rate = depollutionRate
      this$posX = posX
      this$posY = posY
      this$posZ = posZ
    }
    )
  )
vent <- setRefClass("vent",
  fields = list(
    airCurrent = "numeric",
    posX = "integer",
    posY = "integer",
    posZ = "integer",
    dirX = "numeric",
    dirY = "numeric",
    dirZ = "numeric",
    initialize <- function(rate = 1, posX = 3, posY = 3, posZ = 3, dirX = 1, dirY = 1, dirZ = 0){
      this$airCurrent = rate
      this$posX = posX
      this$posY = posY
      this$posZ = posZ
    }
    )
  )

#code to initialize simulation
room = roomGrid$new()
#make a set of classes
pollutantSource = c()
s1 = source$new()
p1 = plant$new()
v1 = vent$new()
