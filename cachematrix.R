## Put comments here that give an overall description of what your
## functions do

## The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  #Clear variable cached.inverse
  cached.inverse <- NULL
  #Create the set function to globally assign matrix and clear cached inverse
  set <- function(y) {
    x <<- y
    cached.inverse <<- NULL
  }
  #Create the get function which returns initialized matrix
  get <- function() x
  #Create the setInverse function which caches the inverse
  setInverse <- function(inverse) cached.inverse <<- inverse
  #Create the getInverse function which returns the cached inverse
  getInverse <- function() cached.inverse 
  #Return a list of the functions just created
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## The following function calculates the inverse of the special "matrix" created with the makeCacheMatrix. 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setInverse function.

cacheSolve <- function(x, ...) {
        
  # Assign x$getInverse() to cached.inverse
  cached.inverse <- x$getInverse()
  # Check if cached.inverse has a value already and if it does,
  # print a message and return the cached inverse
  if(!is.null(cached.inverse)) {
    message("getting cached data")
    return(cached.inverse)
  }
  # Assign the matrix to data
  data <- x$get()
  # Calculate the inverse and assign to cached.inverse
  cached.inverse <- solve(data, ...)
  # Use setInverse function to cache the calculated inverse
  x$setInverse(cached.inverse)
  # Return calculated inverse
  cached.inverse
}
