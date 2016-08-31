best <- function(state, outcome, rank = 1) {
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
  okay <- FALSE
  state_codes <- read.csv('state_codes.csv')
  for ( s in state_codes$StateCode )
  {
    if (s == state)
    {
      okay <- TRUE
      break
    }
  }
  if (okay == FALSE)
  {
    stop("invalid state")
  }
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[, 11] <- as.numeric(data[, 11]) ## heart attach
  data[, 17] <- as.numeric(data[, 17]) ## heart failure
  data[, 23] <- as.numeric(data[, 23]) ## pneumonia
  by_state_data = data[ data$State == state,]
  idx <- 0
  if (outcome == "heart attack")
  {
    idx <- 11
  }
  else
  {
    if ( outcome == "heart failure")
    {
      idx <- 17
    }
    else
    {
      idx <- 23
    }
  }
  if (idx == 0)
  {
    stop("Something Went Wrong")
  }
  order_by_data_data = by_state_data[order(by_state_data[idx],by_state_data[2],na.last = NA),]
  if (rank == 0 )
  {
    rank = nrow(order_by_data_data)
  }
  order_by_data_data[rank,2]
}
## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death
## rate