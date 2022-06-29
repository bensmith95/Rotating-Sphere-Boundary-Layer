# Rotating-Sphere-Boundary-Layer
MATLAB code that solves the Boundary Layer equations for a rotating sphere.

Using finite difference approximations for the partial derivatives of the boundary layer system (derived by Howarth, 1951), the resulting discretised equations are solved by a space marching Newton method which solves the non-linear system along radii at each latitudinal node, terminating at the equator.
The Von Karman equations for the boundary layer flow over a rotating disk are also solved in order to approximate the flow in the polar region, which then allows for the Newton method to march down towards the equator. Full details are available in Smith et al, 2022 [currently in draft].

To run, simply download files and run "BLRegion" in the command window. This will save the data to a file called "BL.mat". To view the results run the script "figs.m".
