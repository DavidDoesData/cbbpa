# This script will scrape data from ESPN.COM
# http://www.espn.com/mens-college-basketball/teams
# http://www.espn.com/mens-college-basketball/team/schedule/_/id/399/year/2018
# http://www.espn.com/mens-college-basketball/boxscore?gameId=400989985


# Column Names For The Tables
teamTableColNames <- c("TeamId", "Name")
gameTableColNames <- c("GameId", "Date", "HomeName", "AwayName", "HomeScoreFirst", 
                       "HomeScoreSecond", "AwayScoreFirst", "AwayScoreSecond")
boxScoreTableColNames <- c("GameId", "TeamId", "PlayerName", "MIN", "FG", "3PT", 
                           "FT", "OREB", "DREB", "AST", "STL", "BLK", "TO", "PF", "PTS")

# Define the Tables
teams <- data.frame(matrix(ncol = 2, nrow = 0))
games <- data.frame(matrix(ncol = 8, nrow = 0))
boxScores <- data.frame(matrix(ncol = 15))

teamURLs <- character(0)

colnames(teams) <- teamTableColNames
colnames(games) <- gameTableColNames
colnames(boxScores) <- boxScoreTableColNames

# install.packages("rvest")
library(rvest)

# Functions
fillTeamTable <- function(){
  
  teamScreen <- read_html("http://www.espn.com/mens-college-basketball/teams")
  teamNodes <- html_nodes(teamScreen, "h5 a")
  
  # print(length(teamNodes))
  
  teamURLs <- character(length(teamNodes))
  
  # print(length(teamURLs))
  
  for(i in 1:length(teamNodes)){
    teamName <- html_text(teamNodes[i])
    teamURL <- html_attr(teamNodes[i], "href")
    # s<-gsub("(.*)@.*","\\1",rs)
    strippedURL <- gsub("(.*)/.*", "\\1/year/2018", teamURL)
    teamURLs[i] <- strippedURL
    
    # print(teamURL)
    teamId <- regmatches(teamURL, gregexpr("\\d+", teamURL))
    team <- data.frame(c(teamId, teamName))
    colnames(team) <- teamTableColNames
    teams <- rbind(teams, team)
  }
  
  print(head(teamURLs))
}


# Call some functions, I guess
fillTeamTable()
