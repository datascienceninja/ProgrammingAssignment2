## Put comments here that give an overall description of what your
## functions do

## The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  
  cached.inverse <- NULL
  set <- function(y) {
    x <<- y
    cached.inverse <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) cached.inverse <<- inverse
  getInverse <- function() cached.inverse
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## The following function calculates the inverse of the special "matrix" created with the makeCacheMatrix. 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setInverse function.

cacheSolve <- function(x, ...) {
        
  ## Return a matrix that is the inverse of 'x'
  cached.inverse <- x$getInverse()
  if(!is.null(cached.inverse)) {
    message("getting cached data")
    return(cached.inverse)
  }
  data <- x$get()
  cached.inverse <- solve(data, ...)
  x$setInverse(cached.inverse)
  cached.inverse
}
