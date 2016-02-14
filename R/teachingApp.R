teachingApp <- function(name, link = FALSE) {
  
  gitFile <- paste(c(name,'.R'), collapse = '')
  gitPath <- "C:/Users/Jason/OneDrive/Work-Stuff/Computer Systems/GitHub/teaching-apps"
  gitURL  <- 'https://github.com/Auburngrads/teaching-apps/blob/master'
  
  if(!link) dump(name, file = paste(c(gitPath, gitFile), collapse = '/'))
  
  if( link) paste(c(gitURL, gitFile), collapse = '/')
  
}