teachingApp <- function(name, link = TRUE, envir = NULL, css = TRUE,...) {

  if(!is.character(name)) stop('name must be a character string')

  gitFile <- paste(c(name,'.R'), collapse = '')
  gitPath <- "C:/Users/Jason/OneDrive/Work-Stuff/Computer Systems/GitHub/teaching-apps"
  gitURL  <- 'https://github.com/Auburngrads/teaching-apps/blob/master'

  if(link) { dump(name, file = paste(c(gitPath, gitFile), collapse = '/'),envir = envir,... )

  if(css) {

    cat(paste(c("<div style='font-size: 22pt; margin: 0 0 20px 30px; font-weight: normal; border-top: 2px solid #95a5a6; border-bottom: 2px solid #95a5a6;'>View the [code](",
            paste(c(gitURL, gitFile), collapse = '/'),') for this app</div>'), collapse = ''))
  } else {
    paste(c(gitURL, gitFile), collapse = '/')

  }
  }

  if(!link) {

    dump(name, file = paste(c(gitPath, gitFile), collapse = '/'),envir = envir,... )

}
}
