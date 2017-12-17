# Mistakes

## Parsing [Teams Page](http://www.espn.com/mens-college-basketball/teams)
This was the wrong approach. I was targeting the wrong node.
```R
  teamNodes <- html_nodes(teamScreen, "span a")
```
From there, I had to choose a url (there were 3/team), and then grep the id.
```R
  teamURLs <- teamNodes %>% xml_attr("href") #%in% grep("/ncb/teams/stats=\\d+", teamNodes)
  teamURLs <- grep("stats", teamURLs, value = T)
  print(head(teamURLs))
  for(teamURL in teamURLs){
   teams <- data.frame(rbind(c(regmatches(teamURL, gregexpr("\\d+", teamURL)), "")))
   
  }
 ```
 
 I found that I could use a different node.
 ```R
  teamNodes <- html_nodes(teamScreen, "h5 a")
 ```
 
 That anchor had all of the info I needed to fill the teams table.
 ```R
  # From a For Loop
  teamName <- html_text(teamNodes[i])
  teamURL <- html_attr(teamNodes[i], "href")
  teamId <- regmatches(teamURL, gregexpr("\\d+", teamURL))
 
 ```