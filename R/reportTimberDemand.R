#' @title reportTimberDemand
#' @description reports MAgPIE demand for timber.
#' 
#' @export
#' 
#' @param gdx GDX file
#' @return Timber demand
#' @author Abhijeet Mishra
#' @examples
#' 
#'   \dontrun{
#'     x <- reportTimberDemand(gdx)
#'   }
#' 

reportTimberDemand<-function(gdx){
  a <- NULL
  
  if(suppressWarnings(!is.null(readGDX(gdx,"fcostsALL")))){
    a <- TimberDemand(gdx,level = "regglo")
    a <- mbind(setNames(dimSums(a,dim=3),"Roundwood"),a)
    getNames(a) <- paste0("Timber demand|",getNames(a))
    getNames(a) <- paste0(getNames(a)," (mio tDM)")
  } else {cat("Disabled for magpie run without timber production.")}
  
  return(a)
}