% Copyright Barry Rowlingson  and 
% Peter Diggle (c) 1991-3; https://www.maths.lancs.ac.uk/~rowlings/Splancs/
% R port: copyright 1998-2000 by Roger S. Bivand

\name{tor.shift}
\alias{tor.shift}
\title{
Toroidal shift on a point data set
}
\description{
Perform a toroidal shift on a point data set
}
\usage{
tor.shift(pts,xsh=0.0,ysh=0.0,rect)
}
\arguments{
\item{pts}{
The point data set to shift
}
\item{xsh}{
Amount to shift along the x-axis
}
\item{ysh}{
Amount to shift along the y-axis
}
\item{rect}{
A rectangle defining the region for the toroidal map. If not given, 
the bounding box of \code{pts} is used.
}}
\value{
A point data set like \code{pts}, but after application of a toroidal 
shift along the x and y axes. 
}
\details{
The planar region defined by \code{rect}
is assumed connected at its top and bottom edges, and at its left and
right sides. A shift of \code{xsh} and \code{ysh} is applied to the 
points and the resulting set of points returned. 


}
\seealso{
\code{\link{Shift}}
}

\references{
Rowlingson, B. and Diggle, P. 1993 Splancs: spatial point pattern analysis
code in S-Plus.  Computers and Geosciences, 19, 627-655;
the original sources can be accessed at:
\url{https://www.maths.lancs.ac.uk/~rowlings/Splancs/}. See also Bivand, R. and
Gebhardt, A. 2000 Implementing functions for spatial statistical analysis
using the R language. Journal of Geographical Systems, 2, 307-317.
}

% Converted by Sd2Rd version 0.3-3.
\keyword{spatial}

