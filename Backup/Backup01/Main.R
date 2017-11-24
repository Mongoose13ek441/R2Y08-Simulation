roomWidth = 150
roomLength = 150
plantCount = 4
sourceCount = 6
ventCount = 3


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