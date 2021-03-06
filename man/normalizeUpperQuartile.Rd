% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preprocessing_functions.R
\name{normalizeUpperQuartile}
\alias{normalizeUpperQuartile}
\title{Function to normalizeUpperQuartile on a matrix}
\usage{
normalizeUpperQuartile(matrix)
}
\arguments{
\item{matrix}{input matrix}
}
\value{
matrix
}
\description{
Function to normalizeUpperQuartile on a matrix
}
\examples{
\dontrun{
h <- HMatrix(nmf_exp, k = 5)
normalizeUpperQuartile(h)
}
}
