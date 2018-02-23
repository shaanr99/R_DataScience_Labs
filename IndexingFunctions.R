# Indexing - 3.2 Indexing functions

#install.packages("dslabs")
#library(dslabs)
#class(murders)

# assume this has already been run ....
# murder_rate <-  murders$total/murders$population*100000

# Three primary functions to explore here
# which, match, and %in%

# which
x <- c(FALSE, TRUE, FALSE, TRUE, TRUE, FALSE)
which(x)
# returns 2 4 5 (those locations that are TRUE)

# We want to look up Massachusetts murder rates
index <- which(murders$state == "Massachusetts")
index # will return the index for the location of Massachusetts in the murders data frame
murder_rate[index]

# match

#Suppose that instead of one state, we want
#to find out the murder rate for several states,
#say New York, Florida, and Texas
index <- match(c("New York", "Florida", "Texas"), murders$state)
index

#to verify that we got the correct results
murders$state[index]

# to see the murder rates in each of these states ...
murder_rate[index]

# %in%
x <- c("a","b","c","d","e")
y <- c("a","d","f")
y %in% x  # should return  TRUE  TRUE FALSE

# So, say you are not sure of Boston, Dakota, and Washington are state's.
c("Boston","Dakota","Washington") %in% murders$state
# should return FALSE FALSE  TRUE

