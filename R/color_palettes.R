# color_palettes.R

# 定义配色方案，使用列表结构
palettes <- list(
  default = c("#00AFBB", "#E7B800"),
  venti = c("#151A2E", "#03A3D7", "#2F9C7C", "#AFB83E", "#F8F9F4"),
  mediterranean = c("#383EF1", "#5757F8", "#1E90FE", "#549FFA", "#90BFF8", "#C7DEF8"),
  hsbc = c("#EE3524", "#231F20", "#FFFFFF", "#9FA1A4")
)

# 获取配色方案的函数
#' Get Color Palette by Name
#'
#' This function returns the color palette based on the given name.
#'
#' @param palette_name A string representing the name of the palette (e.g., "default", "venti").
#' @return A vector of hex color codes for the requested palette.
#' @export
get_palette <- function(palette_name) {
  # 获取指定名称的配色方案
  if (palette_name %in% names(palettes)) {
    return(palettes[[palette_name]])
  } else {
    stop("Unknown palette: ", palette_name)
  }
}

# 显示配色方案的函数
#' Show Color Palette
#'
#' This function displays the selected color palette.
#'
#' @param palette_name A string, the name of the palette ("default", "venti", "mediterranean", "hsbc").
#' @export
show_palette <- function(palette_name) {
  # 获取配色方案
  colors <- get_palette(palette_name)

  # 绘制配色方案
  barplot(rep(1, length(colors)), col = colors, border = NA, space = 0, axes = FALSE, main = paste("Palette:", palette_name))
}
