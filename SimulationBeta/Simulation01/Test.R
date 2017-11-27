library(R6)
room <- R6Class("room",
                public = list(
                  t = 1,
                  roomGridCO = array(0L, dim=c(7, 7)),
                  roomGridHCHO = array(0L, dim=c(7, 7)),
                  objectGrid = array(0L, dim=c(7, 7)),
                  initialize = function(sourceList = 1, plantList = 1){
                    self$objectGrid[4,4] = 3
                    self$objectGrid[1,1] = -1
                    print(self$objectGrid)
                    print("asdf")
                    #assign objects to their positions in the objectGrid.
                    #Pollution Sources are shown as positive values, plants are shown as negative values.
                  }
                     )
)

roomLength = 7
roomWidth = 7
cell <- room$new()
print(cell$objectGrid)
print("Asd")

