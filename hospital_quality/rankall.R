rankall <- function(outcome, num = "best") {
  ## create static vars 
  
  # path of outcomes csv file
  path <- "C:/Users/Zeuce/Documents/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv"
  
  # named list with possible outcomes and integer value
  # representing the related column in the outcomes file
  outcomes <- list("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
  # other vars coded to column position
  hosp_name_pos <- 2
  state_pos <- 7
  
  ## Read outcome data
  df <- read.csv(path)
  
  ## Check that outcome is valid
  if(!(outcome %in% names(outcomes))) {
    stop("invalid outcome")
  }
  # overwrite outcome to int value for convenience
  outcome <- outcomes[[outcome]]
  # rename relevant columns for simplicity
  names(df)[c(hosp_name_pos, state_pos, outcome)] <- c("hospital", "state", "outcome")
  
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  # remove "Not Available"
  df <- df[df$outcome != "Not Available", ]
  # convert outcome to numeric
  df$outcome <- as.numeric(df$outcome)
  # split on state
  state_split <- split(df, df$state)
  # get rankings withink each state
  split_ranked <- lapply(state_split, function(sp) sp[order(sp$outcome, sp$hospital), ]) 
  # get ranking results based on num
  if(num == "best") {
    results <- sapply(split_ranked, function(sp, num) sp[num, "hospital"], num=1)
  } else if (num == "worst") {
    results <- sapply(split_ranked, function(sp) sp[nrow(sp), "hospital"])
  } else {
    results <- sapply(split_ranked, function(sp, num) sp[num, "hospital"], num=num)
  }
 
  # convert to data  frame
  results <- data.frame(hospital = results, state = names(results))
  # return result ordered by state
  results[order(results$state), ]
}
