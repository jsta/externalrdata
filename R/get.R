#' temp_get
#'
#' @export
#' @description Retrieves external files and store in file cache.
#' @importFrom rappdirs user_data_dir
#' @importFrom utils download.file
#' @param version_id version id
#' @param skip numeric vector of lines to skip on file read. optional.
#' @param dest_folder file.path optional will default to the location returned by \code{\link[rappdirs]{user_data_dir}}.
#' @param compile logical perform on-the-fly compilation to rds?
#' @examples \dontrun{
#' temp_get(version = "1")
#' }
temp_get <- function(version_id, skip = NA, dest_folder = NA, compile = TRUE){

  # replace with actual path
  baseurl <- "ftp://climb.genomics.cn/pub/10.5524/100001_101000/100244/"

  # replace with actual file names
  files <- c("Cirflux_ScalingAndModeling_canopyLevelData_GigaScience.csv",
             "Cirflux_ScalingAndModeling_leafLevelData_GigaScience.csv")

  # dir.exists(cache_path())
  dir.create(cache_path(), showWarnings = FALSE)
  versioned_path <- paste0(cache_path(), version_id)
  dir.create(versioned_path, showWarnings = FALSE)

  invisible(
    lapply(files,
           function(x) get_if_not_exists(
             paste0(baseurl, x), file.path(versioned_path, x))
    ))

  if(compile){
    temp_compile(version_id = version_id, skip = skip)
  }
}
