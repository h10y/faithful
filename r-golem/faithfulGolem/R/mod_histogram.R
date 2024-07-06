#' histogram UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_histogram_ui <- function(id) {
  ns <- NS(id)
  tagList(
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

#' histogram Server Functions
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @param x Numeric vector fo the histogram.
#'
#' @noRd
mod_histogram_server <- function(id, x) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$histogram <- renderPlot(
      alt = "Histogram of waiting times",
      {
        graphics::hist(
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
        graphics::box()
      }
    )
  })
}

## To be copied in the UI
# mod_histogram_ui("histogram_1")

## To be copied in the server
# mod_histogram_server("histogram_1")
