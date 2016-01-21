source("common.R")

# How have emissions from motor vehicle sources changed from 1999-2008
# in Baltimore City?

baltimore_fips <- "24510"

png(
  filename = "plot5.png", width = 640, height = 480, units = "px"
)

# join tables on SCC
pm25_summary_by_year <-
  pm25 %>%
  filter(pm25, fips == baltimore_fips) %>%
  left_join(classification_codes) %>%
  filter( grepl(".*Vehicle.*", Short.Name, ignore.case = TRUE) ) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

qplot(
  year,
  total,
  data=pm25_summary_by_year,
  geom="line",
  main="Motor Vehicles PM2.5 emissions by year - Baltimore City, Maryland",
  xlab="Year",
  ylab = "Total emissions"
)

dev.off()