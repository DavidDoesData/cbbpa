
# College Basketball Prediction Engine
## Project Goal

This project is an attempt at making a predicitive model for NCAA Div I Men's Basketball games. In addition to predicting winners, we want to predict point spreads.

## The Data

I'm scraping it from ESPN.com. I'll need to write a web crawler/scraper to collect the data. Since I'm coding in R, I'll be using Rvest.


```R
install.packages('rvest')
```

This is where we're looking for links to crawl: [ESPN](http://www.espn.com/mens-college-basketball/teams)

The url structures we'll be crawling are:
```
http://www.espn.com/mens-college-basketball/team/schedule/_/id/XXXX/year/YYYY
XXXX is the school Id
YYYY is the year we want
```

The html structure we need to scrape and build a dataset from:
```
<tr class="oddrow team-41-314">
  <td>
    Fri, Nov 10
  </td>
  <td align="left">
    <ul class="game-schedule">
      <li class="game-status">
        vs
      </li>
      <li class="team-logo-small logo-ncaa-small">
        <a href="http://www.espn.com/mens-college-basketball/team/_/id/314/iona-gaels">
          <img src="http://a.espncdn.com/combiner/i?img=/i/teamlogos/ncaa/500/314.png&amp;w=80&amp;h=80&amp;transparent=true">
        </a>
      </li>
      
      <li class="team-name">
        <a href="http://www.espn.com/mens-college-basketball/team/_/id/314/iona-gaels">
          Iona
        </a>
      </li>
    </ul>
  </td>
  <td>
    <ul class="game-schedule">
      <li class="game-status win">
        <span class="greenfont">
          W
        </span>
      </li>
      
      <li class="score">
        <a href="//www.espn.com/ncb/recap/_/gameId/400989985">
          69-67
        </a>
      </li>
    </ul>
  </td>
  <td>
    1-0 (0-0)
  </td>
</tr>
```
