#' Install my personal packages
#'
#' @param package Name of the package to be installed
#' @param ...  Additional options for install_github
#'
#'
#' @importFrom devtools install_github

jkf.install <- function(package = 'jkf',...) {

  #if(!package%in%c('jkf','teachingApps','SMRD')) stop('Uh...this is not one of your packages')

  pkg <- paste(c('Auburngrads',package), collapse = '/')

  ifelse(pkg=='Auburngrads/SMRD',
         devtools::install_github(pkg,auth_token = Sys.getenv('git.token'),...),
         devtools::install_github(pkg,...))

}
