corr <- function(directory, threshold = 0) {
  ## `directory` is a character vector of length 1 indicating
  ## the location of the csv files
  
  ## `threshold` is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result
  
  ## Check for complete cases above threshold
  df <- complete("specdata")
  id <- df$id[df$nobs > threshold]
  
  ## Check if any fall above threshold
  if(length(id) == 0) {
    return(numeric(0)) # returns numeric vector of length 0 if fail
  }
  
  ## read in dfs with required complete cases
  # get file paths
  paths <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  # filter those paths matching id
  paths <- paths[id]
  # create a list of read in dfs
  dfs <- lapply(paths, read.csv)
  # create list of cors
  cors <- lapply(dfs, function(df) cor(df$sulfate, df$nitrate, use = "complete.obs"))
  unlist(cors)
  
}



