#' Plot the predictor matrix of an imputation model
#'
#' @param data A predictor matrix for `mice`, typically generated with [mice::make.predictorMatrix] or [mice::quickpred].
#' @param method Character string or vector with imputation methods (not implemented yet!).
#' @param label Logical indicating whether predictor matrix values should be displayed.
#' @param square Logical indicating whether the plot tiles should be squares.
#' @param rotate Logical indicating whether the variable name labels should be rotated 90 degrees.
#'
#' @return An object of class `ggplot2::ggplot`.
#'
#' @examples
#' pred <- mice::quickpred(mice::nhanes)
#' plot_pred(pred)
#' @export
plot_pred <- function(data, method = NULL, label = TRUE, square = TRUE, rotate = FALSE) {
  if (!is.matrix(data) | dim(data)[1] != dim(data)[2]) {
    stop("Predictor matrix should be a square matrix, try using mice::make.predictorMatrix() or mice::quickpred().")
  }
  # if (!is.null(method)) {length(method)}
  vrbs <- row.names(data)
  p <- dim(data)[2]
  long <- data.frame(
    prd = rep(vrbs, each = p),
    vrb = vrbs,
    ind = matrix(data, nrow = p * p, byrow = TRUE)
  )
  gg <- ggplot2::ggplot(long, ggplot2::aes(x = .data$prd, y = .data$vrb, label = .data$ind, fill = ifelse(.data$ind == 0, "no", "yes"))) +
    ggplot2::geom_tile(color = "black", alpha = 0.6) +
    ggplot2::scale_x_discrete(limits = vrbs, position = "top") +
    ggplot2::scale_y_discrete(limits = rev(vrbs)) +
    ggplot2::scale_fill_manual(values = c("yes" = "grey50", "no" = "grey90")) + ## 006CC2B3
    ggplot2::labs(
      x = "Imputation model predictor",
      y = "Variable to impute",
      fill = "Predictor used",
      color = ""
    ) +
    theme_minimice()
  if (label) {
    gg <- gg + ggplot2::geom_text(color = "black", show.legend = FALSE)
  }
  if (square) {
    gg <- gg + ggplot2::coord_fixed(expand = FALSE)
  } else {
    gg <- gg + ggplot2::coord_cartesian(expand = FALSE)
  }
  if (rotate) {
    gg <- gg + ggplot2::theme(axis.text.x.top = ggplot2::element_text(angle = 90))
  }
  return(gg)
}

