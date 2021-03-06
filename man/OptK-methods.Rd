% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generics.R
\docType{methods}
\name{OptK}
\alias{OptK}
\title{Return optimal K}
\usage{
OptK(x, ...)
}
\arguments{
\item{x}{an object of class ButchR_NMF.}

\item{...}{additional parameters.}
}
\value{
numeric - optimal K
}
\description{
Return optimal K
}
\examples{
\dontrun{
data("leukemia")
nmf_exp <- run_NMF_tensor(leukemia$matrix, ranks = 2:10,
method = "NMF",
n_initializations = 10)
OptK(nmf_exp)
}
}
