# Week 1: Setup and Orientation
# Goal: feel comfortable using RStudio, loading a CSV, and inspecting data.

# Run this once if tidyverse is not installed:
# install.packages("tidyverse")

library(tidyverse)

# 1. Create a few objects
student_name <- "Your Name"
study_hours <- 5
is_learning_r <- TRUE

student_name
study_hours
is_learning_r

# 2. Load the sample CSV from this repo
sales <- read_csv("data/sales.csv")

# 3. Inspect the data
glimpse(sales)
head(sales)
View(sales) # Works in RStudio

# 4. Ask simple questions
nrow(sales)
ncol(sales)
names(sales)
summary(sales)

# 5. Create a new column
sales <- sales |>
  mutate(revenue = units * unit_price)

glimpse(sales)

# TRY IT:
# 1. Run every line above with Ctrl+Enter or Cmd+Enter.
# 2. Change student_name to your own name.
# 3. Use View(sales) and click around the data viewer.
# 4. Find the highest value in the units column.

max(sales$units)

# CHECKPOINT:
# Answer these in comments below:
# 1. How many rows are in sales?
# 2. What columns does sales contain?
# 3. What does the revenue column mean?
