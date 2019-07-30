#' @title RotationLength
#' @description reads rotation length out of a MAgPIE gdx file
#' 
#' @export
#'
#' @param gdx GDX file
#' @param file a file name the output should be written to using write.magpie
#' @param level Level of regional aggregation; "cell", "reg" (regional), "glo" (global), "regglo" (regional and global) or any secdforest aggregation level defined in superAggregate
#' @details Forest rotation length
#' @return Forest rotation length
#' @author Abhijeet Mishra
#' @importFrom gdx readGDX out
#' @importFrom magclass clean_magpie dimSums collapseNames setYears write.magpie
#' @importFrom luscale superAggregate
#' @examples
#' 
#'   \dontrun{
#'     x <- RotationLength(gdx)
#'   }

RotationLength <- function(gdx, file=NULL, level="regglo"){
  a <- NULL
  
  if (level != "regglo"){
    cat("NULL. Set level to regglo.")
  } else{
    estb_rl <- readGDX(gdx,"p32_rot_length")
    harvest_rl <- readGDX(gdx,"p32_rot_length_estb")
    a <- mbind(setNames(estb_rl,"Establishment"),setNames(harvest_rl,"Harvest"))
    a <- superAggregate(data = a,aggr_type = "mean",level = "regglo")
  }

  out(a,file)
}