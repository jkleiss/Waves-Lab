
#Dispersion Relation Analysis

# The dispersion relation relates the wavelength, wave speed, and water depth. 
# If I tell you the wavelength and water depth, you can tell me the wave speed.
#
# Let's try it. A tsunami wave in the deep ocean can have a wavelength of 
# hundreds of kilometers. The average ocean depth is 4km. 
# Can we use the dispersion relation to calculate the speed of a 
# tsunami wavecrest? 

L <- 200000 # wave length (in meters: about 200 km -- VERY LONG!!!)
g <- 9.8 #acceleration due to gravity (m/s^2)
d <- 4000 # water depth (in meters: about 4 km.)

# Here is the full dispersion relation, expressed as the wave speed c
# Can you confirm that it matches the math equation you've seen in class? 
c <- sqrt(g*L/(2*pi)*tanh(2*pi*d/L)) #dispersion relation

# What is the speed of a tsunami wave? (include units!)
# How does this compare to the speed of a commercial airliner?
# Discuss your results with a neighbor. 

# (Answer: the tsunami is around 200 m/s, or 700 km/hr.
# A Boeing 747 has a cruise speed of about 900 km/hr. Wow!)

# Ocean waves have much smaller wavelengths, like 100's of meters. How fast 
# do they move? Let's explore for a range of different water depths. 

L <- 100 # wavelength in meters -- a more reasonable number!
d = seq(0,L,length.out=100) # A vector containing many possible water depths (m)
g <- 9.8 #acceleration due to gravity (m/s^2)

# Pause for a second. How long is 100m? Can you relate this to something in 
# your life, your experience, or your surroundings? 

# ANSWER: Twice a 50m swimming pool, about the length of a football field.

# The dispersion relation as a vector - computed for each value of "d"
c = sqrt(g*L/(2*pi)*tanh(2*pi*d/L))

################################################################################
# EXERCISE BLOCK #1. Wave Speed v. Water Depth
#
# This section guides you through a plotting routine of the dispersion relation 
# as a function of water depth, for a fixed wavelength of 100 m. 

# CHALLENGE: Using what you have learned about plotting, can you create a plot? 
# Make the x-variable "d", and the y-variable "c". 
# Make it a line plot. (remember how?)
# Give it a title (main=) "Wave speed for a constant wavelength L = 100m" 
# Label the x- and y-axes including units. 
# Make the line width = 2 (lwd = 2)

# ANSWER:
plot(d, c, type="l", main="Wave speed for a constant wavelength L = 100m", 
     xlab="water depth (m)", ylab="wave speed (m/s)", lwd=2, ylim=c(0,15))

# If you got a black line that starts at (0,0), then grows to a height of 
# 12, and extends out to x=100, then you've done it! Get help until you're there.

# Great job!  Now we will add the shallow-water approximation for comparison: 
lines(d,sqrt(g*d),type="l",col="red", lwd=2)

# The deep water wave speed is a constant. 
deepWaterSpeed <- sqrt(g*L/(2*pi))

# what is the deep water wave speed? 
# Convert it to units that are meaningful to you. How fast do typical ocean wave 
# crests travel? Is it walking speed? biking speed? driving speed? 
# Discuss your conclusions with a neighbor. 

# ANSWER:
# The deep water speed is about 12.5 m/s. This is about 28 mph, so it 
# too fast for most bikes. It's a car driving down a small road (20 is plenty!)

# To plot vector x against vector y, they must have the same lengths (so every 
# x point has a corresponding y point!) This should work:
ones = seq(1, 1, along.with = d)
# Do you see what was done there?  This would give you the same answer: 
ones = seq(1, 1, length.out = length(d))

lines(d, ones*sqrt(g*L/(2*pi)), type="l",col="blue", lwd=2)

# Since the plot has three lines, lets add a legend.  the x,y inputs to the 
# function give the upper-left corner coordinates of the legend box. 

legend(x=20,y=4,legend=c("Full dispersion relation","Shallow Water Approximation",
                         "Deep Water Approximation"),col=c("black","red","blue"),lty=1, lwd=2, cex=0.8)

# And add grid lines:
grid()

# Once your figure looks good, copy-paste it into your answer sheet.
#
# End of Exercise Block 1
################################################################################

# Let's explore the range of depths (x-axis) for which the shallow-water and 
# deep water approximations appear to be the same as the full dispersion relation. 
# We want to zoom into the graphs to see where the lines separate from each other. 

# Here is a little help, since R doesn't zoom well. 
# Use the "xlim" and "ylim" attributes to determine the extent of the axes. 
# For example: I think the shallow-water curve veers away around x=10, y=8. 
# So I might set the range for x in (5, 15), and y in (4, 12)

# Shallow water zoom-in: ("xlim" is the secret here)
plot(d, c, type="o", main="Wave phase speed for constant wavelength L = 100m",
     ylab="phase speed (m/s)", xlab="water depth (m)", lwd=2, 
     xlim=c(5, 15), ylim=c(4, 12))
lines(d,sqrt(g*d),type="o",col="red", lwd=2)

legend(x=4,y=3,legend=c("Full dispersion relation","Shallow Water Approximation"), 
       col=c("black","red","blue"), lty=1, lwd=2, pch=1, cex=0.8)
grid()

# See what the graph looks like, and then change those ranges for "xlim" and "ylim" 
# to determine the approximate depths where the approximations appear good. 


################################################################################
# EXERCISE BLOCK #2. Where do the shallow-water and deep-water approximations hold?
#
# After working through the previous section, answer the following questions in 
# your answer sheet. Include screen shots of figures to support your reasoning.
#
# SHALLOW WATER APPROXIMATION

# A POSSIBLE ANSWER: (shallow water zoom-in)
plot(d, c, type="o", main="Wave phase speed for constant wavelength L = 100m",
     ylab="phase speed (m/s)", xlab="water depth (m)", lwd=2, 
     xlim=c(0,10))
lines(d,sqrt(g*d),type="o",col="red", lwd=2)

legend(x=4,y=3,legend=c("Full dispersion relation","Shallow Water Approximation"), 
       col=c("black","red","blue"), lty=1, lwd=2, pch=1, cex=0.8)
grid()

#
# 1) At which depth does the full dispersion relation separate from the 
#    shallow-water approximation? 
# ANSWER: Students could find between 4-7m
#
# 2) How does that depth relate to the wavelength? (i.e. What fraction of the 
#    wavelength (L = 100m) is that depth)?
# ANSWER: Could have found something between 1/25 - 7/100
#
# 3) How does the fraction that you found compare to the theoretical cutoff depth
#    for shallow water waves (d < lambda/20)?
# ANSWER: The theoretical cut off for the shallow water approximation is when 
#   the depth is 1/20 of the wavelength. Students should find a similar value 
#   and comment on how close or far they are from the theoretical value.

# DEEP WATER APPROXIMATION
#
# A POSSIBLE ANSWER: (deep water zoom-in)
plot(d, c, type="o", main="Wave phase speed for constant wavelength L = 100m",
     ylab="phase speed (m/s)", xlab="water depth (m)", lwd=2, 
     xlim=c(40, 60), ylim=c(12,13))
lines(d,ones*sqrt(g*L/(2*pi)), type="o", col="blue", lwd=2)

legend(x=40,y=12.2,legend=c("Full dispersion relation","Deep Water Approximation"), 
       col=c("black","blue"), lty=1, lwd=2, pch=1, cex=0.8)

#
# 4) At which depth does the full dispersion relation separate from the 
#    deep-water approximation? 
# ANSWER: Students could find between 25 – 60 meters
#
# 5) How does that depth relate to the wavelength? (i.e. What fraction of the 
#    constant wavelength (L = 100m) is that depth)?
# ANSWER: Could have found something between 1/4 – 3/5
#
# 6) How does the fraction that you found compare to the theoretical cutoff depth 
#   for deep water waves? (d > lambda/2, or d > lambda/4)?
# ANSWER: The theoretical cut off for the deep water approximation is when the 
#   depth is 1/2 of the wavelength, although some textbooks also use 1/4 of the 
#   wavelength. Students should find a cutoff ratio between these two cutoffs 
#   and comment on how close or far they are from the theoretical cutoff values.
#
# End of EXERCISE BLOCK #2.
################################################################################




# Deep water zoom-in:
# 
# Give it a try! change the "xlim" Argument in the plot function to zoom into 
# a part of the plot where you think the deep water approximation might start 
# to be close to the full dispersion relation. 
# Include your code and your figure in your worksheet. 



# Now we are going to do a similar, analysis, but we will set the depth constant
# (d= 5m), and compute the wave speed for a range of wavelengths. 

rm(list=ls())

dd = 5 #constant depth (m)
LL = 1:150 # wavelength ranges from 1 to 150 m.
g = 9.8 # gravitational acceleration (m/s^2)

cc = sqrt(g*LL/(2*pi)*tanh(2*pi*dd/LL)); #dispersion relation

# Make a plot of the wave speed versus the wavelength. 
plot(LL, cc, type='l', lwd=2, ylim=c(0,10),
     xlab= 'wavelength (m)', ylab='phase speed (m/s)',
     main='Wave phase speed at constant depth = 5 m')

# CHALLENGE: Can you add the shallow-water and deep water approximations? 
# Reminders: 
# You'll need a vector of "ones" to multiply the shallow water speed (which is constant)
# 
ones = seq(1,1,along.with=LL)

# ANSWER:
lines(LL, ones*sqrt(g*dd), col='red', lwd=2)
lines(LL,sqrt(g*LL/(2*pi)),col='blue',lwd=2)
legend(x=30,y=4,legend=c("Full dispersion relation","Shallow Water Approximation",
                         "Deep Water Approximation"),col=c("black",'red','blue'),lty=1,lwd=2)
