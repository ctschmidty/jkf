chunky <-
  function(type = 'first', dynamic = TRUE, publish = TRUE,fw = 6, fh = 4,...)  {

chunk <- switch(tolower(type),

                'first' = {function() {

assign('dynamic', dynamic,envir = sys.frame(),immediate = TRUE)
assign('publish', publish,envir = sys.frame(),immediate = TRUE)

library(SMRD)
library(xtable)
library(jkf)

knitr::opts_chunk$set(message = FALSE, warning = FALSE, echo = FALSE, results = 'asis',...)}},

                'last'  = {function() {

shiny::HTML(
"<link rel='stylesheet' type='text/css' href='css/flat-slidy.css'>
<script src='js/audiojs/audiojs/audio.min.js'></script>
<script> audiojs.events.ready(function() {audiojs.createAll();}); </script>
<script src='js/jkf-scroll.js'></script>")}},


                'vignette'  = {function() {

knitr::opts_chunk$set(message = FALSE,
                      warning = FALSE,
                      fig.align = 'center',
                      fig.width = fw,
                      fig.height = fh,
                      comment = NA,...)
library(SMRD)
}},


                 'shinyace'  = {

function() {

ace_name <- function(...) {

library(shiny)

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
}})

if(tolower(type) == 'first'    | tolower(type) == 'last'  )  chunk()
if(tolower(type) == 'shinyace' | tolower(type) == 'navbar')  chunk

}



