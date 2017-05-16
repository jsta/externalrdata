#'@name temp_ingest
#'@title Ingest flat files
#'@description Ingest data from component flat files
#'@param version character temp database version string
#'@param folder file.path to data folder. optional.
#'@param skip numeric vector of lines to skip on file read. optional.
#'@importFrom utils read.csv
#'@importFrom purrr map_df
#'@examples \dontrun{
#'temp_ingest("1")
#'}
#'
temp_ingest <- function(version, folder = NA, skip = NA){

  # Set-up paths ####

  flist <- list.files(paste0(cache_path(), version),
                      pattern = "\\.csv$",
                      full.names = TRUE, include.dirs = TRUE)

  # Read data ####

  if(all(is.na(skip))){
    skip <- rep(0, length(flist))
  }

  res <- lapply(seq_along(flist),
            function(i) purrr::map_df(flist[i],
                                   read.csv,
                                   skip = skip[i]))
  names(res) <- gsub("*.csv", "", basename(flist))

  res
}
