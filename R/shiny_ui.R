shiny_ui <- function(type = 'fluid',...) {

if(type=='fluid') {
  
  message("shinyApp(options = list(width = '99%', height = '760px'),
ui = fluidPage(theme = shinytheme('flatly'), includeCSS('css/my-shiny.css'),
                  sidebarLayout( 
                  sidebarPanel(")
}
 
if(type=='navbar') {
  
  message("shinyApp(options = list(width = '99%', height = '760px'),
ui = navbarPage(theme = shinytheme('flatly'), includeCSS('css/my-shiny.css'),
          tabPanel(h4('Figure 1.1'),titlePanel('Use this code to reproduce the histogram in Figure 1.1. Input changes and click 'Evaluate'),
  sidebarLayout( 
          sidebarPanel(width = 4,")
  
}
   
}