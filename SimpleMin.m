function Position = SimpleMin( Array )
%SIMPLEMIN Find the position of the minimum element
%   Finds the index of the minimum element of the Array

Position = 0;
Value = -1;

for i = 1 : length(Array)
    this_value = Array(i);
    if Value == -1
        Position = i;
        Value = this_value;
    elseif this_value < Value
        Position = i;
        Value = this_value;
    end
end
end