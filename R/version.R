#' version_ls
#'
#' @export
#' @importFrom tools file_path_sans_ext
#'
#' @examples \dontrun{
#' version_ls()
#' }
version_ls <- function(){
  strsplit(
    tools::file_path_sans_ext(
      get_version_list()),
    "_")[[1]][2]
}

version_rm <- function(version){
  get_version_list(include.dirs = TRUE, full.names = TRUE)
}
