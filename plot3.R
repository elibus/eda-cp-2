source("common.R")

# Of the four types of sources indicated by the (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999-2008 for Baltimore City? Which have seen increases in
# emissions from 1999-2008?
# Use the ggplot2 plotting system to make a plot answer this question.

baltimore_fips <- "24510"

png(
  filename = "plot3.png", width = 640, height = 480, units = "px"
)

pm25_summary_by_year <-
  filter(pm25, fips == baltimore_fips) %>%
  group_by(type, year) %>%
  summarise(total = sum(Emissions))


qplot(
  year,
  total,
  data   = pm25_summary_by_year,
  geom   = "line",
  colour = type,
  main   = "Baltimore City, Maryland - PM2.5 emissions by year",
  xlab   = "Year",
  ylab   = "Total emissions by type (tons)"
)

dev.off()