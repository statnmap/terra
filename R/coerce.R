# Author: Robert J. Hijmans 
# Date : October 2018
# Version 1.0
# License GPL v3

 
setMethod("as.polygons", signature(x="SpatRaster"), 
	function(x, values=FALSE, na.rm=FALSE, ...) {
		p <- methods::new("SpatVector")
		p@ptr <- x@ptr$as_polygons(values, na.rm)
		x <- show_messages(x)
		show_messages(p)
	}
)

setMethod("as.points", signature(x="SpatRaster"), 
	function(x, values=FALSE, na.rm=FALSE, ...) {
		p <- methods::new("SpatVector")
		p@ptr <- x@ptr$as_points(values, na.rm)
		x <- show_messages(x)
		show_messages(p)
	}
)

# mode argument is ignored as mode=mode gave an error on R-devel
setMethod("as.vector", signature(x="SpatExtent"), 
	function(x, mode="any") {
		x@ptr$vector
	}
)

setMethod("as.character", signature(x="SpatExtent"), 
	function(x, ...) {
		paste( x@ptr$vector, collapse=", ")
	}
)


setMethod("as.vector", signature(x="SpatRaster"), 
	function(x, mode="any") {
		values(x, FALSE)
	}
)


setMethod("as.matrix", signature(x="SpatRaster"), 
	function(x, wide=FALSE, ...) {
		if (wide) {
			m <- matrix( values(x, FALSE), nrow=nrow(x), byrow=TRUE)
		} else {
			m <- values(x, matrix=TRUE)
		}
		m
	}
)


setMethod("as.data.frame", signature(x="SpatRaster"), 
	function(x, xy=FALSE, cells=FALSE, ...) {
		d <- NULL
		if (xy) {
			d <- xyFromCell(x, 1:ncell(x))
		} 
		if (cells) {
			d <- cbind(cell=1:ncell(x), d)
		}
		d <- cbind(d, values(x, matrix=TRUE))
		data.frame(d)
	}
)



setMethod("as.array", signature(x="SpatRaster"), 
	function(x, ...) {
		dm <- dim(x)
		x <- values(x, TRUE)
		a <- array(NA, dm)
		for (i in 1:dm[3]) {
			a[,,i] <- matrix(x[,i], nrow=dm[1], byrow=TRUE)
		}
		a	
	}
)


