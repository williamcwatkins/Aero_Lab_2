function [CPressureVector] = CPressureCalc(data)
%CPressureCalc calculates the coefficient of pressure at each point on the
% airfoil
    rows = size(data, 1);
    CPressureVector = zeros(rows, 19);
    CPressureVector = [data(:,4) data(:,7:23)];
    
    % Offset where we're reading data from
    CPressureVector(:,2:18) = CPressureVector(:,2:18) ./ data(:,5);
        
    % Insert angle of attack at end of row
    CPressureVector(:,19) = data(:,24);
    
end

