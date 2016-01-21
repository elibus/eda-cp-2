source("common.R")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission
# from all sources for each of the years 1999, 2002, 2005, and 2008.

png(
  filename = "plot1.png", width = 480, height = 480, units = "px"
)

pm25_summary_by_year <-
  pm25 %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

plot(
  pm25_summary_by_year$year,
  pm25_summary_by_year$total,
  type = "l",
  ylab = "Year",
  xlab = "Total emissions",
  main = "PM2.5 emissions by year")

dev.off()