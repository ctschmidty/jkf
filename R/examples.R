examples <- function(type = 'hw', program = 'R', editor = 'Word') {
  
  type <- tolower(type)
  program <- tolower(program)
  editor <- tolower(editor)
  
  if (type=='homework') type <- 'hw'
  if (editor=='msword') editor <- 'word'
  
  file <- system.file(paste(c(paste(c('examples', type), collapse = '/'), program, editor, 'pdf'), collapse = '.'), package = 'Rworkflow')
  
 return(file)
}