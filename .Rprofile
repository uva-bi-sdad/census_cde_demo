functions <- list.files("src/00_functions", pattern = "*.R", full.names = TRUE)
for (f in functions) {
  source(f)
}
rm(list=c("functions", "f"))
options(timeout = max(300, getOption("timeout")))
