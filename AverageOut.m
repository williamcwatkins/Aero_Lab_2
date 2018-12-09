function [Data] = AverageOut(data, AoAIndexes)
%AverageOut finds the average pressure values for each AoA and velocity

lengthAoA = size(AoAIndexes,2);
AoAIndexes(lengthAoA) = AoAIndexes(lengthAoA) - 1;
avgr = 0;
count = 0;
Pressures = zeros(1,24);

for i = 1:lengthAoA - 1 
   for j = 1 + AoAIndexes(i):AoAIndexes(i + 1)
       if(Pressures(1) == 0)
           Pressures = Pressures + data(j,1:24);
           count = count + 1;
       end
       check = abs(data(j,4) - data(j + 1,4)) <= 2;
       if(check)
           %P = data(j,1:24);
           Pressures = Pressures + data(j + 1,1:24);
           count = count + 1;
       else
           avgr = avgr + 1;
           Pressures = Pressures ./ count;
           Data(avgr,:) = Pressures;
           count = 0;
           Pressures = zeros(1,24);
       end
   end
   if(i == lengthAoA - 1)
       avgr = avgr + 1;
       Pressures = Pressures ./ count;
       Data(avgr,:) = Pressures;
       count = 0;
       Pressures = zeros(1,24);
   end
end


end

