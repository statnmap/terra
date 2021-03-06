\name{math}

\docType{methods}

\alias{Arith-methods}
\alias{Compare-methods}
\alias{Math-methods}

\alias{Arith,SpatRaster,SpatRaster-method}
\alias{Arith,SpatRaster,missing-method}
\alias{Arith,numeric,SpatRaster-method}
\alias{Arith,SpatRaster,numeric-method}
\alias{Arith,missing,SpatRaster-method}
\alias{Compare,SpatRaster,SpatRaster-method}
\alias{Compare,numeric,SpatRaster-method}
\alias{Compare,SpatRaster,numeric-method}
\alias{Compare,SpatRaster,math-method}
\alias{Math,SpatRaster-method}


\title{Mathematical operations with SpatRaster objects}

\description{
Standard arithmetic operators for computations with Raster* objects and numeric values. The following operators are available:

\code{ +, -, *, /, ^, \%\%, \%/\% }

\code{==, !=, >, <,  <=, >=}
 
\code{"abs", "sign", "sqrt", "ceiling", "floor", "trunc",  "cummax", "cummin", }

\code{"cumprod", "cumsum", "log", "log10", "log2", "log1p", "acos", "acosh", "asin", }

\code{"asinh", "atan", "atanh", "exp", "expm1", "cos", "cosh", "sin", "sinh", "tan", "tanh"}. 
 
If multiple SpatRaster objects are used, these should have the same extent and resolution. Operators are applied on a cell by cell basis.
}


\value{
SpatRaster
}

\examples{
r1 <- rast(ncols=10, nrows=10)
values(r1) <- runif(ncell(r1))
r2 <- rast(ncols=10, nrows=10)
values(r2) <- 1:ncell(r2) / ncell(r2)
r3 <- r1 + r2
r2 <- r1 / 10
r3 <- r1 * (r2 - 1 / r2)


b <- c(r1, r2, r3)
b2 <- b * 10
sqrt(b2)
}

\keyword{methods}
\keyword{math}
\keyword{spatial}
