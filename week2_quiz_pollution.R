pollutanmean <- function(directory, pollutant, id = 1:332) {
  result <- NULL
  for(i in id) {
    csvFile <- file.path(directory, sprintf('%03d.csv', i))
    csvData <- read.csv(csvFile)
    result <- c(result, csvData[, pollutant])
    print(result)
  }
  mean(result, na.rm = TRUE)
}