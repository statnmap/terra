
loadModule("spat", TRUE)


.onAttach <- function(libname, pkgname) {
	min_raster <- "2.8.13"
	tv <- utils::packageVersion("terra")
	m <- paste0("\nterra ", tv, "\nThis is an early version of the \"terra\" package, for evaluation only\n")
	e <- try(vv <- utils::packageVersion("raster"), silent=TRUE)
	if (class(e)[1] == "try-error") {
		m <- paste0(m,"For this package to work you need to install version ", min_raster, 
		" or higher of the \"raster\" package\n" )	
	} else if (vv < min_raster) {
		m <- paste0(m,"For this package to work you need to install version ", min_raster, 
		" or higher of the \"raster\" package\nYou have version: ", vv,"\n" )
	} 
	packageStartupMessage(m)
	
##############################
	.create_options()
}


