# Section 3.1 - Indexing
#install.packages("dslabs")
#library(dslabs)
#class(murders)

murder_rate <-  murders$total/murders$population*100000

index <- murder_rate < 0.71 # those states with a murder rate LESS THAN 0.71
index <- murder_rate <= 0.71 # those states with a murder rate LESS THAN OR EQUAL TO 0.71
index

# the following should return
# "Hawaii"        "Iowa"          "New Hampshire" "North Dakota"  "Vermont"
murders$state[index]

sum(index) # tells us how many states have a rate less than 0.71

# logical AND operator ... &
TRUE & TRUE # TRUE
TRUE & FALSE # FALSE
FALSE & FALSE # FALSE

# to get all safe states in the West, we do the following:
west <- murders$region == "West"
safe <- murder_rate <= 1
index <- safe & west
murders$state[index]
# the previous statement should return
# "Hawaii"  "Idaho"   "Oregon"  "Utah"    "Wyoming"

