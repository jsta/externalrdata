#'@name temp_ingest
#'@title Ingest flat files
#'@description Ingest data from component flat files
#'@param version character temp database version string
#'@param folder file.path to data folder. optional.
#'@importFrom utils read.csv
#'@importFrom purrr map_df
#'@examples \dontrun{
#'temp_ingest("1")
#'}
#'
temp_ingest <- function(version, folder = NA){

  # Set-up paths ####

  flist <- list.files(folder, pattern = "\\.csv$",
                      full.names = TRUE, include.dirs = TRUE)

  # Read data ####

  skip_lines <- c(16, 38)

  res <- lapply(seq_along(skip_lines),
            function(i) purrr::map_df(flist[i],
                                   read.csv,
                                   skip = skip_lines[i]))
  names(res) <- gsub("*.csv", "", basename(flist))

  res
}
