#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
 
library(ggplot2)
library(dplyr)
 
bcl <- read.csv("d3.csv")

shinyUI <- fluidPage(
    titlePanel("Restaurant analysis"),
    mainPanel(
        p("this data set represents restaurants rating. its feilds include many columns 
          some of them like city and food_rating , service rating, city. so yu can filter
          the data using food_rating attribute or service_rating attribute you can set the
          value in the slider bar")),
    sidebarLayout(
        sidebarPanel(
            sliderInput("rateInput", "food_rating", 0, 5, c(0, 2), pre = "$"),
            sliderInput("rateInput2", "service_rating", 0, 5, c(0, 2), pre = "$")
        ),
        mainPanel(
            plotOutput("coolplot") ,
            tableOutput("results")
        )
    )
)

