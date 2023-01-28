library(ggplot2)
# library(RColorBrewer)
library(dplyr)
library(ggflags)
library(countrycode)

load('data/ratings.RData')

time <- 'BRtng'

# should the user specify this?
ratings_decade_viz <- ratings |> 
  filter(Byear >= 1930)

# rainbow stacked hist
ratings_decade_viz |> 
  ggplot(aes(x = .data[[time]])) +
  geom_histogram(aes(fill = factor(Bdecade)), bins=5)# +
  # scale_fill_gradient(low = "#771C19", high = "#000000")

# FREQUENCY decade
ratings_decade_viz |>
  ggplot(aes(x=SRtng, color=Bdecade)) +
  geom_freqpoly()

# DENSITY decade
ratings_decade_viz |>
  ggplot(aes(x=SRtng, group=Bdecade, color=Bdecade)) +
  geom_density() +
  scale_fill_binned(
    type = "viridis"
  )

# DENSITY year (just for fun)
ratings_decade_viz |>
  ggplot(aes(x=SRtng, group = Byear, color = Byear)) +
  geom_density() +
  scale_color_continuous(low='red',high='blue') +
  theme(legend.position = "none")


# year vs rating
set.seed(1234)
ratings |>
  slice_sample(n = 1000) |>
  ggplot(aes(x=Age, y=SRtng, color=Sex)) +
  geom_point()

rating_countries <- ratings |>
  group_by(Fed) |>
  summarize(players = n())

rating_countries$Country = rating_countries$Fed |>
  countrycode(origin = 'iso3c', destination = 'country.name')

country_clean

ratings |> 
  group_by(Bdecade) |> 
  summarize(count = n())
