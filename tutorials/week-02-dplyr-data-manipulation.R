# Week 2: Data Manipulation with dplyr
# Goal: answer grouped summary questions using dplyr.

library(tidyverse)

sales <- read_csv("data/sales.csv") |>
  mutate(revenue = units * unit_price)

# 1. The pipe
# Read this as: take sales, then filter rows, then select columns.
sales |>
  filter(region == "North") |>
  select(date, category, units, revenue)

# 2. filter(): keep rows
sales |>
  filter(units >= 30)

sales |>
  filter(category == "Notebook", revenue > 60)

# 3. select(): keep columns
sales |>
  select(date, region, revenue)

# 4. arrange(): sort rows
sales |>
  arrange(desc(revenue))

# 5. mutate(): create or change columns
sales |>
  mutate(
    revenue = units * unit_price,
    large_order = units >= 30
  )

# 6. group_by() + summarise(): grouped analysis
sales |>
  group_by(region) |>
  summarise(
    total_units = sum(units),
    total_revenue = sum(revenue),
    average_revenue = mean(revenue),
    .groups = "drop"
  ) |>
  arrange(desc(total_revenue))

sales |>
  group_by(category) |>
  summarise(
    orders = n(),
    total_units = sum(units),
    total_revenue = sum(revenue),
    .groups = "drop"
  ) |>
  arrange(desc(total_revenue))

# Practice with a built-in tidyverse dataset
mpg |>
  group_by(class) |>
  summarise(
    average_city_mpg = mean(cty),
    average_highway_mpg = mean(hwy),
    .groups = "drop"
  ) |>
  arrange(desc(average_highway_mpg))

# TRY IT:
# 1. Show only East region rows.
# 2. Show date, category, and units only.
# 3. Sort sales from lowest revenue to highest revenue.
# 4. Calculate average units by category.

# Write your answers below:



# CHECKPOINT:
# Answer this question with code:
# Which region has the highest total revenue?
