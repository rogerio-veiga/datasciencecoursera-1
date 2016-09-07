df <- read.csv('pml-training.csv')
df$classen <- 0
df$classen[df$classe == 'B'] <- 1
df$classen[df$classe == 'C'] <- 2
df$classen[df$classe == 'D'] <- 3
df$classen[df$classe == 'E'] <- 4

tt <- read.csv('pml-testing.csv')
