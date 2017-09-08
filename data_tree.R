library('data.tree')
library(dplyr)
library(tidyr)

k <- read.csv('~/Downloads/urls_occurrences_html_200.csv', col.names = c('num', 'url'))
k$url <- gsub('^/(.+?)/.*', '\\1', k$url)
k %>% separate(url, max(sapply(strsplit(gsub('^/|/$', '', k$url, '/'), '/'), function(x) length(x))), "/")

k_tree <- k %>% separate(url, letters[0:max(sapply(strsplit(k$url, '/'), function(x) length(x)))], "/")
k_tree$pathString <- paste(do.call(paste, lapply(letters[0:max(sapply(strsplit(k$url, '/'), function(x) length(x)))], function(x) k_tree[x])), sep = "/")
SetNodeStyle(acme, label = function(x) paste(x$name, x$totalCount))
