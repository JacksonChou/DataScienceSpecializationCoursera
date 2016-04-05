library(httr)
require(httpuv)
require(jsonlite)


# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "c7715b7031d8482b82db",
                   secret = "0ae7302f5f2ef469bef30bd0a585376e0a8b6d2c")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

output <- content(req)

#Getting access to JT Leek github repos
jtleek_url <- "https://api.github.com/users/jtleek/repos"
req <- GET(jtleek_url, config = gtoken)
stop_for_status(req)
content(req)
str(req)
req$headers


jsonData <- fromJSON(jtleek_url)
jsonData[jsonData$name == "datasharing", ]$created_at



##################
## Question 4
##################

connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(connection)
close(connection)

c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))


##############
## Question 5
##############

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

lines <- readLines(url, n=10)
w <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
colNames <- c("filler", "week", "filler", "sstNino12", "filler", "sstaNino12", "filler", "sstNino3", "filler", "sstaNino3", "filler", "sstNino34", "filler", "sstaNino34", "filler", "sstNino4", "filler", "sstaNino4")

d <- read.fwf(url, w, header=FALSE, skip=4, col.names=colNames)
d <- d[, grep("^[^filler]", names(d))]
sum(d[, 4])
