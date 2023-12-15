corr <- function(directory, threshold = 0){
  #directory name
  path <- paste("C:/Users/16175/Desktop/Coding Projects/R/R_Programming_Course/", directory, sep = "")
  
  #list of files
  files <- list.files(path)
  
  #vector of files and number of complete cases
  ids <- complete(directory)
  
  #add file ids that meet threshold here
  aboveThreshold <- c()
  
  for( i in 1:332){
    if(ids$nobs[i] > threshold){
      aboveThreshold <- append(aboveThreshold, i)
    }
  }

  

}

corr("specdata")