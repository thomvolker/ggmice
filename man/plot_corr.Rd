% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/corr.R
\name{plot_corr}
\alias{plot_corr}
\title{Plot correlations between (incomplete) variables}
\usage{
plot_corr(
  data,
  vrb = "all",
  label = FALSE,
  square = TRUE,
  diagonal = FALSE,
  rotate = FALSE
)
}
\arguments{
\item{data}{A dataset of class \code{data.frame}, \code{tibble}, or \code{matrix}.}

\item{vrb}{String or vector with variable name(s), default is "all".}

\item{label}{Logical indicating whether correlation values should be displayed.}

\item{square}{Logical indicating whether the plot tiles should be squares.}

\item{diagonal}{Logical indicating whether the correlation of each variable with itself should be displayed.}

\item{rotate}{Logical indicating whether the variable name labels should be rotated 90 degrees.}
}
\value{
An object of class \link[ggplot2:ggplot]{ggplot2::ggplot}.
}
\description{
Plot correlations between (incomplete) variables
}
\examples{
plot_corr(mice::nhanes, label = TRUE)
}
