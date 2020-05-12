library(httr)
library(tidyverse)

covid <- read_csv(url("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"))

#select st. louis county

county <- covid %>% filter(state=="Minnesota", county=="St. Louis")

county2 <- covid %>% filter(state=="Minnesota", county=="St. Louis")

county2 <-  mutate(county,diff = cases - lag(cases, default = first(cases)))


covid %>% filter(state=="Minnesota", county=="St. Louis") %>% 
  ggplot(., aes(date, cases, colour=county)) + 
  geom_line() +
 # geom_line(aes(date, deaths)) +
  theme_classic()


ggplot(county2, aes(date, diff)) + geom_col() + theme_classic()

