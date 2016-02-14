shiny_stuff <- function(type = 'ui', output = 'plot',...) {
  
if(type == 'ui') {
  
  stuff <- switch(tolower(output),
              'ace' = {"aceEditor('fig1plot', mode = 'r', theme = 'github', height = '450px',
                                 value = ''),
                actionButton('evalenvir', h4('Evaluate'))),
  
  mainPanel(plotOutput('plotenvir', height = '550px')))),"},
                
                'plot' = {"sliderInput(' ', label = h2(' '),
                           min = 5, 
                           max = 16, 
                           value = 5, 
                           step = 1, 
                           animate = TRUE),

                           selectInput(' ', label = h2(' '),
                           choices = c( ), 
                           selected = 16)),

                  mainPanel(plotOutput('first', height = '250px')))),"})

}

if(type=='server') {
  
stuff <- switch(tolower(output),
                        'ace' = {"output$plotenvir <- renderPlot({
                          par(oma = c(0,0,0,0), mar = c(4,4,2,2))
                          input$evalenvir
                          return(isolate(eval(parse(text=input$fig1plot)))) })"},
                        'plot' = {"output$plotenvir <- renderPlot({
                          par(oma = c(0,0,0,0), mar = c(4,4,2,2))})"})
}
  
  
          "server = function(input, output, session) {",
          
          SERVER,
          
          ,"})"), collapse = ''))
  
}  
}