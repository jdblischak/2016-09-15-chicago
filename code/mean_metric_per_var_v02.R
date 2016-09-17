# Software Carpentry Workshop
# University of Chicago
# 2016-09-16

# First version of function to calculate the mean of a metric
#per each level of a factor variable.
mean_metric_per_var <- function(metric, variable) {
  if (!is.factor(variable)) {
    variable <- as.factor(variable)
  }
  result <- numeric(length = length(levels(variable)))
  names(result) <- levels(variable)
  for (v in levels(variable)) {
    result[v] <- mean(metric[variable == v])
    # print(result[v])
  }
  return(result)
}

counts_raw <- read.delim("data/counts-raw.txt.gz")

mean_metric_per_var(counts_raw$wosCountThru2011, counts_raw$journal)
mean_metric_per_var(counts_raw$authorsCount, counts_raw$journal)

mean_metric_per_var(counts_raw$wosCountThru2011, counts_raw$year)
