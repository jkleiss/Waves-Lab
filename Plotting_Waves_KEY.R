# R code to walk through Waves Lab activities. 

################################################################################

#Some R Basics

# Your instructor should introduce you to the R setup you are using, 
# such as the file directory, the Console window, and the list of 
# variables in your environment. This tutorial was writtten using 
# posit.cloud. 

# As you work through these activities, please *TYPE* THE COMMANDS in 
# the Console window to learn to code. DON'T COPY-PASTE.
# Build Muscle Memory! 
# Learn by Doing! 



################################################################################
# EXERCISES #1. Insert your answers to these exercises into your Worksheet 
# that you will hand in for this lab. 
# Include the code that you write and the output that you get.
################################################################################

# 1) Create a vector named A_10 that goes from -10 to 10, with a step size of 5. 
# (hint: be sure to check your answer! it should look like: 
# [1] -10  -5   0   5  10

A_10 <- seq(-10, 10, by=5)

# 2) Create a vector named A_pi with a range from 0 to 2*pi, with 100 elements in it. 

A_pi <- seq(0, 2*pi, length.out=100)

# 2b) Check your work. What is the minimum value, maximum value, and length of 
# your vector A_pi? 

min(A_pi)
# [1] 0
max(A_pi)
# [1] 6.283185
length(A_pi)
# [1] 100

# 3) Create a variable that is a string. (you can make it anything you want!)

MyString <- "Make some Waves!"

# 4) Create a vector named "p" with the following values in this order: 2, -5, 7, 1, 10.

p <- c(2, -5, 7, 1, 10)

# 5) Look at the help page for the seq function. What are the arguments? 
# ANSWER: from, to, by, length.out, along.with

# 6) Use the "along.with" argument in the seq function to generate vector "H"
# from 1 to 100 that has the same number of elements in it as A_pi 

H <- seq(1, 100, along.with = A_pi)

################################################################################

# Let’s Make Some Waves!
# We will approximate a wave with a Sine function 
# (You could equally use a Cosine function, which is just a 
# Sine function with a 90-deg phase shift)

# First, we need a vector that indicates space (like in meters) that ranges 
# from 0 to 2*pi, and has 100 elements in it. 
x <- seq(0,2*pi, length.out=100)

# We will make two waves. Each wave needs an amplitude and a phase shift.
A1 <- 1 #amplitude of wave 1
A2 <- 2 #amplitude of wave 2
f1 <- 0 #phase shift of frequency of wave 1
f2 <- 0 #phase shift of frequency of wave 2

#Using these newly defined variables, create your waves:
y1 <- A1*sin(x+f1); 
y2 <- A2*sin(x+f2); 
y3 <- y1+y2;

## PLOTTING IN R
# Here is code to make the first figure. 

plot(x, y1, type="l", col='blue', ylim=c(-3.2, 3.2), ylab="height", main="Waves in phase")
lines(x,y2,type="l",col='red')
lines(x,y3,type="l",col='purple')
legend(0, -1.5, legend=c("Wave 1", "Wave 2", "Sum of Waves"),
       col=c("blue","red","purple"), lty=1, cex=0.8)
grid()

# CHALLENGE. can you think of any functions you have encountered that could 
# help you figure out how big we need to set the y-axis limits to see all 
# three lines? 

# ANSWER:
max(y3)


################################################################################
# EXERCISES #2. 
#
# 1) Copy-paste the figure that you just made, titled 
# "Waves in phase," into your student worksheet. 
# ANSWER: The code immediately above does thi. 
# 
# Change the phase shift for the second wave. Reproduce 
# the plot, and copy-paste it into your student worksheet. 
#
# 2) Change the amplitudes and phase shifts for the second wave: A2 = 1, f2 = pi/2. 
#    Reproduce the plot, and copy-paste it into your student worksheet.
#    Title it "Waves Phase Shifted," include a legend, 
#    and include y1, y2, and their sum, y3. 
#    (please include your code and your figure in your answer)

A1 <- 1
A2 <- 2
f1 <- 0
f2 <- pi/2

x <- seq(0,2*pi, length.out=100)
y1 <- A1*sin(x+f1); 
y2 <- A2*sin(x+f2); 
y3 <- y1+y2;

plot(x, y1, type="l", col='blue', ylim=c(-3.2,3.2), ylab="height", main="Waves Phase Shifted")

lines(x,y2,type="l",col='red')

lines(x,y3,type="l",col='purple')

legend(0, -1, legend=c("Wave 1", "Wave 2", "Sum of Waves"),
       col=c("blue","red","purple"), lty=1, cex=0.8)

grid()

# 3) Try increasing the x-vector so it is twice as long. 
#    Set the values for A1, A2, f1, and f2 to ANYTHING you would like.
#    Plot two waves and their sum. Be sure to change the title.
#    Include a title, axis labels, legend, and grid lines. 
#    (please include your code and your figure in your answer)

# parameters will vary!!! 
A1 <- .5
A2 <- 4
f1 <- 0
f2 <- .003

x <- seq(0,4*pi, length.out=100)
y1 <- A1*sin(x+f1); 
y2 <- A2*sin(x+f2); 
y3 <- y1+y2;

m <- max(y3) + .3 # a little trick.
plot(x, y1, type="l", col='blue', ylim=c(-m,m), ylab="height", main="My waves")

lines(x,y2,type="l",col='red')

lines(x,y3,type="l",col='purple')

legend(0, -2, legend=c("Wave 1", "Wave 2", "Sum of Waves"),
       col=c("blue","red","purple"), lty=1, cex=0.8)

grid()

# 4) Summarize what you see with a few complete sentences. 
#   - how does the amplitude, phase shift, and wavelength of the original waves
#     affect the amplitude, phase shift, and wavelength of the summed wave? 
#   - where does the summed wave have crests and troughs? Where does it have 
#     amplitude = 0? 
#   - can you identify constructive and destructive interference in any of your 
#     figures?
# 
#
# A1 and A2 are the amplitudes of wave 1 and wave 2, respectively. They change 
# the wave height of each wave.  f1 and f2 are the phase shifts of the two waves. 
# They change the shift (left-right) of the two waves. 
# Adding waves with the same wavelength results in a wave with the same wavelength. 
# The phase shift doesn't affect the resulting wavelength.  
# The amplitude of the summed wave depends on the amplitude of the constituent 
# waves, and also on their phase shift. 
# The phase of the summed wave depends on the phase of the constituent waves. 
# If the two waves are in phase, there is constructive interference resulting 
# in larger wave amplitudes. If the two waves are out of phase (one is positive, 
# one is negative), then there is destructive interference.

# 5) Challenge: Can you create a combination of A1, A2, f1, and f2 that result 
#    in a water surface that is just a flat line? Would this ever happen in the 
#    real world? 
#
# ANSWER: Yes! When waves encounter each other, for an instant there may be a flat ocean! 
# It won't last long. 

# Here are two possible solutions. Plot them to see! 
A1 <- 1
A2 <- 1
f1 <- 0
f2 <- pi

A1 <- 1
A2 <- -1
f1 <- 0
f2 <- 0


x <- seq(0,2*pi, length.out=100)
y1 <- A1*sin(x+f1); 
y2 <- A2*sin(x+f2); 
y3 <- y1+y2;

plot(x, y1, type="l", col='blue', ylim=c(-1.2, 1.2), ylab="height", main="Waves in phase")

lines(x,y2,type="l",col='red')

lines(x,y3,type="l",col='purple')

legend(2.1, -.7, legend=c("Wave 1", "Wave 2", "Sum of Waves"),
       col=c("blue","red","purple"), lty=1, cex=0.8)

grid()

################################################################################

# Great job! You are making tremendous progress with the R scripting language.

################################################################################
