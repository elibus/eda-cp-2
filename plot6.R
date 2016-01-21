source("common.R")

require(reshape2)
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips = 06037)).
# Which city has seen greater changes over time in motor vehicle emissions?

baltimore_fips   <- "24510"
los_angeles_fips <- "06037"

png(
  filename = "plot6.png", width = 640, height = 480, units = "px"
)

# join tables on SCC
pm25_summary_by_year_ba <-
  pm25 %>%
  filter(fips == baltimore_fips) %>%
  left_join(classification_codes) %>%
  filter( grepl(".*Vehicle.*", Short.Name, ignore.case = TRUE) ) %>%
  group_by(year) %>%
  summarise(Baltimore = sum(Emissions))

pm25_summary_by_year_la <-
  pm25 %>%
  filter(fips == los_angeles_fips) %>%
  left_join(classification_codes) %>%
  filter( grepl(".*Vehicle.*", Short.Name, ignore.case = TRUE) ) %>%
  group_by(year) %>%
  summarise(LosAngeles = sum(Emissions))

pm25_summary_by_year <-
  pm25_summary_by_year_ba %>%
  left_join(pm25_summary_by_year_la, by = "year")

pm25_summary_by_year <-
  melt(
    pm25_summary_by_year,
    id = "year",
    value.name = "pm25"
  )

qplot(
  year,
  pm25,
  colour = variable,
  data   = pm25_summary_by_year,
  geom   = "line",
  main   = "Motor Vehicles PM2.5 emissions by year",
  xlab   = "Year",
  ylab   = "Total emissions (tons)"
)

dev.off()
