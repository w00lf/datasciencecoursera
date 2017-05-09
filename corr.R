# Data
# 
# The zip file containing the data can be downloaded here:
#   
#   specdata.zip [2.4MB]
# The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. For example, data for monitor 200 is contained in the file "200.csv". Each file contains three variables:
#   
#   Date: the date of the observation in YYYY-MM-DD format (year-month-day)
# sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
# nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)
# For this programming assignment you will need to unzip this file and create the directory 'specdata'. Once you have unzipped the zip file, do not make any modifications to the files in the 'specdata' directory. In each file you'll notice that there are many days where either sulfate or nitrate (or both) are missing (coded as NA). This is common with air pollution monitoring data in the United States.
# 
# Part 3
# 
# Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows

corr <- function(directory, threshold = 0) {
  result <- vector()
  for(i in 1:332) {
    csvFile <- file.path(directory, sprintf('%03d.csv', i))
    csvData <- read.csv(csvFile)
    # Existing rows can be checked with complete.cases(x):
    # csvData[complete.cases(csvData),]
    existing <- subset(csvData, !is.na(Date) & !is.na(sulfate) & !is.na(nitrate) & !is.na('ID'))
    if( nrow(existing) < threshold ) next()
    result <- c(result, cor(existing[,'sulfate'], existing[,'nitrate']))
  }
  if(length(result) == 0) return(0)
  result
}