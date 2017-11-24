#initialize simulation
source("Func.R")
#define room dimensions
roomWidth = 150
roomLength = 150

#include objects for all roomObjects that can be included
#sources 1-4 refer to ____, ____, ____, and ____, respectively
source1 = source$new()
source2 = source$new()
source3 = source$new()
source4 = source$new()
#plantA refers to Janet Craig, plantB refers to Peace lily
plantA1 = plant$new()
plantA2 = plant$new()
plantA3 = plant$new()
plantA4 = plant$new()
plantA5 = plant$new()
plantA6 = plant$new()
plantB1 = plant$new()
plantB2 = plant$new()
plantB3 = plant$new()
plantB4 = plant$new()
plantB5 = plant$new()
plantB6 = plant$new()
#ventilation objects are restricted to windows in this version
vent1 = vent$new()
vent2 = vent$new()
vent3 = vent$new()
vent4 = vent$new()
vent5 = vent$new()
vent6 = vent$new()
#include list of pollution sources
sourceList = list(source1, source2)
#include list of plants
plantList = list(plantA1, plantA2)
#include list of ventilation sources
ventList = c(vent1, vent2,vent3, vent4)
#initialize room
room1 = room$new(roomWidth, roomLength, sourceList, plantList, ventList)


#excecute simulation
