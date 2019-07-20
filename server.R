#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

bcl <- read.csv("d3.csv")

shinyServer <- function(input, output) {
    output$countryOutput <- renderUI({
        selectInput("typeInput", "city",
                    sort(unique(bcl$city)),
                    selected = "NY")
    })   
    
    filtered <- reactive({
        
        
        bcl %>%
            filter(  food_rating == input$rateInput[2]  , 
                     service_rating ==input$rateInput2[2]
            )
    })
    
    output$coolplot <- renderPlot({
        if (is.null(filtered())) {
            return()
        }
        ggplot(filtered(), aes(city)) +
            geom_bar(stat = "count")
    })
    
    output$results <- renderTable({
        filtered()
    })
    
    
}
 