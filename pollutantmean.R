#Pollutant Mean
pollutantmean <- function(directory, pollutant, id = 1:332) {
  #empty vector
  measurements <- c()
  
  #directory
  dir <- setwd(paste("C:/Users/16175/Desktop/Coding Projects/R/R_Programming_Course/", directory, sep = ""))
  
  #desired files
  files <- list.files(dir)[id]
  
  #loop through files and create one vector with all data from desired pollutant
  for (file in files){
    table <- read.csv(file)
    column <- table[pollutant]
    for (element in column){
      measurements <- append(measurements, element)
    }
  }
  
  #remove NAs
  bad <- is.na(measurements)
  good <- measurements[!bad]
  
  #calculate and display mean
  mean <- mean(good)
  mean
}

pollutantmean("specdata", "sulfate", 1:10)
