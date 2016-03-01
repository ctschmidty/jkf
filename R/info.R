info <- function(info,...) {

INFO <- switch(as.character(info),
               'name' = "Maj Jason Freels",
               'work' = "Air Force Institute of Technology",
               'job'  = 'Assistant Professor of Systems Engineering',
               'dept' = 'Department of Systems Engineering and Management')

return(INFO)

}
