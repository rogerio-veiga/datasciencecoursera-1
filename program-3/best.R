best <- function(state, outcome) {
  ## Validate the outcome asked for
  okay <- FALSE
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  for ( o in valid_outcomes )
  {
    if ( o == outcome)
    {
      okay <- TRUE
      break
    }
  }
  if (okay == FALSE)
  {
    stop("invalid outcome")
  }
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[, 11] <- as.numeric(data[, 11])
  by_state_data = data[ data$State == state,]
  order_by_data_data = by_state_data[order(by_state_data[11]),]
  order_by_data_data[1,2]
}
## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death
## rate