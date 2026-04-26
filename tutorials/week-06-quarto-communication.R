# Week 6: Polish and Communicate
# Goal: prepare your analysis for a Quarto report.

library(tidyverse)
library(lubridate)

sales <- read_csv("data/sales.csv") |>
  mutate(
    date = ymd(date),
    revenue = units * unit_price,
    month = floor_date(date, "month")
  )

revenue_by_category <- sales |>
  group_by(category) |>
  summarise(total_revenue = sum(revenue), .groups = "drop") |>
  arrange(desc(total_revenue))

revenue_by_region <- sales |>
  group_by(region) |>
  summarise(total_revenue = sum(revenue), .groups = "drop") |>
  arrange(desc(total_revenue))

# 1. Presentation-quality chart
category_chart <- ggplot(
  revenue_by_category,
  aes(x = reorder(category, total_revenue), y = total_revenue)
) +
  geom_col(fill = "#2F6B8A") +
  coord_flip() +
  labs(
    title = "Notebook Sales Generated the Most Revenue",
    subtitle = "Revenue calculated as units multiplied by unit price",
    x = NULL,
    y = "Total Revenue"
  ) +
  theme_minimal()

category_chart

# 2. Save chart for a report
if (!dir.exists("output")) {
  dir.create("output")
}

ggsave(
  filename = "output/category-revenue-chart.png",
  plot = category_chart,
  width = 8,
  height = 5
)

# 3. Report outline
# Use this as the structure for a Quarto .qmd file:
#
# ---
# title: "Sales Data Analysis"
# format: html
# ---
#
# ## Summary
# One paragraph explaining the main finding and recommendation.
#
# ## Data
# Where the data came from, what each row means, and any cleaning steps.
#
# ## Exploratory Analysis
# Show 2-3 charts/tables that explain the data.
#
# ## Focused Analysis
# Answer your main project question with evidence.
#
# ## Recommendations
# Give 2-3 recommendations. Each recommendation needs evidence.
#
# ## Limitations
# Explain what the data cannot tell you.

# 4. Narrative template
main_finding <- "The highest revenue category is ..."
supporting_evidence <- "This is supported by ..."
recommendation <- "The business should ..."
limitation <- "One limitation is ..."

tibble(
  section = c("Main finding", "Evidence", "Recommendation", "Limitation"),
  draft_text = c(main_finding, supporting_evidence, recommendation, limitation)
)

# TRY IT:
# 1. Rewrite the chart title so it states a finding, not just a topic.
# 2. Add clearer axis labels to one of your Week 5 charts.
# 3. Draft your Summary, Recommendations, and Limitations sections.

# CHECKPOINT:
# Create a final list of 2-3 recommendations with evidence from your analysis.
