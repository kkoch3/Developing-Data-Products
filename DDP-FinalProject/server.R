#DDP - Final Project
#Ken Koch
#March 24, 2017

#This application uses data from the mtcars data set. It uses the 
#R "shiny" package to provide interactivity, whereby allowing the 
#user to change the parameters of the plot.

## MTCars Interactive Plot - Server

library(shiny)
library(colorRamps)

chartColors <- blue2green2red(12)
mtcarsFullNames <- c("Miles/(US) Gallon",
                     "Number of Cylinders",
                     "Displacement (cu.in.)",
                     "Gross Horsepower",
                     "Rear Axle Ratio",
                     "Weight (1000 lbs)",
                     "1/4 Mile Time",
                     "V or Straight Engine",
                     "Transmission (0 = automatic, 1 = manual)",
                     "Number of Forward Gears",
                     "Number of Carburetors")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

        output$customPlot <- renderPlot({

                plot(mtcars[,input$mtcX], mtcars[,input$mtcY], 
                     col = chartColors[match(input$mtcX, names(mtcars))+1],
                     main ="MTCars Data", 
                     ylab = mtcarsFullNames[match(input$mtcY, names(mtcars))],
                     xlab = mtcarsFullNames[match(input$mtcX, names(mtcars))])

                abline(lm(mtcars[,input$mtcX] ~ mtcars[,input$mtcY]))
        })
})
