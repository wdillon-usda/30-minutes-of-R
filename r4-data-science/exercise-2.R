# https://r4ds.hadley.nz/workflow-basics.html#exercises

my_variable <- 10
my_varıable
#> Error: object 'my_varıable' not found

## Asked CoPilot some questions within the RStudio interface ###
#Q: What is the error in the code above?
#A: The error is due to the use of a non-standard character 'ı' (dotless i) in the variable name 'my_varıable'. Variable names in R must consist of standard alphanumeric characters and underscores only.

# How do I make a scatterplot in R?
#A: You can create a scatterplot in R using the `plot()` function. Here is an example:
# Sample data
x <- c(1, 2, 3, 4, 5)
y <- c(2, 3, 5, 7, 11)
# Create scatterplot
plot(x, y, main="Scatterplot Example", xlab="X-axis Label", ylab="Y-axis Label", pch=19, col="blue")
# This will create a scatterplot with points defined by the vectors x and y.
###

# Tweak each of the following R commands so that they run correctly:
library(tidyverse)

ggplot(dTA = mpg) + 
  geom_point(maping = aes(x = displ, y = hwy)) +
  geom_smooth(method = "lm")


# Press Alt+Shift+K
# Alt+-

d <- c(2, 3, 5, 7, 11)
  
e = c(2, 3, 5, 7, 11)

# Let’s revisit an exercise from the Section 1.6. Run the following lines of code. Which of the two plots is saved as mpg-plot.png? Why?

my_bar_plot <- ggplot(mpg, aes(x = class)) +
  geom_bar()
my_scatter_plot <- ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave(filename = "mpg-plot.png", plot = my_bar_plot)


#Ctrl+Shift+M
mpg %>%
  filter(cyl == 4) %>%
  select(manufacturer)

#Ctrl+Shift+M
# select(filter(mpg, cyl == 4), manufacturer)
