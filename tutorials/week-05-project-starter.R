# Week 5: Project Starter
# Goal: start a real analysis project with a clear question.

library(tidyverse)
library(lubridate)

# Project question:
# Which product category and region should the business focus on to grow revenue?

# 1. Load and clean
sales <- read_csv("data/sales.csv") |>
  mutate(
    date = ymd(date),
    revenue = units * unit_price,
    month = floor_date(date, "month")
  )

glimpse(sales)

# 2. Exploratory analysis
sales |>
  summarise(
    orders = n(),
    total_units = sum(units),
    total_revenue = sum(revenue),
    average_order_revenue = mean(revenue)
  )

revenue_by_category <- sales |>
  group_by(category) |>
  summarise(
    orders = n(),
    total_units = sum(units),
    total_revenue = sum(revenue),
    average_order_revenue = mean(revenue),
    .groups = "drop"
  ) |>
  arrange(desc(total_revenue))

revenue_by_region <- sales |>
  group_by(region) |>
  summarise(
    orders = n(),
    total_units = sum(units),
    total_revenue = sum(revenue),
    average_order_revenue = mean(revenue),
    .groups = "drop"
  ) |>
  arrange(desc(total_revenue))

revenue_by_category
revenue_by_region

# 3. Focused analysis
category_region <- sales |>
  group_by(category, region) |>
  summarise(
    total_revenue = sum(revenue),
    total_units = sum(units),
    .groups = "drop"
  ) |>
  arrange(desc(total_revenue))

category_region

# 4. Charts
ggplot(revenue_by_category, aes(x = reorder(category, total_revenue), y = total_revenue)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Revenue by Product Category",
    x = "Category",
    y = "Total Revenue"
  ) +
  theme_minimal()

ggplot(category_region, aes(x = region, y = total_revenue, fill = category)) +
  geom_col(position = "dodge") +
  labs(
    title = "Revenue by Region and Category",
    x = "Region",
    y = "Total Revenue",
    fill = "Category"
  ) +
  theme_minimal()

# 5. Evidence-based recommendations
# Fill these in after looking at the tables and charts.

recommendation_1 <- "Recommendation 1: ..."
evidence_1 <- "Evidence: ..."

recommendation_2 <- "Recommendation 2: ..."
evidence_2 <- "Evidence: ..."

recommendation_3 <- "Recommendation 3: ..."
evidence_3 <- "Evidence: ..."

recommendations <- tibble(
  recommendation = c(recommendation_1, recommendation_2, recommendation_3),
  evidence = c(evidence_1, evidence_2, evidence_3)
)

recommendations

# TRY IT:
# 1. Change the project question to something you care about.
# 2. Replace data/sales.csv with a dataset from Kaggle, data.gov.sg, OWID, or TidyTuesday.
# 3. Keep the same structure: load and clean -> explore -> focused analysis -> recommendations.

# CHECKPOINT:
# Write one paragraph in comments:
# What is your project question, and what decision could your analysis support?
