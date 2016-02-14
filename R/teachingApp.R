teachingApp <- function(name, link = FALSE,...) {

  if(!is.character(name)) stop('name must be a character string')

  gitFile <- paste(c(name,'.R'), collapse = '')
  gitPath <- "C:/Users/Jason/OneDrive/Work-Stuff/Computer Systems/GitHub/teaching-apps"
  gitURL  <- 'https://github.com/Auburngrads/teaching-apps/blob/master'

  if(!link) dump(name, file = paste(c(gitPath, gitFile), collapse = '/'), envir = environment(noquote(name)))

  if( link) paste(c(gitURL, gitFile), collapse = '/')

}
