jkf.install <- function(package = 'jkf',...) {

  #if(!package%in%c('jkf','teachingApps','SMRD')) stop('Uh...this is not one of your packages')

  pkg <- paste(c('Auburngrads',package), collapse = '/')

  devtools::install_github(pkg,auth_token = Sys.getenv('git.token'),...)

}
