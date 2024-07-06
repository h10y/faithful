#' Server
#'
#' Core server function.
#'
#' @param input,output Input and output list objects
#' containing said registered inputs and outputs.
#' @param session Shiny session.
#'
#' @noRd
#' @keywords internal
server <- function(input, output, session) {
  x <- datasets::faithful$waiting

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
}
