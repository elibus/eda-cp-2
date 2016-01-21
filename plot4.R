source("common.R")

# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999-2008?

png(
  filename = "plot4.png", width = 640, height = 480, units = "px"
)

# join tables on SCC
pm25_summary_by_year <-
  pm25 %>%
  left_join(classification_codes) %>%
  filter( grepl(".*coal.*", SCC.Level.Three, ignore.case = TRUE)) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

qplot(
  year,
  total,
  data=pm25_summary_by_year,
  geom="line",
  main="Coal combustion-related PM2.5 emissions by year",
  xlab="Year",
  ylab = "Total emissions by type"
)

dev.off()