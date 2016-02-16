teachingApp <- function(name, link = FALSE, envir = NULL, css = TRUE,...) {

  if(!is.character(name)) stop('name must be a character string')

  gitFile <- paste(c(name,'.R'), collapse = '')
  gitPath <- "C:/Users/Jason/OneDrive/Work-Stuff/Computer Systems/GitHub/teaching-apps"
  gitURL  <- 'https://github.com/Auburngrads/teaching-apps/blob/master'

  if(!link) dump(name, file = paste(c(gitPath, gitFile), collapse = '/'),envir = envir,... )

  if( link) {
    if(css) {

paste(c("<div style='font-size: 21pt; margin: 0 0 20px 40px; padding: 0; font-weight: normal;background-color: #e6e6e6; border-style: solid; border-color: #e6e6e6; border-radius: 10px;'>View app code [here](",
                    paste(c(gitURL, gitFile), collapse = '/'),')</div>'), collapse = '')
    } else {
      paste(c(gitURL, gitFile), collapse = '/')

}
}
}
