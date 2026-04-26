# R Fundamentals: Control Flow
# If/else statements, loops

# If statement
x <- 15

if (x > 10) {
  print("x is greater than 10")
}

# If-else statement
age <- 18

if (age >= 18) {
  print("You are an adult")
} else {
  print("You are a minor")
}

# If-else if-else
grade <- 75

if (grade >= 90) {
  print("A")
} else if (grade >= 80) {
  print("B")
} else if (grade >= 70) {
  print("C")
} else {
  print("F")
}

# For loop
print("For loop:")
for (i in 1:5) {
  print(paste("i =", i))
}

# For loop with vector
colors <- c("red", "blue", "green")
for (color in colors) {
  print(color)
}

# While loop
print("While loop:")
counter <- 1
while (counter <= 5) {
  print(paste("Counter:", counter))
  counter <- counter + 1
}

# Break statement (exit loop)
print("Break example:")
for (i in 1:10) {
  if (i == 5) {
    break  # Exit loop when i == 5
  }
  print(i)
}

# Next statement (skip iteration)
print("Next example:")
for (i in 1:5) {
  if (i == 3) {
    next  # Skip when i == 3
  }
  print(i)
}

# Repeat loop with break
print("Repeat loop:")
x <- 0
repeat {
  x <- x + 1
  print(x)
  if (x == 3) break
}
