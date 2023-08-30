
%%%% Dispersion Relation Analysis %%%%

% The dispersion relation relates the wavelength, wave speed, and water depth. 
% If I tell you the wavelength and water depth, you can tell me the wave speed.
%
% Let's try it. A tsunami wave in the deep ocean can have a wavelength of 
% hundreds of kilometers. The average ocean depth is 4km. 
% Can we use the dispersion relation to calculate the speed of a 
% tsunami wavecrest? 

L = 200000; % wave length (in meters: about 200 km -- VERY LONG!!!)
g = 9.8; %acceleration due to gravity (m/s^2)
d = 4000; % water depth (in meters: about 4 km.)

% Here is the full dispersion relation, expressed as the wave speed c
% Can you confirm that it matches the math equation you've seen in class? 
c = sqrt(g*L/(2*pi) * tanh(d*2*pi/L)); %dispersion relation

% Note that we are using two built-in functions, sqrt, and tanh. 

% DISCUSSION: (no need to include in answer sheet)
% What is the approximate speed of a tsunami wave? (Think about units!)
% How does this compare to the speed of a commercial airliner?
% Discuss your results with a neighbor. 

% (Answer: the tsunami is around 200 m/s, or 700 km/hr.
% A Boeing 747 has a cruise speed of about 900 km/hr. Wow!)

% Ocean waves have much smaller wavelengths, like 100's of meters. How fast 
% do they move? Let's explore for a range of different water depths. 

L=100;  % wavelength in meters -- much smaller than that of a tsunami! 
g=9.8;  %acceleration of gravity -- you should already have this variable

% We will create a range of water depths, to see how wave speed changes.
d = 0:0.01:L; % ocean depth 

% Pause for a second. How long is 100m? Can you relate this to something in 
% your life, your experience, or your surroundings? Discuss with a neighbor
% and your instructor

% Now that you've defined your variables, the dispersion relation will give
% the wave (phase) speed for every element in "d."
c = sqrt(g*L/(2*pi).*tanh(2*pi*d./L)); %phase speed from dispersion relation

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% EXERCISE BLOCK #1 Wave (Phase) speed v. Water Depth %%%
%
% This section guides you through a plotting routine of the dispersion relation 
% as a function of water depth, for a fixed wavelength of 100 m. 

% CHALLENGE: Using what you have learned about plotting, can you create a plot? 
% Make the x-variable "d", and the y-variable "c". 
% Make the line color black ('k'), and 'Linewidth' 2.
% Give it a title:
% 'Wave speed v. water depth for a constant wavelength L = 100 m' 
% Label the x- and y-axes including units. 

% If you got a black line that starts at (0,0), then grows to a height of 
% about 12, and extends out to x=100, then you've done it! 
% Get help until you're there.

% Great job!  Now we will add the shallow-water approximation for comparison: 

%%%%%  Shallow Water Approximation %%%%%
% In the shallow water approximation, the tanh(kd) ≅ kd , so the
% dispersion relation becomes: c = sqrt(gd) 

% Define the Shallow Water wave speed:
cs = sqrt(g*d); %shallow water wave speed (we give it a unique name so we 
% can plot it & compare it to the full dispersion relation)

% Add the shallow water approximation to your plot. Make the line color
% red. (Don't forget "hold on"!) 

% And grid lines to your plot: 
grid on

% Zoom in on the area of interest in your figure:
axis ([0 60 0 15])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXERCISE BLOCK 1. Wave (Phase) Speed v. Water Depth: Shallow water approx.
%
% 24) Once your figure looks good, Copy-paste your figure of the full dispersion 
% relation and shallow-water approximation for a constant wavelength 
% (L = 100m) on your answer sheet. 
% Include the code you used to generate your figure.
%
% Now, you want to compare the phase speed of the shallow-water 
% approximation to your full dispersion relation.  Zoom in, run
% your mouse over the graphs, and determine at which depth the two graphs
% start to separate.

% Looking at the plot you made, answer the following questions on your 
% answer sheet:
% 25) Compare the full dispersion relation to the shallow-water approximation
% a) At which depth does the full dispersion relation separate from the 
% shallow-water approximation?


% b) How does that depth relate to the wavelength? (i.e. What fraction of 
% the wavelength (L = 100m) is that depth)? Please simplify your answer to a 
% fraction that has "1" in the numerator.


%c)How does the fraction that you found compare to the theoretical cutoff depth
% for shallow water waves (d < λ/20)?


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Deep Water Approximation %%%%%
% In the deep water approximation, tanh(kd) ≅1, so the dispersion relation
% becomes: cd = sqrt(g/k), or cd = sqrt(g*L/(2*pi))

% Does the Deep Water wave speed depend on depth? 
% 
% No! 
%
% Try calculating the deep-water phase speed the normal way:
cd = sqrt(g*L/(2*pi));

% What is the deep water wave speed for a wave with L = 100m? 
% Convert it to units that are meaningful to you. How fast do typical ocean
% wave crests travel? Is it walking speed? biking speed? driving speed? 
% Discuss your conclusions with a neighbor and your instructor. 

% We can't use plot(d,cd) because cd contains only one value. The vectors
% need to be the same length. 
% First create a vector of ones the same size as your depth vector, and
% then multiply each one by the value of cd for the given wavelength:  

oo = ones(size(d)); % create a vector of ones the size of d
cd = oo.*sqrt(g*L/(2*pi)); %deep water wave speed for 100-m wave

% Add your deep water approximation to the dispersion relation plot in green:
hold on; 
plot(d,cd,'g','LineWidth',2)

% Add a legend to the plot of your dispersion relation:
legend('Full dispersion relation','Shallow Water Approximation',...
    'Deep Water Approximation','Location','SouthEast')


print('-djpeg','Wavespeed_v_depth')  %Make a jpeg of your figure


% Now, you want to compare the phase speed of the deep-water 
% approximation to your full dispersion relation.  Zoom in, run
% your mouse over the graphs, and determine at which depth the two graphs
% start to come together.
% At which depth do the two graphs start to come together?  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXERCISE BLOCK #2. Wave (phase) speed v. water depth: deep-water approx.
%
% 26) Copy-paste your figure of the wave (phase) speed due to the full 
% dispersion relation and both the shallow- and deep-water approximations 
% for constant wavelength L = 100m. 

% Include the code you used to generate your figure.

% After working through the previous section, answer the following questions in 
% your answer sheet. Include screen shots of figures to support your reasoning.

% 27)Comparing the full dispersion relation to the deep-water approximation
% a) At which depth does the full dispersion relation begin to asymptote
%    with the deep-water approximation? 
%
% b) How does that depth relate to the wavelength? (i.e. What fraction of the 
%    constant wavelength (L = 100m) is that depth)? Please simplify your answer 
%    to a fraction that has "1" in the numerator.
%
% c) How does the fraction that you found compare to the theoretical cutoff
% depth for deep water waves? (d > λ/2, or d > λ/4)?
%
% End of EXERCISE BLOCK #2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear the variables in your Workspace to reduce confusion: 

clear
g=9.8;  % gravitational acceleration

%%%%% Wave (Phase) speed v. Wavelength %%%%%
% Now, we want to see how the wave speed varies with wavelength.  So, this
% time we'll hold the depth constant, and vary the wavelength. 

% Set a new constant depth at the depth where the 100 m waves became
% shallow water waves: 

dd = 5; %constant depth

% Create a vector of wavelengths varying from 1 to 150 meters:

LL = 1:150; %varying wavelength

% Define the dispersion relation using the varying wavelength and holding
% the depth constant: 

cc = sqrt(g*LL/(2*pi).*tanh(2*pi*dd./LL)); %dispersion relation

% Open a new figure and plot the wave speed v. the wavelength
% Make the line black ('k')
% Make it have 'LineWidth' = 2. 
% Title your plot 'Wave Speed v. Wavelength at constant depth = 5 m'
% Label the x- and y-axes with quantities and units. 


% Now let's add the shallow- and deep-water approximations. 

% Since the depth is constant, the shallow wave speed doesn't change. 
% create a vector of ones the same size as your wavelength vector: 
oo = ones(size(LL));

% Then, multiply each of those ones by the value of the shallow water wave
% speed at the fixed depth: 
ccs = oo.*sqrt(g*dd);

% Add your shallow water approximation to the plot of your dispersion
% relation: 
hold on; plot(LL, ccs, 'r','LineWidth',2)

% And grid lines to your plot: 
grid on

% Zoom in on the area of interest in your figure:
axis ([0 150 0 10])

% How does your shallow water approximation compare to your full dispersion
% relation?  Zoom in a little, run your mouse over the graphs, and
% determine at which wavelength the two graphs start to asymptote.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXERCISE BLOCK 3. Wave Phase Speed v. Wave Length: Shallow water approx.
% 28) Copy-paste your figure of the wave (phase) speed due to the full 
% dispersion relation and the shallow-water approximation for constant 
% depth d=5m.
%
%Include the code you used to generate your figure.
%
% Answer the following questions in your answer sheet:
%29) Comparing the full dispersion relation to the shallow-water 
% approximation for constant depth.
% a)At which wavelength does the Dispersion Relation asymptote with 
% the Shallow water approximation plot?

%b) How does that wavelength relate to the constant depth d=5m (i.e. what 
% fraction of the wavelength is that depth)? Please simplify your answer to
% a fraction that has "1" in the numerator.

%c) How does the fraction that you found compare to the theoretical cutoff 
% ratio of depth/wavelength for shallow water waves (d < λ/20)?
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Define the Deep Water wave speed vector using the wavelength vector:

ccd = sqrt(g*LL/(2*pi)); %deep water wave speed

% Add your deep water approximation to the plot of your dispersion relation:
hold on; plot(LL,ccd, 'g','LineWidth',2)

% Add a legend to the plot of your dispersion relation:
legend('Full dispersion relation',...
    'Shallow Water Approximation',...
    'Deep Water Approximation','Location','SouthEast')


print('-djpeg','Wavespeed_v_Wavelength')  %Make a jpeg of your figure

% Copy-paste your figure into your answer sheet. 

% To save your Matlab session into the filename you created at the start, type:
diary off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXERCISE BLOCK 4. Wave Phase Speed v. Wave Length: Deep water approx.
% 30) Copy-paste your figure of the wave (phase) speed due to the full 
% dispersion relation and the deep-water approximation. 
% Include the code you used to generate your figure. 

% Answer the following questions in your answer sheet:

% 31) Comparing the full dispersion relation to the deep-water
% approximation for constant depth.
% a) At which wavelength do the two graphs first start to separate?  
% 
% b) How does that wavelength relate to the constant depth (i.e. what
% fraction of the wavelength is that depth)? 
%
% c) How does the fraction that you found compare to the theoretical
% cutoff depth for deep water waves (d > λ/2 or d > λ/4)? 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

