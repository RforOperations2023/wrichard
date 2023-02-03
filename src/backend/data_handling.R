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

# return data filtered
make_country_subset <- function(data, input) {
  # only filter if group is Fed
  if (input$group == 'Fed') {
    data <- data |> 
      filter(
        is.element(
          Fed, input$fed_selected
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

get_top_ten <- function(data, input) {
  top_ten_tbl <- data |> 
    arrange(desc(!!sym(input$time))) |> 
    head(10) |> 
    DT::datatable(options = list(lengthChange = FALSE))
  
  return(top_ten_tbl)
}
