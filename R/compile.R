#'@name temp_compile
#'@title Compile data to R data (rds) object
#'@export
#'@description Compile data from component flat files
#'@param version_id character temp database version string
#'@param format character choice of "rds" or "sqlite"
#'@param folder file.path to data folder.
#'@param skip numeric vector of lines to skip on file read. optional.
#'@importFrom utils read.table
#'@importFrom rappdirs user_data_dir
#'@examples \dontrun{
#' temp_compile("1", format = "rds")
#' }
temp_compile <- function(version_id, format = "rds", folder = NA, skip = NA){

  if(is.na(folder)){
    folder <- cache_path()
  }

  res <- temp_ingest(version_id = version_id, folder = folder, skip = skip)

  # dir.exists(cache_path())
  dir.create(cache_path(), recursive = TRUE, showWarnings = FALSE)

  outpath <- file.path(cache_path(), paste0("data_", version_id, ".rds"))

  saveRDS(res, outpath)
  message(paste0("data compiled to ", outpath))
}
