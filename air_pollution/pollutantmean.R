pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## `directory` is a character vector of length 1 indicating
  ## the location of the csv files
  
  ## `pollutant` is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the 
  ## mean; either "sulfate" or "nitrate".
  
  ## `id` is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the `id` vector (ignoring `NA` values)
  ## NOTE: Do not round the result!
  
  # helper function to create each path for the files needed
  create_path <- function(directory, id) {
    if (id < 10) {
      path <- paste0(directory, "/00", id, ".csv")
    }
    if (id < 100 & id >= 10) {
      path <- paste0(directory, "/0", id, ".csv")
    }
    if (id >= 100) {
      path <- paste0(directory, "/", id, ".csv")
    }
    path
  }
  
  # create a character vector of all paths
  paths <- sapply(id, create_path, directory=directory) 
  # create a list of read in dfs
  dfs <- lapply(paths, read.csv)
  # bind rows into single df
  df <- do.call("rbind", dfs)
  
  # calculate and return mean of requested pollutant
  mean(df[[pollutant]], na.rm = TRUE)
    

}

