box::use(
  shiny[fixedPage, moduleServer, NS, plotOutput, sliderInput, renderPlot, h2],
  graphics[hist, box],
  datasets[faithful],
)

x <- faithful$waiting

#' @export
ui <- function(id) {
  ns <- NS(id)
  fixedPage(
    title = "Old Faithful",
    h2("Old Faithful"),
    plotOutput(outputId = ns("histogram")),
    sliderInput(
      inputId = ns("n"),
      label = "Number of bins:",
      min = 1,
      max = 50,
      value = 25,
      ticks = TRUE
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
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
  })
}
