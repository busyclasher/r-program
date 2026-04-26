# R Fundamentals: Basics
# Learn variable assignment and data types

# Variable assignment using <- or =
x <- 5
y = 10
name <- "Alice"

# Print values
print(x)
print(name)

# Data types: numeric, character, logical
age <- 25           # numeric
city <- "New York"  # character
is_student <- TRUE  # logical

# Check data type
class(x)
class(name)
class(is_student)

# Basic arithmetic operations
a <- 10
b <- 3

result_add <- a + b
result_sub <- a - b
result_mult <- a * b
result_div <- a / b
result_pow <- a ^ b      # exponentiation
result_mod <- a %% b     # modulo (remainder)

print(paste("10 + 3 =", result_add))
print(paste("10 - 3 =", result_sub))
print(paste("10 * 3 =", result_mult))
print(paste("10 / 3 =", result_div))
print(paste("10 ^ 3 =", result_pow))
print(paste("10 %% 3 =", result_mod))

# Comparisons
print(10 > 5)   # TRUE
print(10 < 5)   # FALSE
print(10 == 10) # TRUE
print(10 != 5)  # TRUE

# Logical operations
print(TRUE & TRUE)   # AND
print(TRUE | FALSE)  # OR
print(!TRUE)         # NOT
