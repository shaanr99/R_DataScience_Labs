# Basic Plots

# ##############
# Scatter Plots
# ##############
population_in_millions <- murders$population/10^6
total_gun_murders <- murders$total
plot(population_in_millions,total_gun_murders)


# ##############
# Histograms
# ##############
hist(murders$rate)

# to see the outlier in this histogram, we can
# use the following:
murders$state[which.max(murders$rate)]
# which will yield
#[1] "District of Columbia"

# ##############
# Boxplot
# ##############
# compare the murder rates for different regions
boxplot(rate~region, data=murders)

# the South has the highest murder rate
