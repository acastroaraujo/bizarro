

#' Bizarro types
#'
#' @param x numeric, character, factor, logical, or data frame
#'
#' @return bizarro output (i.e. everything is upside down)
#' @export
#'
bizarro <- function(x) {
  UseMethod("bizarro")
}


str_reverse <- function(x) {
  purrr::map_chr(stringr::str_split(x, ""),
                 function(x) stringr::str_flatten(rev(x))
  )
}

#' @export
bizarro.character <- function(x) {
  str_reverse(x)
}


#' @export
bizarro.numeric <- function(x) {
  -x
}


#' @export
bizarro.default <- function(x) {
  stop(
    "Don't know how to make bizzaro <",
    class(x)[[1]], ">",
    call. = FALSE
  )
}


#' @export
bizarro.data.frame <- function(x) {
  purrr::map_df(x, bizarro)
}


#' @export
bizarro.factor <- function(x) {
  attr(x, "levels") <- bizarro(attr(x, "levels"))
  factor(x, levels = rev(levels(x)))
}


#' @export
bizarro.logical <- function(x) {
  ifelse(x, FALSE, TRUE)
}







