# brachistochrone

## The brachistochrone is a curve that represents the fastest descent between two points, i.e. is the curve on which a ball slides subjected to a uniform gravitational field from a point A to a lower point B in the shortest time.

The problem was modeled in MatLab by means of two functions and a script. 

The file 'time_fun.m' is the MatLab function that represents the modeling of time taken to go from A to B performing a brachistochrone curve. 

The other MatLab function 'brachistochrone.m' is used to model the objective function, it's restrictions and the optimization parameters. 

Finally, the script 'RUN_brachistochrone.m' is responsible for defining the number of discretizations of the curve wanted as well as the initial (A) and final position (B) of the problem. This script also generates two types of plot. The first is the individual graph of each discretization, plotting the shape of the curve as well as the iterations needed. The second type is the comparative one, which compare the shape of the curves and the value of the objective function ('time_fun.m') in function of the number of discretizations.

The problem is optimized using the 'SQP' (Sequential Quadratic Programming) algorithm and the built-in MatLab function 'fmincon'. The problem is solved following these steps: the X-distance is determined by means of the number of discretizations. Than the initial y-guesses are defined as to make a straight line between A and B. These parameters combined with the problem restrictions, i.e. the initial and final point are passed as input in the MatLab built-in function. Hence the function outputs the y-values that corresponds to the minimal time to go from A to B.

A further work to do is to optimize the x-values as well, since in the modeling adopted these values are fixed according to the number of discretizations and only the y-values are optimized.
