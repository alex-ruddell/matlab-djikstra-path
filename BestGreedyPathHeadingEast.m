function [rInd,cInd,elevInd] = BestGreedyPathHeadingEast(elevationData)
% This function takes an input array of elevations and for the easterly
% direction (direction=1), finds the best greedy path to the other end.
% Input: m x n array of elevation data
% Outputs: row indices and column indices referring to the best greedy path
%           to take, and elevations for those indices.
%
% Author: Alex Ruddell | arud699@aucklanduni.ac.nz

% gets size data of elevation array
[h,~] = size(elevationData);
% for all the rows of the array
for i = 1:h
    % use the western side and each possible position as the start point
    startPosition = [i,1];
    % find the indices of the greedywalk
    [rInd,cInd] = GreedyWalk(startPosition,1,elevationData);
    % use them to find the elevations and path costs for this path
    [elevation,pathCost] = FindPathElevationsAndCost(rInd,cInd,elevationData);
    % add cost of path to an array
    pathCosts(i,1) = pathCost;
    % add the row, column and elevation data to arrays
    rInds(i,:) = rInd;
    cInds(i,:) = cInd;
    elevationArray(i,:) = elevation;
end

% start x as 1 for making the iValues array
x = 1;
for i = 1:h
    % cycle through i values, testing to see if it is equal to the minimum
    % path cost
    if min(pathCosts) == pathCosts(i,1)
        % if it is, add it to an array and increase x by 1
        iValues(x) = i;
        x = x + 1;
    end
end

% find the smallest value of i, always defaults to the smallest possible
% row number
i = min(iValues);
% retrieves the stored data for that row number
rInd = rInds(i,:);
cInd = cInds(i,:);
elevInd = elevationArray(i,:);
    
end