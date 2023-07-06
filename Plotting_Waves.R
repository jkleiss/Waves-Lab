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

# To create a variable, you use a left arrow shape "<-" to "assign" that value 
# to the variable. For example:
L <- 100

# (when you see code, such as above, TYPE it into the console; DON'T copy-paste)

### HINT: ### Alt-(minus sign) or Option - (minus sign) is a short-cut for " <- " 

# Do you see the variable "L" and its value in the "Environment" window?

# EXERCISE # Now type simply the variable name into the Console. It will show its value. 

# ANSWER # Your result should look like this: 
# > L
# [1] 100


#You can also create a variable using a calculation. 
L <- 24*4

# *DO* this in the console. Check the Environment. Making sense? 

#If you just write a calculation without defining a variable, the results will 
# appear in the console window.
# Type:
25*4

#You can also define your variables using exponential expressions.
#Type
y <- 2e3

#Or a combination of different expressions:
# The radius of the earth is ~6,400 km:
Re <- 6.4e3 * 10^3. #in meters.

# Common constants are built into R, such as π. Try this:
z <- pi

#Variables can also be words, also known as strings.  In this case, you need to 
# use single or double quotations to let R know that it is a string of characters:
#Try it.  Type:
a <- 'Catch a wave!' 
b <- "Catch two waves!"

# When you are writing your own code, you want to put comments in your code,
# lots of comments.  Any text in R that follows a pound sign (#) is a comment. 

# Vectors
# All of the above are vectors, but with only one element in them. 
# Vectors are useful when they contain a sequence of numbers. If you want to 
# create a vector where each number increases by 1, you can use a colon: 
# Type:  (remember: learn muscle memory by typing it yourself!)
Year <- 1990 : 1999

# Check out what this variable is by typing the word "Year" into your Console. 
# Do you see this? 
#  [1] 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999

# You can also do this using the "seq" function, like this: 
Year2 <- seq(1990,1999)

# See what the contents of "Year2" are. Type "Year2" in the Console window. 
# Is it the same as Year? 

# The seq function is more powerful than the colon. For example, you can change 
# the spacing between the numbers: 
x1 <- seq(-10,10, by=2)

# Check the contents of the vector "x1." Does it range from -10 to 10, 
# containing only even numbers? 

# Or you can set the total length of the vector using "length.out="
x2 <- seq(-10,10, length.out = 100)

# This should give you a vector with 100 numbers in it, equally spaced from 
# -10 to 10.

# You can explore some qualities of a vector with some of the following functions:
min(x1) 
max(x1)
length(x1)

# Note: try typing "min(x1)" directly into the Console Window. That's a good 
# way to explore your variables.

# Another way to create a vector by hand is to use the "c" function. 
# You can imagine that "c" stands for "combine," or "concatenate." Try this: 
x3 <- c(15, 8, 6, 2, 1, 3)

### FUNCTIONS. ###

# You've already used a couple functions above. Functions are 
# basically shortcut commands that perform a task. Functions usually take input 
# values (often called "arguments"), and return some output. 
# You've already used these functions: 
# seq()
# max()
# min()
# length()

# You can get help about any functions by typing a "?" followed by its name.
# Try this:
?sqrt

# The help page lists the Arguments for the sqrt function:
# x	- a numeric or complex vector or array.

# Try these:
sqrt(9)

#explicitly defining arguments:
sqrt(x=9)

#this won't work:
sqrt(y=9)

# You can provide Arguments in the order they are listed, or you can indicate 
# which arguments you are passing for greater clarity. 

################################################################################
# EXERCISE BLOCK #1. Insert your answers to these exercises into your Worksheet 
# that you will hand in for this lab. 
# Include the code that you write and the output that you get.
################################################################################

# 1) Create a vector named A_10 that goes from -10 to 10, with a step size of 5. 
# (hint: be sure to check your answer! it should look like: 
# [1] -10  -5   0   5  10

# 2) Create a vector named A_pi with a range from 0 to 2*pi, with 100 elements in it. 

# 2b) Check your work. What is the minimum value, maximum value, and length of 
# your vector A_pi? 

# 3) Create a variable that is a string. (you can make it anything you want!)

# 4) Create a vector named "p" with the following values in this order: 2, -5, 7, 1, 10.

# 5) Look at the help page for the seq function. What are the arguments? 

# 6) Use the "along.with" argument in the seq function to generate a vector 
# from 1 to 100 that has the same number of elements in it as A_pi 
# (A_pi is from a previous question)

################################################################################
# Lets clean up our Environment (saved variables) so we can get to work. 
# get a list of all the variable names that we've created using the "ls" function
vars = ls()

# If you want to see the contents of "vars," type the variable name in the 
# Console window.

# Remove all of these variable names with the "rm" function
rm(list=vars)

# If you want to be slick, this command can do it in just one line: 
rm(list=ls())

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
A2 <- 3 #amplitude of wave 2
f1 <- 0 #phase shift of frequency of wave 1
f2 <- 0 #phase shift of frequency of wave 2

#Using these newly defined variables, create your waves:
y1 <- A1*sin(x+f1); 
y2 <- A2*sin(x+f2); 
y3 <- y1+y2;

## PLOTTING IN R
# To plot, we use the "plot" function
plot(x, y1, type="l", col='blue')

# Look up the help page for plot. You might need to select "Generic X-Y Plotting"

# What does the argument "type" mean? And why did we give it the value "l"? 

# Answer: (try to find it yourself first!)
#
# "l" will produce a line plot! 

# To add another line to the plot we use the "lines" function. 
# (If we run "plot" again, it will produce a new plot.) Try this: 
lines(x,y2,type="l",col='red')

# And add the sum of these two lines (which will naturally be purple!)
lines(x,y3,type="l",col='purple')

# There is an obvious problem: The first plot set the y-axis limits, 
# and our later plots got too big. We want to extend the y-axis to see all the lines. 

# CHALLENGE. can you think of any functions you have encountered that could 
# help you figure out how big we need to set the y-axis limits to see all 
# three lines? 

# You need to set the plot properties with the "plot" function. Here's how: 
# "ylim = "  Tell it the min & max values of the y-axis you want. 
# "ylab = " Tell it the y-axis label
# "main = " Give the plot a title. 

# Here is an example:
plot(x, y1, type="l", col='blue', ylim=c(-3.2, 3.2), ylab="height", main="Waves in phase")

# CHALLENGE. Add waves "y2" and "y3" to this plot. 
# (hint 1: you only need to set the axis limits and labels in the "plot" function)
# (hint 2: consult the "lines" functions from above!)

# A good plot needs a legend. We can use the "legend" function 
# Look up its help page!  Then try this: 

legend(0, -2, legend=c("Wave 1", "Wave 2", "Sum of Waves"),
       col=c("blue","red","purple"), lty=1, cex=0.8)

# two new arguments were used: "lty" and "cex" Can you figure out what they do 
# from the help page for "legend"? 

# Finally, it can help to add grid lines for easier viewing. This is simply: 
grid()

# Great job!  The next chunk of exercises will ask you to create your own 
# plots of waves. It will be helpful to "re-use" previous commands. If you 
# type the first few letters of the command, and then hit Ctrl-(up-arrow) 
# or Cmd-(up-arrow), it will suggest previous commands you've typed that start
# with the same letters.  Or just type (up-arrow) to go to previous commands.

################################################################################
# EXERCISE BLOCK #2. 
#
# 1) Copy-paste the figure that you just made, titled 
# "Waves in phase," into your student worksheet. 
#
# 2) Change the amplitudes and phase shifts for the second wave: A2 = 1, f2 = pi/2. 
#    Reproduce the plot, and copy-paste it into your student worksheet.
#    Title it "Waves Phase Shifted," include a legend, 
#    and include y1, y2, and their sum, y3. 
#    (please include your code and your figure in your answer)
#
# 3) Your Choice! Try increasing the x-vector so it is twice as long. 
#    Set the values for A1, A2, f1, and f2 to ANYTHING you would like.
#    Plot two waves and their sum. Be sure to change the title.
#    Include a title, axis labels, legend, and grid lines. 
#    (please include your code and your figure in your answer)
#
# 4) Summarize what you see with a few complete sentences. 
#   - how does the amplitude, phase shift, and wavelength of the original waves
#     affect the amplitude, phase shift, and wavelength of the summed wave? 
#   - where does the summed wave have crests and troughs? Where does it have 
#     amplitude = 0? 
#   - can you identify constructive and destructive interference in any of your 
#     figures?
# 
# 5) Challenge: Can you create a combination of A1, A2, f1, and f2 that result 
#    in a water surface that is just a flat line? Would this ever happen in the 
#    real world? 
#
################################################################################

# Great job! You are making tremendous progress with the R scripting language.

################################################################################
