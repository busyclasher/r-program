# R Fundamentals: Functions
# Create reusable blocks of code

# Simple function
greet <- function(name) {
  print(paste("Hello,", name, "!"))
}

greet("Alice")

# Function with multiple parameters
add <- function(x, y) {
  return(x + y)
}

result <- add(5, 3)
print(result)

# Function with default parameters
introduce <- function(name, age = 25) {
  print(paste(name, "is", age, "years old"))
}

introduce("Bob")          # Uses default age
introduce("Charlie", 30)  # Overrides default

# Function with multiple return values (using list)
stats <- function(numbers) {
  return(list(
    mean = mean(numbers),
    median = median(numbers),
    std_dev = sd(numbers)
  ))
}

result <- stats(c(1, 2, 3, 4, 5))
print(result)
print(result$mean)

# Anonymous functions (functions without names)
apply_operation <- function(x, operation) {
  return(operation(x))
}

result <- apply_operation(10, function(n) n * 2)
print(result)

# Variable scope
global_var <- 100

test_scope <- function() {
  local_var <- 50
  print(global_var)  # Can access global
  print(local_var)   # Can access local
}

test_scope()
# print(local_var)  # Error! local_var not accessible here
