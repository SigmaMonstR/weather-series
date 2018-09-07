# Weather Series

Simple set of R wrappers to analyze weather-related monthly time series by US State.

## `stateWeather`
Construct weather monthly time series object for a given state based on NOAA's Climate at a Glance

```stateWeather(wparam, start_year, end_year, state)```

__Arguments__:
- __wparam__: (string) weather parameter code
  - Avg Temperature: "tavg"
  - Min Temperature: "tmin"
  - Max Temperature: "tmax"
  - Precipitation: "pcp"
  - Cooling degree days: "cdd"
  - Heating degree days: "hdd"
  - Palmer Drought Severity Index: pdsi
- __start_year/end_year__: (integer) year range to retrieve
- __state__: (string) Name of US state (lower 48 only)

__Example 1: Obtain Cooling degree days between 2000 and 2018 for the state of New York__

```y <- stateWeather("cdd", 2000, 2018, "new york")```

__Example 2: Obtain Min Temperature between 1984 and 2004 for the state of Washington__

```y <- stateWeather("tmin", 1984, 2004, "washington")```


