# if there is no package loaded, load one
# install.packages("dslabs")

# load the library into the session
# library(dslabs)

# load the data for use in the session
# data("murders")

# quick check to be sure everything is loaded
# class(murders)
# should return [1] "data.frame"

murders$state[which.max(murders$population)]
# should return [1] "California"

max(murders$population)
# should return [1] 37253956

# murder per capita should be used for a more accurate analysis

# looking at a separate example
heights <- c(69, 62, 66, 70, 73, 67, 73, 67, 70)
heights * 2.54  # each element is multiplied by 2.54

# to view the heights relative to a single height, 
# we can do the following:
heights - 69 #heights relative to 69 inches

# murders for every 100k people can thus be computed as follows:
murder_rate <-  murders$total/murders$population*100000
murder_rate

# to view these by rate in decreasing order by state, 
# we do the following:
murders$state[order(murder_rate, decreasing=TRUE)]
