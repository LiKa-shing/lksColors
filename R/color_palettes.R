# color_palettes.R
#' Load Color Palettes from RDS File
#'
#' This function loads a list of color palettes stored in an RDS file.
#' If the file is missing, an error will be thrown.
load_palettes_from_rds <- function(path) {
  if (file.exists(path)) {
    return(readRDS(path))  # Load color palettes from the RDS file
  } else {
    stop("Color palette is missing")  # If the file is missing, stop with an error message
  }
}


#' Get Color Palette by Name
#'
#' This function returns a color palette by its name.
#' The palette name must match one of the available palettes in the package.
#'
#' @param palette_name A string representing the name of the palette (e.g. "default").
#' @return A vector of hex color codes for the requested palette.
#' @export
#' @examples
#' # Get the "hsbc" color palette
#' hsbc_palette <- get_palette("hsbc")
get_palette <- function(palette_name) {
  # Retrieve palettes from the package environment
  palettes <- get("lksColorsEnv", envir = asNamespace("lksColors"))$palettes
  palette_name <- match.arg(palette_name, choices = names(palettes))  # Ensure the palette name is valid
  return(palettes[[palette_name]])  # Return the requested palette
}


#' Show Color Palette
#'
#' This function displays a color palette as a barplot.
#' Optionally, color names can be shown above each color bar.
#'
#' @param palette_name A string representing the name of the palette (e.g., "default").
#' @param show_names A logical value indicating whether to display the color names on the plot. Default is FALSE.
#' @export
#' @examples
#' # Show the "default" palette
#' show_palette("default")
#'
#' # Show the "default" palette with color names
#' show_palette("default", show_names = TRUE)
show_palette <- function(palette_name, show_names = FALSE) {
  # Get the colors from the requested palette
  colors <- get_palette(palette_name)

  # Create a data frame to store color and its name
  color_data <- data.frame(
    color = colors,
    name = if (show_names) names(colors) else rep("", length(colors))  # Display names if required
  )

  # Display the color palette using a barplot
  barplot(rep(1, length(colors)), col = colors, border = NA, space = 0, axes = FALSE,
          main = paste("Palette:", palette_name))

  # Add color names on the plot if requested
  if (show_names) {
    text(x = seq_along(colors), y = rep(1, length(colors)), labels = color_data$name,
         col = "black", cex = 0.8, pos = 3)  # Adjust text positioning
  }
}
