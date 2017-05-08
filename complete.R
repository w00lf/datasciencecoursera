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
# Part 2
# 
# Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows
# 


complete <- function(directory, id = 1:332) {
  result <- data.frame(id = NULL, nobs = NULL)
  for(i in id) {
    csvFile <- file.path(directory, sprintf('%03d.csv', i))
    csvData <- read.csv(csvFile)
    exsiting <- subset(csvData, !is.na(Date) & !is.na(sulfate) & !is.na(nitrate) & !is.na('ID'))
    result <- rbind(result, data.frame(id = i, nobs = nrow(exsiting)))
  }
  result
}