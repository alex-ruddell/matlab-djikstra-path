function [rInd,cInd] = GreedyWalk(startPosition,direction,elevationData)
% The purpose of this function is to find a greedy path from a specified
% start position heading in a specified direction until the edge of the
% array is reached, resulting in the total smallest elevation change.
% Inputs: start position given as a row and column in form [r,c], direction
%           of movement (+1 being east, -1 being west), and a M x N array
%           of elevation data to travel through.
% Outputs: rInd, a set of row indices travelled through, and cInd, a set of
%           column indices travelled through. 
%
% Author: Alex Ruddell | arud699@aucklanduni.ac.nz

% sets initial i value for array creation
i = 1;
% size data of elevationData retrieved for later use
[~,l] = size(elevationData);
% sets starting row and column into the first positions of the indices
% arrays
currentRow = startPosition(1);
currentColumn = startPosition(2);
rInd(i) = currentRow;
cInd(i) = currentColumn;
if direction == 1
    while currentColumn < l % this is the letter l to specify the total number of columns in the array
        % GreedyPick function is called and cycled through until the end of
        % the array is reached.
        currentPosition = GreedyPick([currentRow currentColumn],direction,elevationData);
        i = i + 1;
        currentRow = currentPosition(1);
        currentColumn = currentPosition(2);
        rInd(i) = currentRow;
        cInd(i) = currentColumn;
    end
elseif direction == -1
    while currentColumn > 1 % this is the number 1 as movement is 'backwards'
        % GreedyPick function is called and cycled through until the end of
        % the array is reached.
        currentPosition = GreedyPick([currentRow currentColumn],direction,elevationData);
        i = i + 1;
        currentRow = currentPosition(1);
        currentColumn = currentPosition(2);
        rInd(i) = currentRow;
        cInd(i) = currentColumn;
    end
end
end
