# Download & load data
fileUrl  <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
destFile <- "exdata-data-NEI_data.zip"

source_classification_code_rds <- "Source_Classification_Code.rds"
summarySCC_PM25_rds            <- "summarySCC_PM25.rds"

# Download and unzip the dataset
if (!file.exists(destFile)) {
  res <- tryCatch(
    download.file(fileUrl, method = "libcurl", destfile = destFile),
    error = function(e)
      1
  )
}

unzip(destFile)

classification_codes <- readRDS(source_classification_code_rds)
pm25_emissions       <- readRDS(summarySCC_PM25_rds)
