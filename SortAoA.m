function [BoringDataNameHere] = SortAoA(FirstThingsFirst)
%SortAoA sorts the initial data array by angle of attack

rows = size(FirstThingsFirst,1);

for i = 1:rows
    for j = 1:rows - i
        if(FirstThingsFirst(j,23) > FirstThingsFirst(j+1,23))
            FirstThingsFirst = Swap(FirstThingsFirst,j);
        end
    end
end

BoringDataNameHere = FirstThingsFirst;
end

