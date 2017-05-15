#' version_ls
#'
#' @export
#' @importFrom tools file_path_sans_ext
#'
#' @examples \dontrun{
#' version_ls()
#' }
version_ls <- function(){
  res <- tools::file_path_sans_ext(get_version_list())

  gsub("^.*?_", "", res)
}

version_rm <- function(version){
  unlink(
    get_version_list(
      include.dirs = TRUE, full.names = TRUE)[which(version == version_ls())])
}
