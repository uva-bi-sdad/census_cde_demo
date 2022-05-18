dedup_choice <- function(df) {
  dt <- data.table::setDT(df)
  for (j in colnames(dt)) {
    data.table::set(dt, j = j, value = dt[get(j) != "", .N, j][order(-N)][, ..j][1])
  }
  dt[1]
}

dedup_choice_by_key <- function(df, key = "uid") {
  if (exists("out_dt") == TRUE) rm(out_dt, envir = globalenv())
  
  dt <- data.table::setDT(df)
  unique_keys <- unique(dt[, get(key)])
  key_cnt <- length(unique_keys)
  pb <- progress::progress_bar$new(format = "[:bar] :current/:total :percent eta: :eta", total = key_cnt)
  
  for (k in unique_keys) {
    pb$tick()
    g <- dt[get(key)==k]
    r <- dedup_choice(g)
    if (exists("out_dt") == FALSE) out_dt <- r else out_dt <- rbindlist(list(out_dt, r))
  }
  
  out_dt
}
