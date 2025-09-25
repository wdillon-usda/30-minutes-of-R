# https://zkamvar.github.io/blog/using-a-custom-library-in-r/

# Write a function to create personal R library directory
create_personal_library <- function(library_folder_name) {
  # Get the home directory
  home_dir <- path.expand("~")

  # Define the personal library path
  personal_lib_path <- file.path(home_dir, library_folder_name)

  # Create the directory if it does not exist
  if (!dir.exists(personal_lib_path)) {
    dir.create(personal_lib_path, recursive = TRUE)
    message("Created personal R library at: ", personal_lib_path)
  } else {
    message("Personal R library already exists at: ", personal_lib_path)
  }

  # Set the R_LIBS_USER environment variable
  Sys.setenv(R_LIBS_USER = personal_lib_path)

  # Add this to the .Renviron file
  if (file.exists("~/.Renviron")) {
    message("~/.Renviron already exists!")
  } else {
    file.create("~/.Renviron")
    message("created ~/.Renviron")
  }
  cat(paste0("R_LIBS_USER='", personal_lib_path, "'", "\n"), file = "~/.Renviron", append = TRUE)
  message("Restart R to apply changes.")
}
# Example usage
# create_personal_library("myRlibrary")
