rmdChunk <-
  function(type = 'first')  {

chunk <- switch(type,

                'first' = {function() {

assign('dynamic', TRUE,envir = sys.frame(),immediate = TRUE)
assign('publish', TRUE,envir = sys.frame(),immediate = TRUE)

library(SMRD)
library(xtable)
library(jkf)

knitr::opts_chunk$set(message = FALSE, warning = FALSE, echo = FALSE, results = 'asis')}},

                'last'  = {function() {
HTML("<link rel='stylesheet' type='text/css' href='css/flat-slidy.css'>")
HTML("<script src='js/audiojs/audiojs/audio.min.js'></script>")
HTML("<script> audiojs.events.ready(function() {audiojs.createAll();}); </script>")
HTML("<script src='js/jkf-scroll.js'></script>")
}})

eval(body(chunk), envir = sys.frame())

}
