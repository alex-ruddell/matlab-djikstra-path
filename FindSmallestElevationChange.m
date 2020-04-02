function [smallestPosition] = FindSmallestElevationChange(currentElevation,newElevations)
% This function, given a current elevation and set of new elevations,
% chooses the new array element that would give the smallest elevation
% change.
% Inputs: current elevation value
% Outputs: new elevation values in an array
%
% Author: Alex Ruddell | arud699@aucklanduni.ac.nz

% calculates the absolute value of each possible transition and stores it
% in an array
for i = 1:length(newElevations)
    changes(i) = abs(currentElevation - newElevations(i));
end    
% finds the minimum change in elevation from the changes array
smallestPosition = find(changes == min(changes));
end
