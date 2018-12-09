function [CLift, CDrag, AoA, Velocity] = WillItFlyMan(CPressure)
%WillItFlyMan calculates the lift and drag coefficients at different speeds
%and angles of attack

global Location c
rows = size(CPressure,1);
CLift = zeros(rows,1);
CDrag = zeros(rows,1);
AoA = CPressure(:,19);
Velocity = CPressure(:,1);

for i = 1:rows
   CNormal = -1 * trapz(Location(1,:) ./ c, CPressure(i,2:18),2);
   CAxial = trapz(Location(2,:) ./ c,CPressure(i,2:18),2);
   CLift(i) = CNormal * cosd(AoA(i)) - CAxial * sind(AoA(i));
   CDrag(i) = CNormal * sind(AoA(i)) + CAxial * cosd(AoA(i));
end

end

