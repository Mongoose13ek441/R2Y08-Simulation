#initialize simulation
source("Func.R")
#define room dimensions
roomWidth = 150
roomLength = 150
DCO=0.19
DHCHO=0.18
#include objects for all roomObjects that can be included
#sources 1 refer to ____, ____, ____, and ____, respectively
source1 = source$new()
source2 = source$new()
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
#include list of pollution sources
sourceList = list(source1, source2)
#include list of plants
plantList = list(plantA1, plantA2)
#initialize room
room1 = room$new(roomWidth, roomLength, sourceList, plantList, ventList)


#excecute simulation
