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
