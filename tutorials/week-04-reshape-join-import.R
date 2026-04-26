# Week 4: Reshaping, Joining, and Importing Real Data
# Goal: practice common messy-data operations.

library(tidyverse)
library(lubridate)

sales <- read_csv("data/sales.csv") |>
  mutate(
    date = ymd(date),
    revenue = units * unit_price
  )

# 1. Dates with lubridate
sales_with_dates <- sales |>
  mutate(
    year = year(date),
    month = month(date),
    month_name = month(date, label = TRUE)
  )

glimpse(sales_with_dates)

# 2. Reshape wide to long with pivot_longer()
wide_targets <- tibble(
  region = c("North", "South", "East", "West"),
  target_2026_01 = c(110, 105, 100, 95),
  target_2026_02 = c(120, 110, 108, 100),
  target_2026_03 = c(130, 120, 115, 105)
)

long_targets <- wide_targets |>
  pivot_longer(
    cols = starts_with("target_"),
    names_to = "month",
    values_to = "target_revenue"
  ) |>
  mutate(month = str_remove(month, "target_"))

long_targets

# 3. Reshape long to wide with pivot_wider()
long_targets |>
  pivot_wider(
    names_from = month,
    values_from = target_revenue
  )

# 4. Joins
region_info <- tibble(
  region = c("North", "South", "East", "West"),
  manager = c("Aisha", "Ben", "Chen", "Divya"),
  market_size = c("Large", "Medium", "Medium", "Small")
)

sales_with_region_info <- sales |>
  left_join(region_info, by = "region")

glimpse(sales_with_region_info)

# 5. Monthly sales joined to monthly targets
monthly_sales <- sales |>
  mutate(month = format(date, "%Y_%m")) |>
  group_by(region, month) |>
  summarise(actual_revenue = sum(revenue), .groups = "drop")

monthly_sales |>
  left_join(long_targets, by = c("region", "month")) |>
  mutate(difference = actual_revenue - target_revenue)

# TRY IT:
# 1. Add a product lookup table with category and supplier.
# 2. Join it to sales.
# 3. Create a long table from a made-up wide table with three year columns.
# 4. Extract the year and month from sales$date.

# Write your answers below:



# CHECKPOINT:
# Create a table showing actual revenue, target revenue, and difference by region/month.
