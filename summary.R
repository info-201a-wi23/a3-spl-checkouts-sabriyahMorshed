# Read in the csv file from a local file path

spl_df <- read.csv("C:/Users/sabri/OneDrive/Desktop/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Load relevant packages

library(dplyr)
library(ggplot2)


# Broad question: What is the trend over time in e-book popularity relative to traditional print books?


# Question 1 (Q1): What is the total number of E-books checked out in each year listed in the dataframe? Print books?

# Q1 Part 1: E-books

ebooks <- spl_df %>%
  filter(MaterialType == "EBOOK", na.rm = TRUE)

total_ebooks <- ebooks %>%
  group_by(CheckoutYear) %>%
  summarize(ebook_checkouts = sum(Checkouts))

# Q1 Part 2: Print books

books <- spl_df %>%
  filter(MaterialType == "BOOK", na.rm = TRUE)

total_books <- books %>%
  group_by(CheckoutYear) %>%
  summarize(book_checkouts = sum(Checkouts))


# Question 2 (Q2): Has there been a year(s) where E-books were checked out more than print books?

total_book_and_ebook_checkout <- inner_join(total_ebooks, total_books, by = NULL)

most_ebook_checkouts <- total_book_and_ebook_checkout %>%
  group_by(CheckoutYear) %>%
  filter(ebook_checkouts >= book_checkouts, na.rm = TRUE)


# Question 3 (Q3): What is the average number of E-books checked out? Books?

# Q3 Part 1: Ebooks

avg_ebooks <- mean(ebooks$Checkouts)

# Q3 Part 2: Books

avg_books <- mean(books$Checkouts)


# Question 4 (Q4): What year had the most E-book checkouts?

year_max_ebook_checkouts <- ebooks %>%
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>%
  pull(CheckoutYear)


# Question 5 (Q5): What is the ratio of E-book / Book Checkouts in each year?

total_book_and_ebook_checkout <- mutate(total_book_and_ebook_checkout, ratio_ebooks_to_books = ebook_checkouts / book_checkouts)

