createRankingFunctions <- function(file) {
  csvData <- read.csv(file)
  NAMES <- c("Provider Number","Hospital Name","Address 1","Address 2","Address 3","City","State","ZIP Code","County Name","Phone Number","Hospital 30-Day Death (Mortality) Rates from Heart Attack","Comparison to U.S. Rate - Hospital 30-Day Death (Mortality) Rates from Heart Attack","Lower Mortality Estimate - Hospital 30-Day Death (Mortality) Rates from Heart Attack","Upper Mortality Estimate - Hospital 30-Day Death (Mortality) Rates from Heart Attack","Number of Patients - Hospital 30-Day Death (Mortality) Rates from Heart Attack","Footnote - Hospital 30-Day Death (Mortality) Rates from Heart Attack","Hospital 30-Day Death (Mortality) Rates from Heart Failure","Comparison to U.S. Rate - Hospital 30-Day Death (Mortality) Rates from Heart Failure","Lower Mortality Estimate - Hospital 30-Day Death (Mortality) Rates from Heart Failure","Upper Mortality Estimate - Hospital 30-Day Death (Mortality) Rates from Heart Failure","Number of Patients - Hospital 30-Day Death (Mortality) Rates from Heart Failure","Footnote - Hospital 30-Day Death (Mortality) Rates from Heart Failure","Hospital 30-Day Death (Mortality) Rates from Pneumonia","Comparison to U.S. Rate - Hospital 30-Day Death (Mortality) Rates from Pneumonia","Lower Mortality Estimate - Hospital 30-Day Death (Mortality) Rates from Pneumonia","Upper Mortality Estimate - Hospital 30-Day Death (Mortality) Rates from Pneumonia","Number of Patients - Hospital 30-Day Death (Mortality) Rates from Pneumonia","Footnote - Hospital 30-Day Death (Mortality) Rates from Pneumonia","Hospital 30-Day Readmission Rates from Heart Attack","Comparison to U.S. Rate - Hospital 30-Day Readmission Rates from Heart Attack","Lower Readmission Estimate - Hospital 30-Day Readmission Rates from Heart Attack","Upper Readmission Estimate - Hospital 30-Day Readmission Rates from Heart Attack","Number of Patients - Hospital 30-Day Readmission Rates from Heart Attack","Footnote - Hospital 30-Day Readmission Rates from Heart Attack","Hospital 30-Day Readmission Rates from Heart Failure","Comparison to U.S. Rate - Hospital 30-Day Readmission Rates from Heart Failure","Lower Readmission Estimate - Hospital 30-Day Readmission Rates from Heart Failure","Upper Readmission Estimate - Hospital 30-Day Readmission Rates from Heart Failure","Number of Patients - Hospital 30-Day Readmission Rates from Heart Failure","Footnote - Hospital 30-Day Readmission Rates from Heart Failure","Hospital 30-Day Readmission Rates from Pneumonia","Comparison to U.S. Rate - Hospital 30-Day Readmission Rates from Pneumonia","Lower Readmission Estimate - Hospital 30-Day Readmission Rates from Pneumonia","Upper Readmission Estimate - Hospital 30-Day Readmission Rates from Pneumonia","Number of Patients - Hospital 30-Day Readmission Rates from Pneumonia","Footnote - Hospital 30-Day Readmission Rates from Pneumonia")
  if(all(sort(NAMES) != sort(names(csvData)))) {
    warning("Wrong file format, give file 'outcome-of-care-measures.csv' from assigment")
    return()
  }
  
  best <- function(state, term) {
    rankhospital(state, term, 1)
  }
  rankhospital <- function(state, term, place) {
    stateMeasures = csvData[csvData$State == state,]
    result <- if(term == 'heart attack'){
      tapply(as.double(as.character(stateMeasures$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)), stateMeasures$Hospital.Name, max)
    } else if (term == 'pneumonia') {
      tapply(as.double(as.character(stateMeasures$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)), stateMeasures$Hospital.Name, max)
    } else if (term == 'heart failure') {
      tapply(as.double(as.character(stateMeasures$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)), stateMeasures$Hospital.Name, max)
    }
    sorted_result <- sort(result[!is.na(result)])
    if(place == 'worst'){
      sorted_result[length(sorted_result)] 
    } else {
      sorted_result[place]  
    }
  }
  rankall <- function(term, place) {
    rankhospital(csvData$State, term, place)
  }
  list(best = best, rankhospital = rankhospital, rankall= rankall)
}