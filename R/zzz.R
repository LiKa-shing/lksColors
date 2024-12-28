# zzz.R

.onLoad <- function(libname, pkgname) {
  assign("lksColorsEnv", new.env(), envir = asNamespace(pkgname))
  lksColorsEnv$palettes <- load_palettes_from_rds(system.file("extdata", "palettes.rds", package = pkgname))
}
