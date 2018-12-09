function [FixedIt] = Swap(Data,num)
% Swap swaps two rows in an array

temp = Data(num,:);
Data(num,:) = Data(num + 1,:);
Data(num + 1,:) = temp;
FixedIt = Data;

end

