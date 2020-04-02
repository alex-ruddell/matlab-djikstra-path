function [newPosition] = GreedyPick(currentPosition,direction,elevationData)
% The purpose of this function is to choose what array element to go to
% next, based on the current element, resulting on the smallest elevation
% change.
% Inputs: current position, direction of movement (-1 for west, +1 for
%           east), and the new set of elevation data
% Outputs: the new position chosen, given in format [r,c] where r is the
%           new row indice and c is the new column indice.
%
% Author: Alex Ruddell | arud699@aucklanduni.ac.nz

% get dimensions of the elevationData array to use in future commands
[h,~] = size(elevationData);
% extract the current position into two variables
currentRow = currentPosition(1);
currentColumn = currentPosition(2);
% determine if it is possible to go up and/or down, going across is always
% possible
if currentRow == 1
    goUp = 0;
    goDown = 1;
elseif currentRow == h
    goUp = 1;
    goDown = 0;
else
    goUp = 1;
    goDown = 1;
end
if direction == 1 % if moving in positive direction, choose new possible positions
    newColumn = currentColumn + 1;
    if goUp == 1 && goDown == 1
        newRowSelection = [currentRow-1 currentRow currentRow+1];
    elseif goUp == 1 && goDown == 0
        newRowSelection = [currentRow-1 currentRow];
    elseif goUp == 0 && goDown == 1
        newRowSelection = [currentRow currentRow+1];
    end
elseif direction == -1 % if moving in negative direction, choose new possible positions
    newColumn = currentColumn - 1;
    if goUp == 1 && goDown == 1
        newRowSelection = [currentRow-1 currentRow currentRow+1];
    elseif goUp == 1 && goDown == 0
        newRowSelection = [currentRow-1 currentRow];
    elseif goUp == 0 && goDown == 1
        newRowSelection = [currentRow currentRow+1];
    end
end
% feed the data in the FindSmallestElevationChange function
elevationPicks = elevationData(newRowSelection,newColumn);
smallestPosition = FindSmallestElevationChange(elevationData(currentRow,currentColumn),elevationPicks);
smallestPosition = smallestPosition(1);
% set new rows and columns based on current row and column
if goUp == 1 && goDown == 1
    if smallestPosition == 1
        newRow = currentRow - 1;
    elseif smallestPosition == 2
        newRow = currentRow;
    elseif smallestPosition == 3
        newRow = currentRow + 1;
    end
elseif goUp == 0 && goDown == 1
    if smallestPosition == 1
        newRow = currentRow;
    elseif smallestPosition == 2
        newRow = currentRow + 1;
    end
elseif goUp == 1 && goDown == 0
    if smallestPosition == 1
        newRow = currentRow-1;
    elseif smallestPosition == 2
        newRow = currentRow;
    end
end
% feed the variable newPosition back to function to give output
newPosition = [newRow,newColumn];
end