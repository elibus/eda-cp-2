source("common.R")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510) from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

baltimore_fips <- "24510"

png(
  filename = "plot2.png", width = 640, height = 480, units = "px"
)

pm25_summary_by_year <-
  filter(pm25, fips == baltimore_fips) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

plot(
  pm25_summary_by_year$year,
  pm25_summary_by_year$total,
  type = "l",
  ylab = "Year",
  xlab = "Total emissions",
  main = "Baltimore City, Maryland - PM2.5 emissions by year")

dev.off()