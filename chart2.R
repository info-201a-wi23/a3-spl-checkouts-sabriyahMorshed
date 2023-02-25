# Chart 2 is a visual display of the ratio of E-book to book checkouts every year from 2022 to 2023. This chart takes on the form of a bar graph.

# Load relevant packages

library(ggplot2)
library(scales)

# Read in relevant files

source("C:/Users/sabri/OneDrive/Desktop/info201_Exercises/a3-spl-checkouts-sabriyahMorshed/summary.R")

# Creating Chart 2

ggplot(total_book_and_ebook_checkout, aes(x = CheckoutYear, y = ratio_ebooks_to_books)) +
  geom_bar(stat = "identity", fill = "#BFDB38") +
  labs(title = "Magnitude of e-book to print book checkouts in each year",
       x = "Year",
       y = "Ratio of e-book to print book checkouts") +
  theme(
    plot.background = element_rect(fill = "#F7F7F7"),
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(), 
    panel.background = element_rect(fill = "#EEEEEE"),
    plot.title = element_text(color = "#00425A", hjust = 0.5, face = "bold"),
    legend.title = element_text(color = "#00425A", face = "bold"),
    legend.text = element_text(color = "#00425A"),
    legend.background = element_rect(fill = "#F7F7F7"),
    axis.title = element_text(color = "#00425A", face = "bold"),
    axis.text = element_text(color = "#00425A")
  ) 

# Print plot

ggsave("chart1.png")

