library(ggplot2)
library(ggflags)
library(magrittr)
library(countrycode)

load('data/ratings.RData')

# rainbow stacked hist
ratings %>%
  ggplot(data=., aes(x=SRtng)) +
  geom_histogram(aes(fill=Bdecade))

# rainbow multiple lines
ratings %>%
  ggplot(data=., aes(x=SRtng, color=Bdecade)) +
  geom_density()

# rainbow multiple lines BY YEAR (just for fun)
ratings %>%
  ggplot(data=., aes(x=SRtng, color=factor(Byear))) +
  geom_density() +
  theme(legend.position = "none")

# year vs rating
set.seed(1234)
ratings %>%
  slice_sample(n = 1000) %>%
  ggplot(data=., aes(x=Age, y=SRtng, color=Sex)) +
  geom_point()

rating_countries <- ratings %>%
  group_by(Fed) %>%
  summarize(players = n())

rating_countries$Country = rating_countries$Fed %>%
  countrycode(origin = 'iso3c', destination = 'country.name')

country_clean
