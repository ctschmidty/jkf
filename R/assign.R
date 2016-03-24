assign <-
  function(course = NULL, assignment = NULL, term = NULL, year = NULL, type = NULL,...) {

oldStub <- 'C:/Users/Jason/OneDrive/Work-Stuff/Computer Systems/GitHub/teachingMaterials/assignments/'

newStub <- 'C:/Users/Jason/OneDrive/Work-Stuff/AFIT/Faculty/1-Teaching'

file <- paste(c(paste(c(tolower(course),tolower(assignment)), collapse = '-'),type), collapse = '.')

when <- paste(c(tolower(term), year), collapse = '-')

oldPath <- paste(c(oldStub,file), collapse = '')

newPath <- paste(c(newStub, course, when,'assignments', file), collapse = '/')

file.copy(from = oldPath, to = newPath, overwrite = TRUE)

}
