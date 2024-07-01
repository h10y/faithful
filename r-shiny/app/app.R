library(shiny)

x <- faithful$waiting

app_ui <- fixedPage(
  title = "Old Faithful",
  h2("Old Faithful"),
  plotOutput(outputId = "histogram"),
  sliderInput(
    inputId = "n",
    label = "Number of bins:",
    min = 1,
    max = 50,
    value = 25,
    ticks = TRUE
  )
)

server <- function(input, output, session) {
  output$histogram <- renderPlot(
    alt = "Histogram of waiting times",
    {
      hist(
        x,
        breaks = seq(min(x), max(x),
          length.out = input$n + 1
        ),
        freq = TRUE,
        col = "#BB74DB",
        border = "white",
        main = "Histogram of waiting times",
        xlab = "Waiting time to next eruption [mins]",
        ylab = "Frequency"
      )
      box()
    }
  )
}

shinyApp(ui = app_ui, server = server)
