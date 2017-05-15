#' temp_get
#'
#' @export
#' @description Retrieves external files and store in file cache.
#' @import rappdirs
#' @importFrom utils download.file
#' @param dest_folder file.path optional will default to the location returned by \code{\link[rappdirs]{user_data_dir}}.
#' @examples \dontrun{
#' temp_get()
#' }
temp_get <- function(dest_folder = NA){

  # replace with actual path
  baseurl <- "ftp://climb.genomics.cn/pub/10.5524/100001_101000/100244/"

  # replace with actual file names
  files <- c("Cirflux_ScalingAndModeling_canopyLevelData_GigaScience.csv",
             "Cirflux_ScalingAndModeling_leafLevelData_GigaScience.csv")

  # dir.exists(cache_path())
  dir.create(cache_path(), showWarnings = FALSE)

  invisible(
    lapply(files,
           function(x) get_if_not_exists(
             paste0(baseurl, x), paste0(cache_path(), x))
    ))
}
