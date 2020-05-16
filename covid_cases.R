library(tidyverse)

covid <- read_csv(url("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"))


######## St. Louis County ########

#select st. louis county

st.louis <- covid %>% filter(state=="Minnesota", county=="St. Louis") %>% 
  mutate(county,diff = cases - lag(cases, default = first(cases)))


covid %>% filter(state=="Minnesota", county=="St. Louis") %>% 
  ggplot(., aes(date, cases, colour=county)) + 
  geom_line() +
 # geom_line(aes(date, deaths)) +
  theme_classic()


ggplot(st.louis, aes(date, diff)) + geom_col() + theme_classic()



######### San Mateo County ########
san.mat <- covid %>% filter(state=="California", county=="San Mateo") %>% 
          mutate(county,diff = cases - lag(cases, default = first(cases)))

ggplot(san.mat, aes(date, cases, colour=county)) + 
  geom_line() +
  # geom_line(aes(date, deaths)) +
  theme_classic()

ggplot(san.mat, aes(date, diff)) + geom_col() + theme_classic() +
  labs(title="Daily New Cases of Covid-19 - San Mateo County, CA", x= "Date", y="New Cases")


###### Santa Clara County #######

santa.clara <- covid %>% filter(state=="California", county=="Santa Clara") %>% 
  mutate(county,diff = cases - lag(cases, default = first(cases)))

ggplot(santa.clara, aes(date, cases, colour=county)) + 
  geom_line() +
  # geom_line(aes(date, deaths)) +
  theme_classic()

ggplot(santa.clara, aes(date, diff)) + geom_col() + theme_classic() +
  labs(title="Daily New Cases of Covid-19 - San Mateo County, CA", x= "Date", y="New Cases")
