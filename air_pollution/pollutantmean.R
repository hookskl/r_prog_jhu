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
  
  # get file paths
  paths <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  # filter those paths matching id
  paths <- paths[id]
  # create a list of read in dfs
  dfs <- lapply(paths, read.csv)
  # bind rows into single df
  df <- do.call("rbind", dfs)
  # calculate and return mean of requested pollutant
  mean(df[[pollutant]], na.rm = TRUE)
    

}

