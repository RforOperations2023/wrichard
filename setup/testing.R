library(ggplot2)
# library(RColorBrewer)
library(dplyr)
library(ggflags)
library(countrycode)

ratings <- readRDS('src/data/ratings.Rds')

time <- 'SRtng'

# should the user specify this?
ratings_decade_viz <- ratings |> 
  filter(Byear >= 1930)

test <- list(
  geom_histogram(aes(fill = Bdecade)),
  list(
    scale_color_viridis_d(),
    labs(
      subtitle = 'test subtitle',
      caption = 'test caption'
    )
  )
)

test_list <- list(
  'plot_type' = 'hist',
  'group' = 'Bdecade',
  'bins' = 20
)

ggplot(ratings_decade_viz, aes(x = SRtng)) +
  list(
    list(
      geom_histogram(
        aes(fill = if(!is.null(.group)) .data[[.group]]),
        bins = .bins
      ),
      labs(title = 'Chess ELO Rating Histogram Plot'),
      scale_fill_viridis_d()
    ),
    theme_classic(),
    labs(
      subtitle = 'test subtitle',
      caption = 'test caption'
    )
  )

plot_test_options <- list(
  # histogram
  'hist' = list(
    geom_histogram(
      aes(fill = if(.group != 'None') {.data[[.group]]}),
      bins = .bins
    ),
    labs(title = 'Chess ELO Rating Histogram Plot'),
    scale_fill_viridis_d()
  )
)

ggplot(ratings_decade_viz, aes(x = SRtng)) +
  geom_histogram(aes(fill = .data[['Bdecade']]))

p <- aes()
# rainbow stacked hist
ratings_decade_viz |> 
  ggplot(aes(x = .data[[time]])) +
  geom_histogram(p, bins=30)# +
  # scale_fill_gradient(low = "#771C19", high = "#000000")

g <- geom_density
ratings_decade_viz |> 
  ggplot(aes(x = .data[[time]])) +
  g()

# FREQUENCY decade
ratings_decade_viz |>
  ggplot(aes(x=SRtng, color=factor(Bdecade))) +
  geom_freqpoly(bins = 30)

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

