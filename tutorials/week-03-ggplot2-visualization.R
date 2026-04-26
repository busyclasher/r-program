# Week 3: Visualization with ggplot2
# Goal: choose the right chart type for common analysis questions.

library(tidyverse)

sales <- read_csv("data/sales.csv") |>
  mutate(
    date = as.Date(date),
    revenue = units * unit_price,
    month = format(date, "%Y-%m")
  )

# 1. Scatter plot: relationship between two numeric variables
ggplot(sales, aes(x = units, y = revenue)) +
  geom_point() +
  labs(
    title = "Revenue Increases with Units Sold",
    x = "Units Sold",
    y = "Revenue"
  ) +
  theme_minimal()

# 2. Bar chart with pre-summarised data: geom_col()
revenue_by_region <- sales |>
  group_by(region) |>
  summarise(total_revenue = sum(revenue), .groups = "drop")

ggplot(revenue_by_region, aes(x = region, y = total_revenue)) +
  geom_col() +
  labs(
    title = "Total Revenue by Region",
    x = "Region",
    y = "Total Revenue"
  ) +
  theme_minimal()

# 3. Bar chart that counts rows: geom_bar()
ggplot(sales, aes(x = category)) +
  geom_bar() +
  labs(
    title = "Number of Orders by Category",
    x = "Category",
    y = "Order Count"
  ) +
  theme_minimal()

# 4. Line chart: trend over time
monthly_revenue <- sales |>
  group_by(month) |>
  summarise(total_revenue = sum(revenue), .groups = "drop")

ggplot(monthly_revenue, aes(x = month, y = total_revenue, group = 1)) +
  geom_line() +
  geom_point() +
  labs(
    title = "Monthly Revenue Trend",
    x = "Month",
    y = "Total Revenue"
  ) +
  theme_minimal()

# 5. Histogram: distribution of one numeric variable
ggplot(sales, aes(x = units)) +
  geom_histogram(binwidth = 5) +
  labs(
    title = "Distribution of Units Sold",
    x = "Units Sold",
    y = "Order Count"
  ) +
  theme_minimal()

# 6. Boxplot: compare distributions across groups
ggplot(sales, aes(x = category, y = revenue)) +
  geom_boxplot() +
  labs(
    title = "Revenue Distribution by Category",
    x = "Category",
    y = "Revenue"
  ) +
  theme_minimal()

# 7. facet_wrap(): split one chart into small multiples
ggplot(sales, aes(x = units, y = revenue)) +
  geom_point() +
  facet_wrap(~ category) +
  labs(
    title = "Units and Revenue by Product Category",
    x = "Units Sold",
    y = "Revenue"
  ) +
  theme_minimal()

# TRY IT:
# 1. Make a bar chart of total revenue by category.
# 2. Make a scatter plot of units vs revenue, colored by region.
# 3. Make a boxplot of units by region.

# Write your answers below:



# CHECKPOINT:
# Create one chart that supports this question:
# Which category appears to generate the most revenue?
