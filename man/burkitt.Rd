% Copyright Barry Rowlingson  and 
% Peter Diggle (c) 1991-3; http://www.maths.lancs.ac.uk/~rowlings/Splancs/
% R port: copyright 1998-2000 by Roger S. Bivand
%
%  This program is free software; you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published by
%  the Free Software Foundation; either version 2 of the License, or
%  (at your option) any later version.
%
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
%
 
\name{burkitt}
\title{Burkitt's lymphoma in Uganda}
\usage{data(burkitt)}
\alias{burkitt}
\alias{burbdy}
\alias{burpts}
\format{The data is provided as a data table:
  \tabular{lll}{
    x  \tab numeric  \tab grid eastings\cr
    y   \tab numeric  \tab grid northings\cr
    t \tab	numeric	\tab day number starting at 1/1/1960 of onset\cr
    age \tab numeric \tab age of child patient\cr
  }
  as a points object \code{burpts} of \code{burkitt$x} and \code{burkitt$y}; and a point object of the area boundary \code{burbdy}.
}
\source{Williams, E. H. et al. 1978, - Bailey and Gatrell 1995, ch. 3.
}
\description{Locations of cases of Burkitt's lymphoma in the Western Nile
district of Uganda 1960-1975. The time variable is recorded as the number of
days starting from an origin of 1 Jan 1960. The examples given below show
how the \code{chron()} function and derived time structures may be used to
analyse the data in the time dimension.

}
\references{Bailey, T. C. and Gatrell, A. C. 1995, Interactive spatial data analysis. Longman, Harlow.

}
\examples{
data(burkitt)
try.obj <- try(library(chron))
if (!is.na(match("chron", try.obj))) {
burdates <- chron(burkitt$t, out.format="y-m-d",
	origin=c(day=1, month=1, year=1960))
froms <- seq.dates(chron("7/1/1960", origin=c(1,1,1960)),
	chron("7/1/1975", origin=c(1,1,1960)), "years")
tos <- seq.dates(chron("9/30/1960", origin=c(1,1,1960)),
	chron("9/30/1975", origin=c(1,1,1960)), "years")
burd <- density(burdates, bw=100)
plot(chron(burd$x, origin=c(day=1, month=1, year=1960)), burd$y,
	type="n", xaxp=c(chron("1/1/1960", origin=c(1,1,1960)),
	chron("1/1/1976", origin=c(1,1,1960)),16), xlab="time",
ylab="density")
for (i in 1:length(tos)) polygon(c(froms[i], tos[i], tos[i], froms[i]),
	c(par("usr")[3], par("usr")[3], par("usr")[4], par("usr")[4]), 
	col="grey", border=NULL)
lines(chron(burd$x, origin=c(day=1, month=1, year=1960)), burd$y,
	lwd=3, col="red")
title("Density plot of Burkitt's lymphoma in West Nile district, 3Q grey shaded")
op <- par(mfrow=c(3,5))
for (i in 1961:1975) {
	polymap(burbdy)
	pointmap(burpts[which(years(burdates) == i),], add=T, pch=19)
	title(i)
}
par(op)
op <- par(mfrow=c(2,2))
for (i in 1:4) {
	polymap(burbdy)
	pointmap(burpts[which(codes(quarters(burdates)) == i),], add=T,
pch=19)
	title(paste(i, "Q", sep=""))
}
par(op)
op <- par(mfrow=c(3,4))
for (i in 1:12) {
	polymap(burbdy)
	pointmap(burpts[which(codes(months(burdates)) == i),], add=T, pch=19)
	title(levels(months(burdates, F))[i])
}
par(op)
}

}

\keyword{datasets}
