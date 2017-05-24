library(dplyr)
chicago[tmpd > 20 & dptp > 20,]
chicago[(chicago$tmpd > 20 & chicago$dptpt > 20),]

# Used cran packages librarry
cran <- tbl_df(mydf)
select(cran, ip_id, package, country)
select(cran, -time)
select(cran, -(X:size))
filter(cran, country == "US" | country == "IN")
arrange(cran2, country, desc(r_version), ip_id)
mutate(cran3, correct_size = size + 1000))
by_package <- group_by(cran, package)
#  We take value that bigger then 99% of others values of pack_sum$count column
quantile(pack_sum$count, probs = 0.99)

# Allways use stringsAsFactors - it simplifies next work
gross_edu <- read.csv('GrossDomesticProductDataEducationalData.csv', stringsAsFactors = FALSE)
# Create groups by column num_ranl, 5 columns, and assign them to column rank_breaks
result$rank_breaks <- cut(result$num_ranl , breaks=quantile(result$num_ranl, probs = seq(0, 1, 0.2)),labels=1:5, include.lowest=TRUE)