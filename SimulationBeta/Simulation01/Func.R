library(R6)
room <- R6Class("room",
  public = list(
    t = 1,
    roomGridCO = array(0L, dim=c(self$roomWidth, self$roomLength)),
    roomGridHCHO = array(0L, dim=c(self$roomWidth, self$roomLength)),
    objectGrid = array(NA, dim=c(self$roomWidth, self$roomLength)),
    initialize = function(roomWidth = 7, roomLength = 7, sourceList = 1, plantList = 1){
      self$roomWidth = roomWidth
      self$roomLength = roomLength
      self$objectGrid[4,4] = 3
      self$objectGrid[1,1] = -1
      print(self$objectGrid)
      #assign objects to their positions in the objectGrid.
      #Pollution Sources are shown as positive values, plants are shown as negative values.
    }
    updateRoom = function(){
      print(t)
      print(self$roomGridCO)
      print(self$.roomGridHCHO)
      print(self$objectGrid)
      for (x in range(1,self$roomWidth)){
        for (y in range(1,self$roomLength)){
          #gas dispersion
          self$roomGridCO[x,y] = self$roomGridCO[x,y] + 1
          self$roomGridHCHO[x,y] = self$roomGridHCHO[x,y] + 2
        }
      }
      for (x in range(1,self$roomWidth)){
        for (y in range(1,self$roomLength)){
          #insert depollution here
          if (self$objectGrid[x,y] == "plt"){
          self$roomGridCO[x,y] = self$roomGridCO[x,y] - 1
          self$roomGridHCHO[x,y] = self$roomGridHCHO[x,y] - 1
          }
          #insert pollutant production here
          if (self$objectGrid[x,y] == "src"){
          self$roomGridCO[x,y] = self$roomGridCO[x,y] + 1
          self$roomGridHCHO[x,y] = self$roomGridHCHO[x,y] + 2
          }
        }
      }
      t = t+1
      #insert plotting function here
      #self$recordRoom()
    },
    recordRoom = function(){
      #shows raw output
      print(paste("Time =",self$t))
      print("\nCO\n")
      print(self$roomGridCO)
      print("\nHCHO\n")
      print(self$roomGridHCHO)
      sink(output.txt)
      cat("Time=")
      cat(self$t)
      cat("\n")
      cat("CO")
      cat(self$roomGridCO)
      cat("\n")
      cat("HCHO")
      print(self$roomGridHCHO)
      cat("\n")
      sink()
      #shows graphical output
      #insert plotting function here
      png(filename = paste("PlotCO",self$t))
      #plot the CO concentrations
      dev.off()
      png(filename = paste("PlotHCHO", self$t))
      #plot the HCHO concentrations
      dev.off()
    }
    )
  )
gasSource <- setRefClass("gasSource",
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

compRa <- function (a, a0, L ,D ,t){
	i=0
	Ra = ((exp(-((a-a0)^2)/(4*D*t)))+(exp(-((a+a0)^2)/(4*D*t))))
	Rsum = Ra
	similar = false
	while(similar == false){
	  Rp = (exp(-((a+(2*i*L)-a0)^2)/(4*D*t)))+(exp(-((a-(2*i*L)+a0)^2)/(4*D*t)))
	  Rm = (exp(-((a+(2*-i*L)-a0)^2)/(4*D*t)))+(exp(-((a-(2*-i*L)+a0)^2)/(4*D*t)))
	  if(Rp > 0.00000001 && Rm > 0.00000001){
	    Rsum = Rsum + Rp + Rm
	    i = i+1
	  	}
	  else{
	  print(Ra)
	  print(Rp)
	  print(Rm)
	  print(Rsum)
	  similar = true
	  }
	}
}
airDisp <- function(x, x0, y, y0, t, Q, a, D, L, W){
	Rx = compRa(x, x0, L, D, t)
	Ry = compRa(y, y0, W, D, t)
	output <- ((Q/((4*D*t)^(3/2)))*Rx*Ry)
}

