
test_that("bizarro factors have levels reversed", {
  f1 <- factor(c("abc", "def", "abc"), levels = c("abc", "def"))
  f2 <- factor(c("cba", "fed", "cba"), levels = c("fed", "cba"))
  expect_equal(bizarro(f1), f2)
  expect_equal(bizarro(f2), f1)
})


test_that("bizarro dates can't be constructed", {
  d1 <- as.Date("1990-04-3")
  expect_error(bizarro(d1))
})

test_that("works on characters, integers, doubles, and logicals", {
  ch <- "andrés castro araújo espinosa martínez córdoba gráu parga tono"
  int <- 1:5
  dbl <- rnorm(10)
  lgl <- c(TRUE, FALSE, NA, FALSE, TRUE)
  expect_equal(bizarro(ch), "onot agrap uárg abodróc zenítram asonipse ojúara ortsac sérdna")
  expect_equal(bizarro(int), c(-1L, -2L, -3L, -4L, -5L))
  expect_equal(bizarro(dbl), dbl * -1)
  expect_equal(bizarro(lgl), c(FALSE, TRUE, NA, TRUE, FALSE))
})
