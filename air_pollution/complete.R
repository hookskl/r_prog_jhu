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
  # subset for rows of complete cases
  df <- df[complete.cases(df), ]
  # check if returned dataframe has more than 0 rows
  if (nrow(df) == 0){
    df <- data.frame(id = id, nobs = 0)
    return(df)
  }
  # convert to dataframe
  df <- as.data.frame(table(df$ID))
  # rename columns and return data frame
  names(df) <- c("id", "nobs")
  # check if any ids aren't included (these had zero complete cases)
  if (length(id) != nrow(df)) {
    # get missing ids
    missing_id <- id[!id %in% df$id]
    # add ids back to dataframe with nobs = 0
    df <- rbind(df, data.frame(id = as.factor(missing_id), nobs = 0))
    
  }
  # reorder based on requested id order
  df <- df[match(id, df$id),]
  df
  
}



