rmdChunk <-
  function(type = 'first')  {

chunk <- switch(type,

                'first' = {
"
```{r, echo=TRUE,message=FALSE, warning=FALSE}
assign('dynamic', TRUE,envir = sys.frame(),immediate = TRUE)
assign('publish', TRUE,envir = sys.frame(),immediate = TRUE)

library(SMRD)
library(xtable)
library(jkf)

knitr::opts_chunk$set(message = FALSE, warning = FALSE, echo = FALSE, results = 'asis')
```"},

                'last'  = {
"
```{r, echo=TRUE,message=FALSE, warning=FALSE}\n
HTML('<link rel='stylesheet' type='text/css' href='css/flat-slidy.css'>')\n
HTML('<script src='js/audiojs/audiojs/audio.min.js'></script>')\n
HTML('<script> audiojs.events.ready(function() {audiojs.createAll();}); </script>')\n
HTML('<script src='js/jkf-scroll.js'></script>')\n
```"})

}
