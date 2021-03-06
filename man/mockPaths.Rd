% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mock-paths.R
\name{mockPaths}
\alias{mockPaths}
\alias{db_mock_paths}
\alias{.db_mock_paths}
\title{Set an alternate directory for mock API fixtures}
\usage{
db_mock_paths(new, last = FALSE)

.db_mock_paths(new)
}
\arguments{
\item{new}{either a character vector of path(s) to add, or \code{NULL} to reset
to the default.}

\item{last}{a logical, should the new path given be added to the end of the
list of paths? (default: \code{FALSE})}
}
\value{
If \code{new} is omitted, the function returns the current search paths, a
character vector. If \code{new} is provided, the updated value will be returned
invisibly.
}
\description{
By default, \code{with_mock_api} will look for mocks relative to the current
working directory (or the test directory). If you want to look in other
places, you can call \code{db_mock_paths} to add directories to the search path.
}
\details{
It works like \code{\link[base:.libPaths]{base::.libPaths()}}: any directories you specify will be added
to the list and searched first. The default directory will be searched last.
Only unique values are kept: if you provide a path that is already found in
\code{db_mock_paths}, the result effectively moves that path to the first
position.

When you are capturing fixtures (e.g. with \code{\link{start_db_capturing}}), the first
path is used as the path to save the fixtures in. For this reason, you may
want to set the \code{last} argument to \code{TRUE} if you want to read from a
directory but don't want to write to it.

For finer-grained control, or to completely override the default behavior
of searching in the current working directory, you can set the option
"dittodb.mock.paths" directly.

This function is similar to \code{.mockPaths()} from
\href{https://CRAN.R-project.org/package=httptest}{httptest}

The function \code{.db_mock_paths} is the same as \code{db_mock_paths} although it is
deprecated and should not be used.
}
\examples{
\dontrun{
# reset mock paths to default
db_mock_paths(NULL)

identical(db_mock_paths(), c("tests/testthat/", "."))
db_mock_paths("/var/somewhere/else")
identical(db_mock_paths(), c("/var/somewhere/else", "tests/testthat/", "."))
db_mock_paths(NULL)
identical(db_mock_paths(), c("tests/testthat/", "."))
db_mock_paths("/var/somewhere/else", last = TRUE)
identical(db_mock_paths(), c("tests/testthat/", ".", "/var/somewhere/else"))
}
}
\keyword{internal}
