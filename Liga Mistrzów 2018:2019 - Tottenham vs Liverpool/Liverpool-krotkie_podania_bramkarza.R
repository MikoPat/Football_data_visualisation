library(tidyverse)
library(StatsBombR) 
library(ggplot2)
library(SBpitch)
library(ggsoccer)
library(soccermatics)


Comp_All <- FreeCompetitions() %>%
  filter()

Comp_Chl_2018_19 <- FreeCompetitions() %>%
  filter(competition_id==16 & season_name=="2018/2019") 

Matches_Chl_2018_19 <- FreeMatches(Comp_Chl_2018_19) 

StatsBombData_Chl_2018_19 <- StatsBombFreeEvents(MatchesDF = Matches_Chl_2018_19, Parallel = T) 
StatsBombData_Chl_2018_19 = allclean(StatsBombData_Chl_2018_19)


short_passes_Alisson<-StatsBombData_Chl_2018_19%>%
  filter(type.name == "Pass", team.name == "Liverpool", player.name == "Alisson Ramsés Becker", pass.length<35)

number_of_short_passes_Alisson = nrow(short_passes_Alisson)

create_Pitch()+
  geom_point(data = short_passes_Alisson, aes(x = location.x, y = location.y), colour = "red",alpha = 1.0)+
  geom_segment(data = short_passes_Alisson, aes(x = location.x, y = location.y, xend = pass.end_location.x, yend = pass.end_location.y), alpha = 0.5, arrow = arrow(length = unit(0.07,"inches")))+scale_y_reverse()

