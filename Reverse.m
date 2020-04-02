function [reversedArray] = Reverse(inputArray)
% This function takes an input 1D array of any length and reverses it.
% for example;
% Input: inputArray = [1 2 3 4 5]
% Output: reversedArray = [5 4 3 2 1]
%
% Author: Alex Ruddell | arud699@aucklanduni.ac.nz

% checks to see if the 1D array is a column vector or not
[h,~] = size(inputArray);
if h > 1
    % if it was a column vector, transpose it for testing
    inputArray = inputArray';
end
% for all of the array elements
for i = 1:length(inputArray)
    % set the i element of the reverse array to the end element minus
    % however many i's - 1, -1 because you need to do the last one first.
    reversedArray(i) = inputArray(length(inputArray)-(i-1));
end
% if it was a column vector, turn it back to a column vector
if h > 1
    reversedArray = reversedArray';
end
end


