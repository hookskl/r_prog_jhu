corr <- function(directory, threshold = 0) {
  ## `directory` is a character vector of length 1 indicating
  ## the location of the csv files
  
  ## `threshold` is a numeric vector of lenght 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the deftaul is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result
  
  # helper fucntion to create path 
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
  df <- complete("specdata")
  id <- as.numeric(df$id[df$nobs > threshold])
  
  if (length(id) == 0) {
    return(c(0))

  }
  

  get_corr <- function(directory, id) {
    path <- create_path(directory, id)
    df <- read.csv(path)
    cor(df$sulfate, df$nitrate, use = "pairwise.complete.obs")
  }
  
  sapply(id, get_corr, directory = directory)  
  

}





