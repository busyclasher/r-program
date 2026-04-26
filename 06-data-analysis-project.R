# Basic R Project: Sales Data Analysis
# Run with: Rscript 06-data-analysis-project.R

data_path <- file.path("data", "sales.csv")
output_dir <- "output"

if (!file.exists(data_path)) {
  stop("Missing data file: ", data_path)
}

if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# 1. Load data
sales <- read.csv(data_path, stringsAsFactors = FALSE)
sales$date <- as.Date(sales$date)
sales$revenue <- sales$units * sales$unit_price
sales$month <- format(sales$date, "%Y-%m")

cat("Sales data loaded\n")
cat("Rows:", nrow(sales), "\n")
cat("Columns:", ncol(sales), "\n\n")

# 2. Inspect data
cat("First rows:\n")
print(head(sales))

cat("\nColumn summary:\n")
print(summary(sales))

# 3. Clean/check data
missing_values <- colSums(is.na(sales))
cat("\nMissing values by column:\n")
print(missing_values)

if (any(sales$units < 0) || any(sales$unit_price < 0)) {
  warning("Negative units or prices found. Check source data.")
}

# 4. Analyze totals
total_units <- sum(sales$units)
total_revenue <- sum(sales$revenue)
average_order_revenue <- mean(sales$revenue)

cat("\nKey metrics:\n")
cat("Total units sold:", total_units, "\n")
cat("Total revenue:", round(total_revenue, 2), "\n")
cat("Average order revenue:", round(average_order_revenue, 2), "\n")

# 5. Grouped summaries
revenue_by_region <- aggregate(revenue ~ region, data = sales, sum)
revenue_by_region <- revenue_by_region[order(-revenue_by_region$revenue), ]

revenue_by_category <- aggregate(revenue ~ category, data = sales, sum)
revenue_by_category <- revenue_by_category[order(-revenue_by_category$revenue), ]

monthly_revenue <- aggregate(revenue ~ month, data = sales, sum)

cat("\nRevenue by region:\n")
print(revenue_by_region)

cat("\nRevenue by category:\n")
print(revenue_by_category)

cat("\nMonthly revenue:\n")
print(monthly_revenue)

# 6. Save results
write.csv(revenue_by_region, file.path(output_dir, "revenue_by_region.csv"), row.names = FALSE)
write.csv(revenue_by_category, file.path(output_dir, "revenue_by_category.csv"), row.names = FALSE)
write.csv(monthly_revenue, file.path(output_dir, "monthly_revenue.csv"), row.names = FALSE)

# 7. Create charts
png(file.path(output_dir, "revenue_by_region.png"), width = 800, height = 500)
barplot(
  revenue_by_region$revenue,
  names.arg = revenue_by_region$region,
  main = "Revenue by Region",
  xlab = "Region",
  ylab = "Revenue",
  col = "steelblue"
)
dev.off()

png(file.path(output_dir, "monthly_revenue.png"), width = 800, height = 500)
plot(
  monthly_revenue$revenue,
  type = "o",
  xaxt = "n",
  main = "Monthly Revenue",
  xlab = "Month",
  ylab = "Revenue",
  col = "darkgreen",
  pch = 16
)
axis(1, at = seq_along(monthly_revenue$month), labels = monthly_revenue$month)
dev.off()

cat("\nAnalysis complete. Results saved in the output folder.\n")
