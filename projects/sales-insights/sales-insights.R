# Sales Insights Project
# Run from the repository root:
# Rscript projects/sales-insights/sales-insights.R

required_packages <- c("readr", "dplyr", "ggplot2")
missing_packages <- required_packages[!vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)]

if (length(missing_packages) > 0) {
  stop(
    "Missing required packages: ",
    paste(missing_packages, collapse = ", "),
    "\nInstall them with: install.packages(c(",
    paste(sprintf('"%s"', missing_packages), collapse = ", "),
    "), repos = \"https://cloud.r-project.org\")"
  )
}

library(readr)
library(dplyr)
library(ggplot2)

data_path <- file.path("data", "sales.csv")
output_dir <- file.path("projects", "sales-insights", "output")

if (!file.exists(data_path)) {
  stop("Missing data file: ", data_path)
}

if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

sales <- read_csv(data_path, show_col_types = FALSE) |>
  mutate(
    date = as.Date(date),
    revenue = units * unit_price,
    month = format(date, "%Y-%m")
  )

revenue_by_region <- sales |>
  group_by(region) |>
  summarise(
    total_units = sum(units),
    total_revenue = sum(revenue),
    average_sale = mean(revenue),
    .groups = "drop"
  ) |>
  arrange(desc(total_revenue))

revenue_by_category <- sales |>
  group_by(category) |>
  summarise(
    total_units = sum(units),
    total_revenue = sum(revenue),
    average_sale = mean(revenue),
    .groups = "drop"
  ) |>
  arrange(desc(total_revenue))

monthly_revenue <- sales |>
  group_by(month) |>
  summarise(
    total_units = sum(units),
    total_revenue = sum(revenue),
    .groups = "drop"
  ) |>
  arrange(month)

top_region <- revenue_by_region$region[1]
top_category <- revenue_by_category$category[1]
total_revenue <- sum(sales$revenue)
total_units <- sum(sales$units)
average_sale <- mean(sales$revenue)

write_csv(revenue_by_region, file.path(output_dir, "revenue_by_region.csv"))
write_csv(revenue_by_category, file.path(output_dir, "revenue_by_category.csv"))
write_csv(monthly_revenue, file.path(output_dir, "monthly_revenue.csv"))

writeLines(
  c(
    "Sales Insights Summary",
    "======================",
    "",
    paste("Rows analyzed:", nrow(sales)),
    paste("Total units sold:", total_units),
    paste("Total revenue:", round(total_revenue, 2)),
    paste("Average sale revenue:", round(average_sale, 2)),
    paste("Best region:", top_region),
    paste("Best category:", top_category)
  ),
  file.path(output_dir, "summary-report.txt")
)

theme_sales <- theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    panel.grid.minor = element_blank()
  )

region_chart <- ggplot(revenue_by_region, aes(x = reorder(region, total_revenue), y = total_revenue)) +
  geom_col(fill = "#2f6f9f") +
  coord_flip() +
  labs(
    title = "Revenue by Region",
    x = "Region",
    y = "Revenue"
  ) +
  theme_sales

category_chart <- ggplot(revenue_by_category, aes(x = reorder(category, total_revenue), y = total_revenue)) +
  geom_col(fill = "#3a7d44") +
  coord_flip() +
  labs(
    title = "Revenue by Category",
    x = "Category",
    y = "Revenue"
  ) +
  theme_sales

monthly_chart <- ggplot(monthly_revenue, aes(x = month, y = total_revenue, group = 1)) +
  geom_line(color = "#8a4f7d", linewidth = 1) +
  geom_point(color = "#8a4f7d", size = 3) +
  labs(
    title = "Monthly Revenue Trend",
    x = "Month",
    y = "Revenue"
  ) +
  theme_sales

ggsave(file.path(output_dir, "revenue_by_region.png"), region_chart, width = 8, height = 5)
ggsave(file.path(output_dir, "revenue_by_category.png"), category_chart, width = 8, height = 5)
ggsave(file.path(output_dir, "monthly_revenue.png"), monthly_chart, width = 8, height = 5)

cat("Sales insights project complete.\n")
cat("Output saved to:", output_dir, "\n")
cat("Top region:", top_region, "\n")
cat("Top category:", top_category, "\n")
cat("Total revenue:", round(total_revenue, 2), "\n")

