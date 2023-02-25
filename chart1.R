# Chart 1 details the total number of e-book checkouts versus the total number of book checkouts from 2017 to 2023.

# Load relevant packages

library(ggplot2)
library(scales)

# Read in relevant files

source("C:/Users/sabri/OneDrive/Desktop/info201_Exercises/a3-spl-checkouts-sabriyahMorshed/summary.R")

# Creating Chart 1

ggplot(total_book_and_ebook_checkout, aes(x = CheckoutYear)) +
  geom_line(aes(y = book_checkouts, color = "Book Checkouts"), size = 1) +
  geom_line(aes(y = ebook_checkouts, color = "E-book Checkouts"), size = 1) +
  labs(
    title = "E-book and Book Checkouts Over Time (2017 - 2023)",
    x = "Year",
    y = "Number of Checkouts",
    color = "Checkout Type"
  ) +
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
  ) +
  scale_color_manual(values = c("#FC7300", "#BFDB38")) +
    scale_x_continuous(limits = c(2017, 2023), breaks = seq(2017, 2023, 1.0)) +
    scale_y_continuous(limits = c(0, 1600000), breaks = seq(0, 1600000, 200000), labels =    label_number_si())

# Print plot

ggsave("chart1.png")
                                            
