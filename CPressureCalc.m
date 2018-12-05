function [CPressureVector] = CPressureCalc(data)
%CPressureCalc calculates the coefficient of pressure at each point on the
% airfoil
    rows = size(data, 1);
    CPressureVector = zeros(rows, 18);
    data = data(:,7:24)
    
    % Offset where we're reading data from
    CPressureVector = data(:,1:17) ./ data(:,5);
        
    % Insert angle of attach at end of row
    CPressureVector(:,18) = data(:,18);
    
end

