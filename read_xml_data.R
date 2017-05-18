library(XML)
url <- 'http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en'
html <- htmlTreeParse(url, useInternalNodes = TRUE)
xpathApply(html, '//title', xmlValue)


library(httr)
html2 = GET(url)
content2 = content(html2, as='text')
parsedHtml = htmlParse(content2, asText = TRUE)
xpathApply(html, '//title', xmlValue)


google = handle('http://google.com')
pg1 = GET(handle = google, path = '/')
pg2 = GET(handle = google, path = 'search')
