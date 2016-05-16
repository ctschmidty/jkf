#' Prespecified chunks for Rmarkdown documents
#'
#' @param type Type of chunk to be used
#' @param dynamic should shiny objects be included?
#' @param publish should the shiny object be sent
#' @param envir What environment is the funtion operating in?
#' @param fw figure width
#' @param fh figure height
#'
#' @importFrom shinyAce aceEditor
#' @importFrom shinythemes shinytheme
#' @importFrom shiny shinyApp fluidPage sidebarLayout actionButton h4
#' mainPanel sidebarPanel includeCSS isolate renderPlot plotOutput h2

chunky <-
  function(type = 'first', dynamic = TRUE, publish = TRUE, envir, fw = 6, fh = 4)  {

switch(type, 'first' = {

first <- function() {

assign('dynamic', dynamic,envir = envir,immediate = TRUE)
assign('publish', publish,envir = envir,immediate = TRUE)

} ; first()
},

'shinyace'  = {

shace <- function() {

ace_name <- function(...) {

if(!isNamespaceLoaded('shiny')) attachNamespace('shiny')

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
} ; shace()
})

#if(type%in%c('first','last','vignette'))  chunk()
#if(type%in%c('shinyace','navbar'))        chunk

}



