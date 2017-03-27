#DDP - Final Project
#Ken Koch
#March 24, 2017

#This presentation uses data from the mtcars data set. It
#is used to demonstrate how to plot data using the plotly
#package. In addition, it uses the R "shiny" package to 
#provide a degree of interactivity, whereby allowing the 
#user to change the parameters of the plot.

## MTCars Interactive Plot

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

inputPanel(
  selectInput("mtcColumn", label = "Choose a Variable",
              choices = names(mtcars), selected = "mpg")
)

renderPlot({
  plot(x=mtcars[,input$mtcColumn], type = "h", col = list(color=chartColors[match(input$mtcColumn, names(mtcars))+1]),
          main ="MTCars Data", ylab = "Frequency",
                 xlab = mtcarsFullNames[match(input$mtcColumn, names(mtcars))])
})




