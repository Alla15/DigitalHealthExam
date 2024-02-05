# Load necessary libraries
library(shiny)
library(ggplot2)

# Read data
climate_data <- read.csv("climate_data.csv")

# Define UI
ui <- fluidPage(
  titlePanel("Global Temperature Visualization"),
  sidebarLayout(
    sidebarPanel(
      # Add any input controls if needed
    ),
    mainPanel(
      plotOutput("line_plot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  output$line_plot <- renderPlot({
    ggplot(climate_data, aes(x = Year, y = Global_Temperature)) +
      geom_line() +
      labs(title = "Global Temperature Over Time", x = "Year", y = "Temperature (°C)")
  })
}

# Run Shiny app
shinyApp(ui, server)
