function [elevInd,pathCost] = FindPathElevationsAndCost(rInd,cInd,elevationData)
% The purpose of this function is to find the elevations corresponding to
% the row and column indices, then find the cost of traversing those
% elevations in that order.
% Inputs: the array of row indices, the array of column indices, the
%           elevation data
% Outputs: the elevations of the row and column indices, and the cost of
%           traversing those elevations
%
% Author: Alex Ruddell | arud699@aucklanduni.ac.nz

% retrieve the elevation data for each pair of row and column indices
for i = 1:length(rInd)
    elevInd(i) = elevationData(rInd(i),cInd(i));
end
% cycle through all of the elevations, finding the difference between each
% until you reach the end of the elevation array.
i = 1;
pathCost = 0;
while i < length(elevInd)
    cost = abs(elevInd(i) - elevInd(i+1)); 
    pathCost = pathCost + cost;
    i = i + 1;
end
end
