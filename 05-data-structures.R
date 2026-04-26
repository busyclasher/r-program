# R Fundamentals: Data Structures
# Lists and Data Frames

# LIST - ordered collection of elements (can be different types)
my_list <- list(
  name = "Alice",
  age = 25,
  scores = c(85, 90, 88),
  is_active = TRUE
)

print(my_list)

# Access list elements
print(my_list$name)        # By name
print(my_list[[1]])        # By index
print(my_list[["age"]])    # By name with brackets

# DATA FRAME - table-like structure (columns of equal length)
students <- data.frame(
  name = c("Alice", "Bob", "Charlie"),
  age = c(25, 28, 22),
  score = c(85, 90, 78)
)

print(students)

# Access data frame elements
print(students$name)       # Get column
print(students[1, ])       # Get row
print(students[1, 2])      # Get specific cell
print(students[, "score"]) # Get column by name

# Basic data frame operations
nrow(students)  # Number of rows
ncol(students)  # Number of columns
dim(students)   # Dimensions
head(students)  # First few rows
tail(students)  # Last few rows

# Add new column
students$grade <- c("A", "A", "B")
print(students)

# Filter data frame
high_scorers <- students[students$score >= 85, ]
print(high_scorers)

# MATRIX - 2D array (all elements same type)
my_matrix <- matrix(1:9, nrow=3, ncol=3)
print(my_matrix)

print(my_matrix[1, 2])  # Element at row 1, column 2
print(my_matrix[1, ])   # First row
print(my_matrix[, 2])   # Second column

# FACTORS - categorical data
colors <- factor(c("red", "blue", "red", "green", "blue"))
print(colors)
levels(colors)  # Shows categories
