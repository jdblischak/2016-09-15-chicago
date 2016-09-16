# Software Carpentry Workshop
# University of Chicago
# 2016-09-16

# First version of function to calculate the mean of a metric per each level of
# a factor variable.
mean_metric_per_var <- function(metric, variable) {
  result <- numeric(length = length(levels(variable)))
  names(result) <- levels(variable)
  for (v in levels(variable)) {
    result[v] <- mean(metric[variable == v])
  }
  return(result)
}
