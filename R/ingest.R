#'@name temp_ingest
#'@title Ingest flat files
#'@description Ingest data from component flat files
#'@param version character temp database version string
#'@param folder file.path to data folder. optional.
#'@importFrom utils read.table
#'@examples \dontrun{
#'temp_ingest("1")
#'}
#'
temp_ingest <- function(version, folder = NA){

  folder_version <- gsub("\\.", "", version)

  # Set-up paths ####
  if(!is.na(folder)){
    data_prefix <- paste0(folder, "/", "tempNE_")
  }else{
    # eventually replace this with download
    data_prefix <- paste0("", folder_version, "/")
  }
  data_path    <- function(fname){paste0(data_prefix, fname,
                                          folder_version, ".txt")}

  # Importing data ####
  res           <- load_temp_txt(cache_path("epinutr"))

  list("res" = res)
}
