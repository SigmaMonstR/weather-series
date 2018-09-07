


stateWeather <- function(wparam, start_year, end_year, state){
  
  #
  # DESC: Construct monthly weather time series for lower 48 US states 
  #       from NOAA Climate at a Glance
  #  
  # ARGS:
  #   wparam: (string) weather parameter code 
  #               Avg Temperature: tavg
  #               Min Temperature: tmin
  #               Max Temperature: tmax
  #               Precipitation: pcp 
  #               Cooling degree days: cdd
  #               Heating degree days: hdd
  #               Palmer Drought Severity Index: pdsi
  #
  #   start_year/end_year: (integer) year range to retrieve
  #
  #   state: (string) Name of US state (lower 48 only)
  #               
  # RETURNS:
  #   Time series object for specified state
  #
  # EXAMPLE:
  #   Return Cooling Degree Days for New York 
  #   y <- stateWeather("cdd", 2000, 2018, "new york")
  #
  
  #State list
    states <- c('Alabama', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 
                'Delaware', 'Florida', 'Georgia', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 
                'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts',
                'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 
                'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 
                'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 
                'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee',
                'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin',
                'Wyoming')
    index <- which(tolower(state) == tolower(states))
    message(paste0("State selected: ", states[index]))
    
  #Parameter
    message(paste0("Retrieving: ", wparam, " for ", start_year, " to ", end_year))
  
  #Loop through each month
    master <- data.frame()
    for(j in 1:12){
      url <- "https://www.ncdc.noaa.gov/cag/statewide/time-series/"
      url <- paste0(url, index, "-",
                    wparam, "-1-", j, "-", start_year, "-", end_year, ".csv")
      temp <- tempfile()
      download.file(url, temp, mode = "wb")
      df <- read.csv(temp, skip = 3)
      master <- rbind(master, df)
    }

  #Return Time Series Object
    master <- master[order(master$Date),]
    series <- ts(master[,2], frequency = 12, start = c(start_year, 1))
    return(series)
}
