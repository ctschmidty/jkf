teachingApp <- function(name, link = TRUE, css = TRUE, publish = FALSE,...) {

  if(!is.character(name)) stop('name must be a character string')

  gitFile <- paste(c(name,'.R'), collapse = '')
  gitPath <- "C:/Users/Jason/OneDrive/Work-Stuff/Computer Systems/GitHub/teachingApps"
  gitURL  <- 'https://github.com/Auburngrads/teachingApps/blob/master'

if(link & css & !publish) {

   dump(name, file = paste(c(gitPath, gitFile), collapse = '/'),... )

   cat(paste(c("<div style='font-size: 21pt; margin: 0 0 20px 30px; font-weight: normal;'>Get the [code](",
            paste(c(gitURL, gitFile), collapse = '/'),') for this app on GitHub</div>'), collapse = ''))

}

if(publish & css) {

  cat(paste(c("<div style='font-size: 22pt; margin: 0 0 20px 30px; font-weight: normal;'>Get the [code](",
              paste(c(gitURL, gitFile), collapse = '/'),') for this app</div>'), collapse = ''))

}

if(!css) {

   paste(c(gitURL, gitFile), collapse = '/')

  }
  }
