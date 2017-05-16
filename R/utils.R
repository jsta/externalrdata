cache_path <- function() paste0(rappdirs::user_data_dir(
                appname   = "externalrdata",
                appauthor = "externalrdata"), .Platform$file.sep)

get_if_not_exists <- function(url, destfile){
  if(!file.exists(destfile)){
    download.file(url, destfile)
  }else{
    message(paste0("A local copy of ", url, " already exists on disk"))
  }
}

stop_if_not_exists <- function(src_path) {
  if(!file.exists(src_path)){
    stop(paste0("Dataset not found at: ", src_path,
      "\n Try running the appropriate `get*` and/or `compile` commands."))
  }
}

get_version_list <- function(...){
  list.files(cache_path(), pattern = ".rds$", ...)
}
