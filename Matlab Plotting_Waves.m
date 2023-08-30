% This tutorial will guide you through some Matlab basics, such as creating 
% variables and vectors, making equations, and plotting. We will explore a 
% basic wave, and what happens when multiple waves appear in the 
% ocean at the same place. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Some Matlab Basics

% Your instructor should introduce you to the Matlab window environment,
% such as the folder directory, Command window, Editor Window, 
% and the Workspace.

% As you work through these activities, please *TYPE* THE COMMANDS in 
% the Command window to practice coding and complete the exercises. 
% DON'T COPY-PASTE.
% Build Muscle Memory! 
% Learn by Doing!

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% To keep a record of your Matlab session, type diary FILENAME.
% Type:
diary YourName_WavesLab

% Defining a variable.  To define a variable, type the name of the 
% variable = a numeric value. For example, type this in the Command Window:

%Type:
L=100

% Notice that Matlab repeats your input.
% If you put a ; after your command, Matlab will not type anything back.

% Type:
g=9.8;

% You can also define a variable as equal to a calculation.  
% Define the value for y:
L = 25*4;

%If you just write a calculation without defining a variable, 
% Matlab will call it "ans".  Type just
25*4

% You can also define your variables using exponential expressions.
% Type:
y=2e3

% Or a combination of different expressions:
Re=6.4e3 * 10^3  % The Radius of the earth is ~6400 km. See it? 

% You can also use known constants without having to tell Matlab what the 
% numeric value is.  Set the variable z equal to π.  Try it.  Type:
z=pi

% Variables can also be words, or strings.  In this case, you need to use 
% single quotations to let Matlab know that it is a string of characters:
% Try it.  Type:
a='Catch a wave!'

% When you're writing your own code, you want to put comments in your code,
% lots of comments.  To make a comment in Matlab, use the %
% Try it.  Type:
Re=6.4e3 * 10^3 %radius of the Earth

% Vectors
% Vectors allow you to save more than one value in a variable.
% You can make a vector with multiple values in Matlab. If you enter values 
% with commas or spaces between them, you get a row vector.  Try it:
Year = [1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999] 
Years = [1990 1991 1992 1993 1994 1995 1996 1997 1998 1999] 

% If you enter values with semicolons between them, you get a column vector.  
% Try it:
Year = [1990; 1991; 1992; 1993; 1994;1995;1996;1997;1998;1999] 

% If you want to enter consecutive values, just tell Matlab the start and 
% stop.  Try it:
Yr = 1990:1999  %assumes a stepsize of one

% You can also make a vector with a different stepsize. Try it:
EvenYears = 1990:2:2008

% Make a vector from -20 to 20.  Enter the line:
x1 = -20:20; %Creates a vector from -10 to 10 with a stepsize of one

% Now, if you just enter x1, you can see all the values stored in your 
% vector. DO THAT!

% Here is another way to explore a variable that you have created. Try
% typing these and seeing what you get:
min(x1) 
max(x1) 
length(x1)

% You can also decide what stepsize you want.  Enter the line:
x1 = -20:5:20;

% Now type just x1 to see your new vector with a stepsize of 5.

%%% FUNCTIONS. %%%

% You've already used a couple functions above. Functions are 
% basically shortcut commands that perform a task. Functions usually need 
% one or more input values and return some output. 
% You've already used these functions: 
% max()
% min()
% length()

% It's a good idea to see a help page to know what a function is doing. 
% Type: 
doc max

% In this case, max can take a number of inputs. Order matters.  If there 
% are open square brackets, like [], that means "nothing", so you can
% provide the third input. For example, you could try:

max(x1,[],'all')

% What if you don't know the increment size, but you know the beginning, 
% end, and number of entries? 
% There is a cool function that can do this for you, called "linspace." 
% CHALLENGE: make a vector from 0 to pi with 100 entries in it?  try 

doc linspace. 

% linspace expects three inputs: (min, max, n). where n is the number of
% elements in the output vector.  Did you come up with this? 

x=linspace(0,pi,100);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXERCISE BLOCK #1. Creating Variables and Vectors
% Insert your answers to these exercises into your Worksheet 
% that you will hand in for this lab. 
% Include the code that you write and the output that you get.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1) Create a vector named A_10 that goes from -10 to 10, with a step size
% of 4. (hint: be sure to check your answer! it should look like: 
% -10    -6    -2     2     6    10

% 2) Create a vector named A_pi with a range from 0 to 2*pi, with 50 
% elements in it. 

% 2b) Check your work. What is the minimum value, maximum value, and 
% length of your vector A_pi?  (hint: try the function "length")

% 3) Create a variable that is a string - you can make it anything you want!

% 4) Create a vector named "p" with the following values in this order: 
% 2, -5, 7, 1, 10.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Let's clear all of the variables from your Workspace. Type: 
clearvars

% Let%s Make Some Waves !
% We will approximate a wave with a Sine function 
% (You could equally use a Cosine function, which is just a 
% Sine function with a 90-deg phase shift)

% First, we need a vector that indicates space (like in meters) that ranges 
% from 0 to 2*pi, and has 100 elements in it. 
x = linspace(0, 2*pi, 100);

% We will make two waves. Each wave needs an amplitude and a phase shift.
A1=1;  %amplitude of wave 1
A2=2;  %amplitude of wave 2
f1=0; %phase shift of frequency of wave 1
f2=0; %phase shift of frequency of wave 2

% Using these newly defined variables, create your waves:
y1=A1*sin(x+f1); 
y2=A2*sin(x+f2); 
y3=y1+y2;

% Now, make a new Figure
figure(1)

% TYPE the following commands into your Command Window to make a plot of
% these waves! (you don't have to type the comments) 

% Plot the first wave in red, with a linewidth of 2:
plot(x, y1, 'r', 'LineWidth', 2);  

% To add more lines to the figure, we tell it to add, not to overwrite the
% figure:
hold on; 

% Plot the second wave in blue, with a linewidth of 2:
plot(x, y2, 'b', 'LineWidth', 2);  

% Red + Blue = Purple, but we have to give it the (R,G,B) values to make
% purple. Plot the summed wave in purple, with linewidth of 2:
plot(x, y3, 'Color',1/255*[148,0,211], 'LineWidth', 2) 


% We are done:
hold off; 

% A useful tool: remove extra white space in the figure. 
axis tight  

% Your plot needs a title, axis labels, and a legend!  Figure out what 
% good labels would be.  Change the strings inside the following commands
% to give your plot these labels. The first one is done for you: 

title 'Waves in Phase' % this one is done for you!
xlabel 'put your x-axis label in this string'
ylabel 'your y-axis label'
legend('Wave 1','Wave 2','Sum of Waves 1 & 2')%this one's done for you too! 

% Once you like your figure, 
% Save a jpeg of your figure to this folder. Give it a name "MyWaves"
print('-djpeg','WavesInPhase')  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXERCISE BLOCK #2. Plotting Waves.
% Insert your answers to these exercises into your Worksheet 
% that you will hand in for this lab. 
% Include the code that you write and the output that you get.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1) Place an image of the figure that you just made, titled 
% "Waves in Phase," into your student worksheet. 
%
% 2) Change the phase shifts for the second wave: 
%    >> f2 = pi/4. 
%    Create a new plot: 
%    >> figure 
%    and plot waves y1, y2, and their sum (y3), as we did before. 
%    Copy-paste it into your student worksheet. 
%    Title it "Waves Phase Shifted," and include a legend.
%    (please include your code and your figure in your answer)
%
% 3) Your Choice! Increase the x-vector so it is twice as long (to 2*pi). 
%    Set the values for A1, A2, f1, and f2 to ANYTHING you would like.
%    Plot two waves and their sum. Be sure to change the title.
%    Include a title, axis labels, legend, and grid lines. 
%    (please include your code and your figure in your answer)
%
% 4) Summarize what you see with a few complete sentences. 
%   a) How does the amplitude and phase shift of the original waves
%    affect the amplitude, phase shift, and wavelength of the summed wave?
%   b) Where does the summed wave have crests and troughs? Where does it 
%    have amplitude = 0? 
%   c) Can you identify constructive and destructive interference in any 
%    of your figures?
% 
% 5) Challenge: Can you create your own Wave 1 and Wave 2 with your own 
% combination of A1, A2, f1, and f2 (that are non-zero!) that add up to
% make a wave that is just a flat water surface? (i.e. a flat line?) 
% Would this ever happen in the real world? 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Great job! You are making tremendous progress with Matlab!

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




