# A Forward/backward Propagation Motion Planning Algorithm for Hybrid Systems

---

Simulation M-files for examples in the draft about the forward/backward propagation motion planning algorithm for hybrid systems.

Author: Nan Wang Revision: 0.0.0.1 Date: 10/13/2021 22:57:52 https://github.com/HybridSystemsLab/SearchBasedHybridPlanner

Requirements: 

* MATLAB (Developed in R2021a)
* Install Hybrid Equations Toolbox v2.04 by downloading it from https://www.mathworks.com/matlabcentral/fileexchange/41372-hybrid-equations-toolbox-v2-04?s_tid=srchtitle

Content:

* Hybrid Equations Toolbox
* The forward/backward propagation algorithm toolbox

---

Motivational Example

This repository includes five examples:

* actuated bouncing ball
* actuated point mass
* thermostat system
* juggling apparatus system
* biped system.

The hybrid system data of each model is stored in the coorresponding folder, seperately, in the repository. The switch of the examples is implemented by uncommenting the path of the desired example in lines 5 - 9 in SearchBasedHybridPlanner.m files. The settings of those examples are the same as those in the paper.

By running SearchBasedHybridPlanner.m,

* it will generate a motion plan 'solution', with time t in the first row, the number of jumps in the second row, following the states and inputs
* it will generate a plot showing that the generated motion plan is able to connect initial and final state sets.