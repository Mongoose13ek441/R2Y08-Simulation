library(plotly)
g <-array(51, dim=c(5, 5))
print(g)
for(x in range(1,2,3,4,5)){
  for(y in range(1,2,3,4,5)){
    g[x,y] = 2
    print(g)
    print("aasdf")
  }
}


p <- plot_ly(showscale = TRUE) %>%
  add_surface(z = ~g)
print(p)

