#' Install packages from GitHub on an AFIT-Networked machine
#'
#' @param package Name of the package
#' @param unzip Should the package be unzipped first
#' @param github.directory Where should the package be installed
#' @param cpu.name the name of the pc
#' @param ... Additional agrument for install
#'
#' @importFrom devtools install


githubPkg <- function(package = NULL, unzip = FALSE, github.directory = 'J:/github-packages',
                      cpu.name = Sys.getenv('user'),...) {

if(unzip) {

  downloads <- paste(c('C:','Users',cpu.name,'Downloads', paste(c(package,'-master.zip'),collapse = '')), collapse = '/')

  current.directory <- getwd()

  setwd(github.directory )

  unzip(downloads)

  devtools::install(paste(c(getwd(),'/',package,'-master'), collapse = ''),...)

  setwd(current.directory)

} else { devtools::install(paste(c(github.directory,'/',package,'-master'), collapse = ''),...)
}
}
