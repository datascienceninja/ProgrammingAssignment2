matrix1<-matrix(1:4,2,2)   
matrix1               
inverse.matrix1<-solve(matrix1) 
inverse.matrix1
matrix1 * inverse.matrix1 
matrix1 %*% inverse.matrix1

setwd("C:/R/ProgrammingAssignment2")
source("cachematrix.R")
m <- makeCacheMatrix() #initialize
m                      # shows that m is now a list of functions
class(m)               # shows that m is a list
class(m$set)           # shows that the elements of the list are functions
m$set(matrix(1:4,2,2)) #set the matrix
m$get()                #get the matrix 
cacheSolve(m)          #calculate the inverse 
cacheSolve(m)          #when called again use the cached inverse  
