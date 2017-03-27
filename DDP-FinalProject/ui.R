#DDP - Final Project
#Ken Koch
#March 24, 2017

#This application uses data from the mtcars data set. It uses the 
#R "shiny" package to provide interactivity, whereby allowing the 
#user to change the parameters of the plot.

## MTCars Interactive Plot - User Interface

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(tags$h1("MTCars Interactive Plot")),
  
  fluidRow(HTML("<h2>&nbsp;&nbsp;Ken Koch</h2>")),
  fluidRow(HTML("<h3>&nbsp;&nbsp;March 24, 2017</h3>")),
  
  fluidRow(HTML("<p style='margin:10px'>This Shiny application allows you to plot the relationship
                  between any two variables in the MTCars dataset. Simply
                  choose the X and Y-axis variables using the drop 
                  down selection boxes in the sidebar.</p>")),

  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
            selectInput("mtcX", label = "Choose a Variable for the X axis",
                        choices = names(mtcars), selected = "mpg"),
            selectInput("mtcY", label = "Choose a Variable for the Y axis",
                        choices = names(mtcars), selected = "cyl")
                ),
    
    # Show a plot of the generated distribution
    mainPanel(
            plotOutput("customPlot")
  )
  )
))
