# Chart 3 is a visual representation of average books checked out over all years spanning from 2017 to 2023 and average E-books checked out

# Load relevant packages

library(ggplot2)
library(scales)
library(dplyr)

# Read in relevant files

source("C:/Users/sabri/OneDrive/Desktop/info201_Exercises/a3-spl-checkouts-sabriyahMorshed/summary.R")

# Creating a dataframe of the two required values for this visualization

avg_dataframe <- data.frame(
  Type = c("Books", "E-books"),
  avg_checkouts = c(avg_books, avg_ebooks)
)

# Creating Chart 3


ggplot(avg_dataframe, aes(x = "", y = avg_checkouts, fill = Type, names = c("Books", "E-books"))) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start=0) +
  scale_fill_manual(values = c("#FC7300", "#BFDB38")) +
  geom_text(aes(label = paste0(round(avg_checkouts), " (", percent(avg_checkouts/sum(avg_checkouts)), ")")), position = position_stack(vjust = 0.5), color = "white", size = 6) +
  labs(
    title = "Average E-book and Book Checkouts (All-Time)"
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
    axis.title = element_blank(),
    axis.text = element_blank(),
  )

# Print plot

ggsave("chart3.png")
 
