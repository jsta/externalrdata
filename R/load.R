#' temp_load
#' @description Load files from local file system
#' @param version_id character database version string
#' @param format character choice of rds or sqlite
#' @param fpath file.path optionally specify custom location of rds file
#' @export
#' @importFrom rappdirs user_data_dir
#' @importFrom dplyr src_sqlite
#' @examples \dontrun{
#' dt  <- temp_load("1")
#' dt2 <- temp_load("2")
#' }
temp_load <- function(version_id, format = "rds", fpath = NA){

  if(!is.na(fpath)){

    if(format == "sqlite"){
      dplyr::src_sqlite(fpath)
    }else{
      readRDS(fpath)
    }

  }else{

    if(format == "sqlite"){
      sqlite_path <- paste0(cache_path(), "sqlite3")
      stop_if_not_exists(sqlite_path)
      dplyr::src_sqlite(sqlite_path)
    }else{
      rds_path <- paste0(cache_path(), "data_", version_id, ".rds")
      stop_if_not_exists(rds_path)
      readRDS(rds_path)
    }

  }
}
