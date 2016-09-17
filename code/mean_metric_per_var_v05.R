# Software Carpentry Workshop
# University of Chicago
# 2016-09-16

# First version of function to calculate the mean of a metric
#per each level of a factor variable.
mean_metric_per_var <- function(metric, variable) {
  stopifnot(is.numeric(metric),
            length(metric) == length(variable))
  if (!is.factor(variable)) {
    warning("variable  was automatically converted to a factor")
    variable <- as.factor(variable)
  }
  variable <- droplevels(variable)
  result <- numeric(length = length(levels(variable)))
  names(result) <- levels(variable)
  for (v in levels(variable)) {
    result[v] <- mean(metric[variable == v], na.rm = TRUE)
    stopifnot(!is.na(result[v]))
    # print(result[v])
  }
  return(result)
}

counts_raw <- read.delim("data/counts-raw.txt.gz")
mean_metric_per_var(counts_raw$wosCountThru2011, counts_raw$year)
mean_metric_per_var(counts_raw$journal, counts_raw$year)
mean_metric_per_var(counts_raw$f1000Factor, counts_raw$year[1:10])
