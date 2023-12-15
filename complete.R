complete <- function(directory, id = 1:332){
  #directory name
  path <- paste("C:/Users/16175/Desktop/Coding Projects/R/R_Programming_Course/", directory, sep = "")
  
  #set directory
  setwd(path)

  #list of file names
  files <- list.files(path)[id]
  
  #vector of ids
  #will be first column of returned data frame
  ids <- c(id)
  
  
  #vector of complete cases
  #second column of data frame, filled in by for loop below
  nobs <- c()
  
  #loop through files, calculate complete cases, append to nobs vector
  for(file in files){
    table <- read.csv(file)
    nob <- sum(complete.cases(table))
    nobs <- append(nobs, nob)
  }
  
  output <- data.frame(ids, nobs)
  output
  
}

complete("specdata", 3)