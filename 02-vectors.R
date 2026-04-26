# R Fundamentals: Vectors
# Vectors are the fundamental data structure in R

# Create vectors using c() function
numbers <- c(1, 2, 3, 4, 5)
names_vec <- c("Alice", "Bob", "Charlie")
mixed <- c(1, 2, 3)  # numeric vector

print(numbers)
print(names_vec)

# Sequences
seq1 <- 1:10         # 1 to 10
seq2 <- seq(1, 10, by=2)  # 1, 3, 5, 7, 9

print(seq1)
print(seq2)

# Repeat values
rep1 <- rep(5, 3)    # repeat 5 three times
rep2 <- rep(c(1, 2), 4)  # repeat pattern

print(rep1)
print(rep2)

# Vector indexing (starts at 1, not 0!)
vec <- c(10, 20, 30, 40, 50)
print(vec[1])        # First element (10)
print(vec[c(1, 3, 5)])  # Multiple elements (10, 30, 50)
print(vec[2:4])      # Range (20, 30, 40)

# Vector operations
v1 <- c(1, 2, 3)
v2 <- c(4, 5, 6)

print(v1 + v2)       # Element-wise addition
print(v1 * v2)       # Element-wise multiplication

# Vectorized functions
vec <- c(1, 4, 9, 16, 25)
print(sqrt(vec))     # Square root
print(length(vec))   # Length
print(sum(vec))      # Sum
print(mean(vec))     # Mean
print(max(vec))      # Maximum
print(min(vec))      # Minimum
