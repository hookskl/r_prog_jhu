rankhospital <- function(state, outcome, num = "best") {
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
  path <- "C:/Users/Zeuce/Documents/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv"
  df <- read.csv(path)
  
  ## Check that state and outcome are valid
  if(!(state %in% df[[state_pos]])){ 
    stop("invalid state")
  }
  if(!(outcome %in% names(outcomes))) {
    stop("invalid outcome")
  }
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  # remove "Not Available"
  df <- df[df[[ outcomes[[outcome]] ]] != "Not Available", ]
  # convert outcome to numeric
  df[[ outcomes[[outcome]] ]] <- as.numeric(df[[ outcomes[[outcome]] ]])
  # filter by state and retain hospital name and outcome
  df_filtered <- df[df[[state_pos]] == state, c(hosp_name_pos, outcomes[[outcome]])]
  # sort by lowest outcome rate and hospital name in alphabetical order
  df_sorted <- df_filtered[order(df_filtered[[2]], df_filtered[[1]]), ]
  
  # get hospital based on rank
  if(num == "best") {
    df_sorted[[1]][1]
  } else if (num == "worst") {
    tail(df_sorted, 1)[[1]][1]
  } else if (num > nrow(df_sorted)){
    NA
  } else {
    df_sorted[[1]][num]
  }
}

