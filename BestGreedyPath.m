function [rInd,cInd,elevInd] = BestGreedyPath(elevationData)
% This function takes an input array of elevations and calculates the best
% greedy path to travel from one side of the map to another.
% Input: m x n array of elevation data
% Outputs: row indices and column indices referring to the best greedy path
%           to take, and elevations for those indices.
%
% Author: Alex Ruddell | arud699@aucklanduni.ac.nz

% rows = h, columns = l
[h,l] = size(elevationData);
% for all the rows
for r = 1:h
    % for all the columns
    for c = 1:l % i values start at number one and go to length l
        startPosition = [r,c];
        % first do the easterly direction
        [temprInd,tempcInd] = GreedyWalk(startPosition,1,elevationData);
        x = c;
        y = 1;
        % convert to row and column indices
        while x <= l
            rInd(1,x) = temprInd(1,y);
            cInd(1,x) = tempcInd(1,y);
            x = x + 1;
            y = y + 1;
        end
        temprInd = 0;
        tempcInd = 0;
        % now do the westerly direction
        [temprInd,tempcInd] = GreedyWalk(startPosition,-1,elevationData);
        x = c;
        y = 1;
        % convert to row and column indices
        while x >= 1
            rInd(1,x) = temprInd(1,y);
            cInd(1,x) = tempcInd(1,y);
            x = x - 1;
            y = y + 1;
        end
        % find elevation data for your row and column indices
        [elevInd,pathCost] = FindPathElevationsAndCost(rInd,cInd,elevationData);
        rInds(r,:,c) = rInd;
        cInds(r,:,c) = cInd;
        pathCosts(r,c) = pathCost;
        elevInds(r,:,c) = elevInd;
    end
end
% going backwards to find the most northerly minimum
for r = h:-1:1
    for c = l:-1:1
        if min(pathCosts) == pathCosts(r,c)
            rInd = rInds(r,:,c);
            cInd = cInds(r,:,c);
            elevInd = elevInds(r,:,c);
        end
    end
end
end