chunky <-
  function(type = 'first', dynamic = TRUE, publish = TRUE,fw = 6, fh = 4,...)  {

switch(type,

                'first' = {
first <- function() {

assign('dynamic', dynamic,envir = sys.frame(),immediate = TRUE)
assign('publish', publish,envir = sys.frame(),immediate = TRUE)

require(SMRD)
require(xtable)
require(jkf)

knitr::opts_chunk$set(message = FALSE,
                      warning = FALSE,
                      echo = FALSE,
                      results = 'asis',
                      jkf_par = TRUE,...)
knitr::knit_hooks$set(
  jkf_par=function(before, options, envir){

  if (before) { par(cex.lab=1.05,
                    cex.axis=1.05,
                    mgp=c(2.25,.7,0),
                    tcl=-.3,
                    font.lab=2,
                    font=2,
                    font.axis=2,
                    las=1,
                    tck=0.015,
                    family='serif')}
})
} ; first()
},

'last'  = {

last <- function() {

shiny::HTML("<link rel='stylesheet' type='text/css' href='../css/flat-slidy.css'><script src='../js/audiojs/audiojs/audio.min.js'></script><script> audiojs.events.ready(function() {audiojs.createAll();}); </script><script src='../js/jkf-scroll.js'></script>")
} ; last()
},

'vign'  = {

vignette <-  function() {

knitr::opts_chunk$set(message = FALSE,
                      warning = FALSE,
                      fig.align = 'center',
                      fig.width = fw,
                      fig.height = fh,
                      comment = NA,...)
require(SMRD)
} ; vign()
},

'shinyace'  = {

shace <- function() {

ace_name <- function(...) {

require(shiny)

shinyApp(options = list(height = "600px"),
   ui = fluidPage(theme = shinythemes::shinytheme("flatly"),
                  includeCSS('css/my-shiny.css'),
        sidebarLayout(
          sidebarPanel(
            shinyAce::aceEditor("acename",
                                mode = "r",
                                theme = "github",
                                height = "450px",
                                fontSize = 14,
                                value = "paste code here"),

        actionButton("actionname", h4("Evaluate"), width = '100%')),

        mainPanel(plotOutput("plotname", height = "600px")))),

   server = function(input, output, session) {

   output$plotname <- renderPlot({
   par(oma = c(0,0,0,0), mar = c(4,4,2,2))
   input$actionname
   return(isolate(eval(parse(text=input$acename))))
})
})
} ; ace_name()
teachingApp('ace_name', envir = environment(), publish = publish)
}
shace()
})

#if(type%in%c('first','last','vignette'))  chunk()
#if(type%in%c('shinyace','navbar'))        chunk

}



