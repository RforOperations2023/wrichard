# make list of unique federation options
make_fed_list <- function(data, input) {

  # aggregate
  fed_list <- data |> 
    group_by(Fed) |> 
    summarize(n = n())
  
  # sort by preference (default by group_by() is alphabetical)
  if (input$federation_sort == 'players') {
    fed_list <- fed_list |> 
      arrange(desc(n))
  }
  
  # make list of Fed column
  fed_list <- fed_list['Fed'] |> 
    as.list()
  
  return(fed_list)
}