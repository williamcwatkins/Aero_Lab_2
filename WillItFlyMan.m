function [Clift, Cdrag, aoa, velocity] = WillItFlyMan(CPressure)
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

r = 0;
i = 1;
while(i <= rows)
    r = r + 1;
    Clift(1,r) = CLift(i);
    Clift(2,r) = CLift(i + 1);
    Clift(3,r) = CLift(i + 2);
    Cdrag(1,r) = CDrag(i);
    Cdrag(2,r) = CDrag(i + 1);
    Cdrag(3,r) = CDrag(i + 2);
    aoa(1,r) = AoA(i);
    aoa(2,r) = AoA(i + 1);
    aoa(3,r) = AoA(i + 2);
    velocity(1,r) = Velocity(i);
    velocity(2,r) = Velocity(i + 1);
    velocity(3,r) = Velocity(i + 2);
    i = i + 3;
end

end

