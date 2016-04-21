rmdChunk <-
  function(type = 'first', dynamic = TRUE, publish = TRUE,...)  {

chunk <- switch(type,

                'first' = {function() {

assign('dynamic', dynamic,envir = sys.frame(),immediate = TRUE)
assign('publish', publish,envir = sys.frame(),immediate = TRUE)

library(SMRD)
library(xtable)
library(jkf)

knitr::opts_chunk$set(message = FALSE, warning = FALSE, echo = FALSE, results = 'asis')}},

                'last'  = {function() {
list()
HTML("<link rel='stylesheet' type='text/css' href='css/flat-slidy.css'>
      <script src='js/audiojs/audiojs/audio.min.js'></script>
      <script> audiojs.events.ready(function() {audiojs.createAll();}); </script>
      <script src='js/jkf-scroll.js'></script>")
}})

chunk()

}
