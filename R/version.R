#' temp_versions
#'
#' @export
#' @importFrom tools file_path_sans_ext
#'
#' @examples \dontrun{
#' temp_versions()
#' }
temp_versions <- function(){
  res <- tools::file_path_sans_ext(get_version_list())

  gsub("^.*?_", "", res)
}

version_rm <- function(version_id){
  unlink(
    get_version_list(
      include.dirs = TRUE, full.names = TRUE)[
        which(version_id == temp_versions())])
}
