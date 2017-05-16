#' temp_ls
#'
#' @param version_id character version id
#' @param ... extra arguments passed to list.files
#'
#' @export
#'
#' @examples \dontrun{
#' temp_ls("1")
#' }
temp_ls <- function(version_id, ...){
  list.files(paste0(cache_path(), version_id),
             pattern = "\\.csv$", ...)
}

#'@name temp_ingest
#'@title Ingest flat files
#'@description Ingest data from component flat files
#'@param version_id character temp database version string
#'@param folder file.path to data folder. optional.
#'@param skip numeric vector of lines to skip on file read. optional.
#'@importFrom utils read.csv
#'@importFrom purrr map_df
#'@examples \dontrun{
#'temp_ingest("1")
#'}
#'
temp_ingest <- function(version_id, folder = NA, skip = NA){

  # Set-up paths ####
  flist <- temp_ls(version_id = version_id,
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
