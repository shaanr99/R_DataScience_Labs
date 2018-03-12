# Section 4 - Programming concepts

# #############################
# ## CONDITIONALS
# #############################
# IF-ELSE

# <- 2
a <- 0
if (a!=0){
  print(1/a)
} else {
  print("No reciprocal for 0.")
}

murder_rate <- murders$total/murders$population*100000

# which states, if any, have a murder rate lower than 0.5?
ind <- which.min(murder_rate)
if (murder_rate[ind]<0.5){
  print(murders$state[ind])
} else {
  print("No state has murder rate that low")
}
# Returns "Vermont"

if (murder_rate[ind]<0.25){
  print(murders$state[ind])
} else {
  print("No state has murder rate that low")
}
# Returns "No state has murder rate that low"

# ## ifelse function ##########
# It's nice because it works on vectors
a <- 0
ifelse(a > 0, 1/a, NA)
# should return "NA"

# using vectors
a <- c(0, 1, 2, -4, 5)
result <- ifelse(a > 0, 1/a, NA)
result

# let's use this ifelse function to replace all the missing
# values in  a vector with zeros

library(dslabs)
data(na_example)
sum(is.na(na_example))
# returns 145 ... which means there are 145 occurances of NA in this vector

no_nas <- ifelse(is.na(na_example), 0, na_example)
sum(is.na(no_nas))
# returns 0 ... which means all the NAs were replaced with zeros

# ## any function ##
# TRUE if ANY entry is true

z <- c(TRUE, TRUE, FALSE)
any(z)
# returns TRUE

k <- c(FALSE, FALSE, FALSE)
any(k)
# returns FALSE

# ## all function ##
# TRUE if ALL entries are true
z <- c(TRUE, TRUE, FALSE)
all(z)
# returns FALSE

z <- c(TRUE, TRUE, TRUE)
all(z)
# returns TRUE

# #############################
# ## FOR-LOOPS
# #############################
compute_s_n <- function(n){
  x <- 1:n
  sum(x)
}
compute_s_n(3)
# returns 6 (1 + 2 + 3)

compute_s_n(100)
# returns 5050

# what if we want to compute the sums for 1, for 2 up to 25 - a range of numbers
# We don't want to write 25 lines of code
# we can use a for loop

# simple example of for-loop
for(i in 1:5){
  print(i)
}
# will print
# [1] 1
# [1] 2
# [1] 3
# [1] 4
# [1] 5

# now using the sums example
m <- 25
# create an empty vector
s_n <- vector(length = m)
for (n in 1:m){
  s_n[n] <- compute_s_n(n)
}
s_n
n <- 1:m
plot(n, s_n)
lines(n, n*(n+1)/2)

# #############################
# ## FUNCTIONS
# #############################
# simple example to compute an average
avg <- function(x){
  s <- sum(x)
  n <- length(x)
  s/n
}

x <- 1:100
avg(x)
# will return 50.5

# to show that this is the same as the mean function
identical(mean(x), avg(x))
# returns TRUE because both functions yield the same result

# NOTE:  The scope of the variables defined in a function
# are only valid within the function.  Lexical Scope

avg <- function(x, arithmetic=TRUE){ #the user can specify whether they want the arithmetic mean or the geometric mean
  n <- length(x)
  ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
}

# #################################
# ## OTHER FUNCTIONS
# ## apply, sapply, tapply, mapply
# ## split, cut, quantile, reduce,
# ## identical, unique
# #################################

