library(lubridate)
ymd("1989-05-17")
wday(this_day)
# Prase 25 August of 1985 year
mdy(25081985)
ymd("1920-1-2")
# update date
this_moment <- update(this_moment, hours = hour(now()), minutes = minute(now()))

nyc <- now(tzone = "America/New_York")
depart <- nyc + days(2)
depart <- update(depart, hours = 17, minutes = 34)
arrive <- depart + hours(15) + minutes(50)
arrive <- with_tz(arrive, tzone = "Asia/Hong_Kong")
last_time <- mdy("June 17, 2008", tz = "Singapore")
how_long <- interval(last_time, arrive)


# You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for
# publicly traded companies on the NASDAQ and NYSE. Use the following code to download data on
# Amazon's stock price and get the times the data was sampled.
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
as.data.frame(amzn)
# For ymd parse date function.
library(lubridate)
# Count of entries maded in 2012 year
length(grep('^2012', rownames(k)))
# Count of entries maded on Monday in 2012 year
length(grep('понедельник', sapply(grep('^2012', rownames(k), value = TRUE), function(x) weekdays(ymd(x)) )))