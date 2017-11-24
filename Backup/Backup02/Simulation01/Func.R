room <- R6Class("room",
  public = list(
    t = 1,
    roomGridCO = array(0L, dim=c(this.roomWidth, this.roomLength)),
    roomGridHCHO = array(0L, dim=c(this.roomWidth, this.roomLength)),
    objectGrid = array(NA, dim=c(this.roomWidth, this.roomLength)),
    airflowGrid = array(0L, dim=c(this.roomWidth, this.roomLength)),
    initialize = function(roomWidth, roomLength, sourceList, plantList, ventList){
      this.roomWidth = roomWidth
      this.roomLength = roomLength
      #assign objects to their positions in the objectGrid.
      #Pollution Sources are shown as positive values, plants are shown as negative values.
      #Vents are shown as 0s, while walls are shown as NA
      airCurrent(ventList)
    }
    airCurrent = function(vents){
      #insert airflow calculations here
    }
    updateRoom = function(){
      print(this.roomGridCO)
      print(this.roomGridHCHO)
      for (x in range(1,this.roomWidth)){
        for (y in range(1,this.roomLength)){
          #insert WORKING propogation function here
            #insert wall reflection and ventilation function here
        }
      }
      for (x in range(1,this.roomWidth)){
        for (y in range(1,this.roomLength)){
          #insert depollution here
          #insert pollutant production here
        }
      }
      t = t+1
      #insert plotting function here
      this.recordRoom()
    },
    recordRoom = function(){
      #shows raw output
      print(paste("Time =",this.t))
      print("\nCO\n")
      print(this.roomGridCO)
      print("\nHCHO\n")
      print(this.roomGridHCHO)
      sink(output.txt)
      cat("Time=")
      cat(this.t)
      cat("\n")
      cat("CO")
      cat(this.roomGridCO)
      cat("\n")
      cat("HCHO")
      print(this.roomGridHCHO)
      cat("\n")
      sink()
      #shows graphical output
      #insert plotting function here
      png(filename = paste("PlotCO",this.t))
      #plot the CO concentrations
      dev.off()
      png(filename = paste("PlotHCHO", this.t))
      #plot the HCHO concentrations
      dev.off()
    }
    )
  )
source <- setRefClass("gasPlume",
  fields = list(
    rate = "numeric",
    posX = "integer",
    posY = "integer",
    posZ = "integer",
    initialize <- function(pollutionRate = 1, posX = 3, posY = 3, posZ = 3){
      this$rate = pollutionRate
      this$posX = posX
      this$posY = posY
      this$posZ = posZ
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
    windX = "numeric",
    windY = "numeric",
    windZ = "numeric",
    initialize <- function(rate = 1, posX = 3, posY = 3, posZ = 3, windX = 1, windY = 1, windZ = 0){
      this$airCurrent = rate
      this$posX = posX
      this$posY = posY
      this$posZ = posZ
      this$windX = windX
      this$windY = windY
      this$windZ = windZ
    }
    )
  )

#code to initialize simulation
room1 = room$new()
#make a set of classes
pollutantSource = c()
s1 = source$new()
p1 = plant$new()
v1 = vent$new()
