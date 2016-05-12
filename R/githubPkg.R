githubPkg <- function(package = NULL, unzip = FALSE, github.directory = 'J:/github-packages',
                      cpu.name = Sys.getenv('user'),...) {

if(unzip) {

  downloads <- paste(c('C:','Users',cpu.name,'Downloads', paste(c(package,'-master.zip'),collapse = '')), collapse = '/')

  current.directory <- getwd()

  setwd(github.directory )

  unzip(downloads)

  devtools::install(paste(c(getwd(),'/',package,'-master'), collapse = ''))

  setwd(current.directory)

} else { devtools::install(paste(c(github.directory,'/',package,'-master'), collapse = ''))
}
}
