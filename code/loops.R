# Software Carpentry Workshop
# University of Chicago
# 2016-09-16

# Examples of loops in R.
# Link to lesson:
# https://jdblischak.github.io/r-intermediate-altmetrics/06-loops.html

# Basic structure of for loop:
#
# for (variable in vector) {
#   do something
# }

# Import data:
counts_raw <- read.delim("data/counts-raw.txt.gz")
# If obtaining errors on Windows, uncomment and run the following two lines:
# counts_raw <- read.delim("data/counts-raw.txt.gz", quote = "",
#                          check.names = FALSE)
# colnames(counts_raw) <- gsub("\"", "", colnames(counts_raw))

# for loop example: Calculate mean number of citations per journal
result <- numeric(length = length(levels(counts_raw$journal)))
names(result) <- levels(counts_raw$journal)
for (j in levels(counts_raw$journal)) {
  result[j] <- mean(counts_raw$wosCountThru2011[counts_raw$journal == j])
}
result

# apply statement example: Create a new summary statistic per article that is
# the mean of multiple metrics.
counts_sub <- counts_raw[, c("wosCountThru2011", "backtweetsCount",
                             "plosCommentCount")]
sum_stat <- apply(counts_sub, 1, mean)
summary(sum_stat)
