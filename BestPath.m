function [rInd,cInd,elevs] = BestPath(elevationData)
% the BestPath function takes a single input of a m x n array of elevation
% data and returns the cheapest possible path through the data, returning
% row, column and elevation data.
% Input: m x n 2D array
% Outputs: row indices, column indices, and elevation data
%
% Author - Alex Ruddell | arud699@aucklanduni.ac.nz

% intialisation
[h,l] = size(elevationData);
currentRow = 1;
currentColumn = 1;
nextColumn = 2;
% set up costs array
tempCosts(1:h,1:l) = 1/eps;
currentCost = 0;
tempCosts(currentRow,currentColumn) = currentCost;
% set up permanent cost array
permCosts(1:h,1:l) = 1/eps;
storedCost = 1/eps;
while currentColumn + 1 < l
    % cycle through the whole temp costs array to find the smallest cost!
    for a = 1:h
        for b = 1:l
            if tempCosts(a,b) == min(min(tempCosts))
                % labelled as permanent
                permCosts(a,b) = tempCosts(a,b);
                currentRow = a;
                currentColumn = b;
                % set the smallest cost at the current cost to work from
                currentCost = tempCosts(a,b);
                rInd(b) = a;
            end
        end
    end
    % finds the temporary nodes that you can travel to, based on the current
    % column and row
    nextColumn = currentColumn + 1;
    for c = [currentRow - 1, currentRow, currentRow + 1]
        if c > 0 && c <= h
            tempCosts(c,nextColumn) = abs(elevationData(c,nextColumn) - elevationData(currentRow,currentColumn));
        end
    end
    tempCosts(currentRow,currentColumn) = 1/eps;
    % tests if the current cost to move to a node is less than the cost of any
    % other temporary node on the map
    for d = 1:h
        % if the tempvalue isnt infinity..
        if tempCosts(d,nextColumn) < 1/eps
            % calculate the cost of travelling there
            Walk = tempCosts(d,nextColumn);
            newCost = Walk + currentCost;
            % if that new cost is now the smallest thing, make that your new
            % position and save it
            if newCost <= min(min(tempCosts))
                storedCost = newCost;
                permCosts(:,nextColumn) = 1/eps;
                permCosts(d,nextColumn) = storedCost;
                % it is no longer temporary
                tempCosts(currentRow,currentColumn) = 1/eps;
            else
            end
        end
    end
end
% finds column and row indices
cInd = 1:l;
for i = 1:h
    if min(tempCosts(:,l)) == tempCosts(i,l)
        rInd(l) = i;
    end
end
% finds elevation data
for i = 1:l
    elevs(i) = elevationData(rInd(i),cInd(i));
end
end
