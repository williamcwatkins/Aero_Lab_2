function [Data] = TrailingEdge(data)
%TrailingEdge takes in one set of data, and computes the theoretical
% trailing edge pressure on the airfoil

    rows = size(data,1);
    newdata = ones(rows,1);

    for i = 1:rows
        % Extrapolate the trailing edge pressure for upper surface, from ports
        % 8 and 9
        length = sqrt((2.8-2.1) ^ 2 + (.21875 - .38325) ^ 2);
        deltapressure = data(i,15) - data(i,14);
        slope = deltapressure / length;
        LengthToEdge = sqrt((3.5 - 2.8) ^ 2 + (0.21875) ^ 2);
        ExtPressureTop = data(i,15) + slope * LengthToEdge;

        % Extrapolate the trailing edge pressure for lower surface, from ports
        % 11 and 10
        length = sqrt((2.8-2.1) ^ 2);
        deltapressure = data(i,16) - data(i,17);
        slope = deltapressure / length;
        LengthToEdge = sqrt((3.5 - 2.8) ^ 2);
        ExtPressureBot = data(i,16) + slope * LengthToEdge;

        % Average these 2 pressures
        TheoreticalPressure = (ExtPressureTop + ExtPressureBot) / 2;

        % Put this into the newdata vector
        newdata(i) = TheoreticalPressure;
    end
    
    % Insert theoretical pressures into the data sheet
    
    Data = [data(:,1:15) newdata(:) data(:,16:end)];
end

