# define reactive function to subset data based on Byear range
make_ratings_year_subset <- function(data, input) {
  req(input$Byear_range) # make sure selected
  data |> 
    filter(
      Byear >= input$Byear_range[[1]],
      Byear <= input$Byear_range[[2]]
    ) %>%
    return()
}

# get unique federation code list based on current data
# todo(bristow) create this list, save to something? I guess to data$possible_feds

# return data filtered
make_country_subset <- function(data, input) {
  # only filter if group is Fed
  if (input$group == 'Fed') {
    data <- data |> 
      filter(
        is.element(
          Fed, c('USA')
        )
      ) 
  }
  
  return(data)
}

# put it together
make_data_subset <- function(data, input) {
  data <- data |> 
    make_ratings_year_subset(input = input) |>
    make_country_subset(input = input)
  
  return(data)
}