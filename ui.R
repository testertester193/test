#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#library(markovifyR)
library(shinythemes)

#source("markovify.R")

# Define UI for application that draws a histogram
shinyUI(fluidPage( theme = shinytheme("slate"),

    # Application title
    titlePanel("Magic Tool"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h4("The tool will generate random statement by magic and also predict the next word of the input"),
            textInput("text", h3("Word Input"), 
                      value = "Life Love")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h4("Prediction of entered word","font-color:red"),
            textOutput("selected_var"),
            h4("Random Generated statement from the Data Set"),
            textOutput("selected_var1")
        )
    )
))
