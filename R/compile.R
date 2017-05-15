#'@name temp_compile
#'@title Compile data to R data (rds) object
#'@export
#'@description Compile data from component flat files
#'@param version character temp database version string
#'@param format character choice of "rds" or "sqlite"
#'@param folder file.path to data folder.
#'@importFrom utils read.table
#'@importFrom rappdirs user_data_dir
#'@examples \dontrun{
#' temp_compile("1", format = "rds")
#' }
temp_compile <- function(version, format = "rds", folder = NA){

  browser()

  if(is.na(folder)){
    folder <- cache_path()
  }

  ingest <- temp_ingest(version = version, folder = folder)

  # dir.exists(cache_path())
  dir.create(cache_path(), recursive = TRUE, showWarnings = FALSE)

  res <- list("res" = ingest)
  res <- purrr::flatten(res)

  outpath <- file.path(cache_path(), paste0("data_", version, ".rds"))

  saveRDS(res, outpath)
  message(paste0("temp compiled to ", outpath))
}
