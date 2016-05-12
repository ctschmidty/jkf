install <- function(package = 'jkf',...) {

  if(!package%in%c('jkf','teachingApps','SMRD')) stop('Uh...this is not one of your packages')

  if(package=='jkf')  devtools::install_github('Auburngrads/jkf',...)

  if(package=='teachingApps')  devtools::install_github('Auburngrads/teachingApps',...)

  if(package=='SMRD')  devtools::install_github('Auburngrads/SMRD',auth_token = Sys.getenv('git.token'),...)

}
