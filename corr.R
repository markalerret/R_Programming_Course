corr <- function(directory, threshold = 0){
  #directory name
  path <- paste("C:/Users/16175/Desktop/Coding Projects/R/R_Programming_Course/Week-2-R/", directory, sep = "")
  
  #list of files
  files <- list.files(path)
  
  #vector of files and number of complete cases
  ids <- complete(directory)
  
  #add file ids that meet threshold here
  aboveThreshold <- c()
  
  #fill list with monitors that are above threshold
  for(i in 1:332){
    #loop through table of complete cases and append monitor id to "aboveThreshold" vector
    if(ids$nobs[i] > threshold){
      aboveThreshold <- append(aboveThreshold, i)
    }
  }

  #put correlations from each monitor here
  cors <- c()
  
  #fill nitrates and sulfates vectors
  for(monitor in aboveThreshold){
    #pull table of each monitor and set the columns of pollutants to their own vector
    table <- read.csv(files[monitor])
    table_complete <- table[complete.cases(table), ]
    nitr <- table_complete["nitrate"]
    sulf <- table_complete["sulfate"]
    
    #data frame with just the pollutants
    df <- data.frame(sulf, nitr)
    
    #correlation
    corr <- cor(df[1], df[2])
    
    #append this correlation to list of correlations
    cors <- append(cors, corr)
  }
  
  cors
  
}

corr("specdata")