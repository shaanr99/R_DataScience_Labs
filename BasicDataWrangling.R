# 3.2 Basic Data Wrangling
# introducing the dplyr package

# install dplyr package
install.packages("dplyr")

# to load dplyr
library(dplyr)

# mutate - add a new column to data table
# filter - subset rows
# select - selecting specific columns
# %>% - pipe operator - sending the results of one function to another function

library(dslabs)

# ##################
# #### MUTATE ######
# ##################
murders <- mutate(murders,rate=total/population*100000)
# where rate is the new column.
# total and population are assumed to be in the murders data frame,
# making the code much cleaner to read.

# to see the new column
head(murders)
#state abb region population total     rate
#1    Alabama  AL  South    4779736   135 2.824424
#2     Alaska  AK   West     710231    19 2.675186
#3    Arizona  AZ   West    6392017   232 3.629527
#4   Arkansas  AR  South    2915918    93 3.189390
#5 California  CA   West   37253956  1257 3.374138
#6   Colorado  CO   West    5029196    65 1.292453

# ##################
# #### FILTER ######
# ##################
# Suppose that we want to filter the data table to only show
# the entries for which the murder rate is lower than 0.71.
# To do this, you use the filter function, which
# takes the data table as the first argument
# and the conditional statement as the next.

filter(murders, rate <= 0.71)
# state abb        region population total      rate
# 1        Hawaii  HI          West    1360301     7 0.5145920
# 2          Iowa  IA North Central    3046355    21 0.6893484
# 3 New Hampshire  NH     Northeast    1316470     5 0.3798036
# 4  North Dakota  ND North Central     672591     4 0.5947151
# 5       Vermont  VT     Northeast     625741     2 0.3196211

# ##################
# #### SELECT ######
# ##################
# to redefine the murders table with only 3 columns ...

new_table <- select(murders, state, region, rate)
new_table
# state        region       rate
# 1               Alabama         South  2.8244238
# 2                Alaska          West  2.6751860
# 3               Arizona          West  3.6295273
# 4              Arkansas         South  3.1893901
# et cetera

# using more of what we've learned ...
# we can now filter this new, smaller object
filter(new_table, rate <= 0.71)
# state        region      rate
# 1        Hawaii          West 0.5145920
# 2          Iowa North Central 0.6893484
# 3 New Hampshire     Northeast 0.3798036
# 4  North Dakota North Central 0.5947151
# 5       Vermont     Northeast 0.3196211

# ##################
# #### %>% ######
# ##################
# In the code above, we want to show the three variables for states
# that have murder rates below 0.71.
# We did this by defining an intermediate data frame called new_table
# We can avoid this, by using the pipe function.
murders %>% select(state,region, rate) %>% filter(rate<=0.71)

# Yields the same result as before.
# state        region      rate
# 1        Hawaii          West 0.5145920
# 2          Iowa North Central 0.6893484
# 3 New Hampshire     Northeast 0.3798036
# 4  North Dakota North Central 0.5947151
# 5       Vermont     Northeast 0.3196211

