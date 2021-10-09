complete <- function(directory, id = 1:332) {
  ## `directory` is a character vector of length 1 indicating
  ## the location of the csv files
  
  ## `id` is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where `id` is the monitor ID number and `nobs` is the 
  ## number of complete cases
  
  # get file paths
  paths <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  # filter those paths matching id
  paths <- paths[id]
  # create a list of read in dfs
  dfs <- lapply(paths, read.csv)
  # run complete cases over dataframes
  completes <- lapply(dfs, complete.cases)
  # calculate totals
  completes <- lapply(completes, sum)
  # return results
  data.frame(id = id, nobs = unlist(completes) )

}



