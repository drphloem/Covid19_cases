library(tidyverse); library(zoo)


# download the nytimes master county data - this is updated daily for the most part

covid <- read_csv(url("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"))


######## St. Louis County, MN ########

#select st. louis county

st.louis <- covid %>% filter(state=="Minnesota", county=="St. Louis") %>% 
  mutate(county,diff = cases - lag(cases, default = first(cases)))

#Cumulative cases over time plot

covid %>% filter(state=="Minnesota", county=="St. Louis") %>% 
  ggplot(., aes(date, cases, colour=county)) + 
  geom_line() +
 # geom_line(aes(date, deaths)) +
  theme_classic()

# New Daily Cases
ggplot(st.louis, aes(date, diff)) + geom_col(fill="#1A85FF") + 
  geom_line(aes(y=rollmean(diff, 7, fill = TRUE )), colour = "#D41159") +
  labs(y="Number of New Cases", x= "Date") +
  theme_classic()



######### San Mateo County, CA ########
san.mat <- covid %>% filter(state=="California", county=="San Mateo") %>% 
          mutate(county,diff = cases - lag(cases, default = first(cases)))

#Cumulative cases over time plot
ggplot(san.mat, aes(date, cases, colour=county)) + 
  geom_line() +
  # geom_line(aes(date, deaths)) +
  theme_classic()

# New Daily Cases
ggplot(san.mat, aes(date, diff)) + geom_col() + theme_classic() +
  labs(title="Daily New Cases of Covid-19 - San Mateo County, CA", x= "Date", y="New Cases")


###### Santa Clara County, CA #######

santa.clara <- covid %>% filter(state=="California", county=="Santa Clara") %>% 
  mutate(county,diff = cases - lag(cases, default = first(cases)))

#Cumulative Cases over time plot
ggplot(santa.clara, aes(date, cases, colour=county)) + 
  geom_line() +
  # geom_line(aes(date, deaths)) +
  theme_classic()

# New Daily Cases
ggplot(santa.clara, aes(date, diff)) + geom_col() + theme_classic() +
  labs(title="Daily New Cases of Covid-19 - San Mateo County, CA", x= "Date", y="New Cases")
