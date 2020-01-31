

#' Bizarro types
#'
#' @param x numeric, character, factor, logical, or data frame
#'
#' @return bizarro output (i.e. everything is upside down)
#' @export
#'
bizarro <- function(x) {
  # This uses magic to pass arguments to the right method
  UseMethod("bizarro")
}


str_reverse <- function(x) {
  purrr::map_chr(stringr::str_split(x, ""),
                 function(x) stringr::str_flatten(rev(x))
  )
}

bizarro.character <- function(x) {
  str_reverse(x)
}

bizarro.numeric <- function(x) {
  -x
}

bizarro.default <- function(x) {
  stop(
    "Don't know how to make bizzaro <",
    class(x)[[1]], ">",
    call. = FALSE
  )
}


bizarro.data.frame <- function(x) {
  purrr::map_df(x, bizarro)
}


bizarro.factor <- function(x) {
  attr(x, "levels") <- bizarro(attr(x, "levels"))
  factor(x, levels = rev(levels(x)))
}

bizarro.logical <- function(x) {
  ifelse(x, FALSE, TRUE)
}





