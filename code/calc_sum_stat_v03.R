# Software Carpentry Workshop
# University of Chicago
# 2016-09-16

# First version of function to calculate a summary statistic,
# which is the mean of the columns (cols) in df.
calc_sum_stat <- function(df, cols) {
  stopifnot(!dim(df) == 0,
            !is.null(df),
            is.character(cols),
            cols %in% colnames(df))
  if (length(cols) == 1) {
    warning("Only one column specified.")
  }
  df_sub <- df[, cols, drop = FALSE]
  stopifnot(is.data.frame(df_sub))
  sum_stat <- apply(df_sub, 1, mean)
  stopifnot(!is.na(sum_stat))
  return(sum_stat)
}

sum_stat <- calc_sum_stat(counts_raw, c("wosCountThru2011", "plosCommentCount"))
summary(sum_stat)
calc_sum_stat(counts_raw, "mendeleyReadersCount")
options(error = recover)
calc_sum_stat(counts_raw, "mendeleyReadersCount")
