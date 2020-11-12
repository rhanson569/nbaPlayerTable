#' NBA Player List Generator
#' @param year the year in which the second half of the season takes place
#' @param team (optional) A team's acronym to return a specific team's player. Default is all teams, or you may select one specific team
#' @return a table
#' @import rvest
#' @import tidyverse
#' @export

library(rvest)
library(tidyverse)
player_table <- function(year,team='ALL'){
  url = paste0('https://www.basketball-reference.com/leagues/NBA_',year,'_per_game.html')
  players = read_html(url) %>%
    html_node('table') %>%
    html_table()
  players<-players[!(players$Rk == "Rk"),]
  if(team !='ALL'){
    players <- filter(players, Tm == team)
  }
  players
}
