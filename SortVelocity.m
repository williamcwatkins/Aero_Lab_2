function [BoringDataNameHere, indexesa] = SortVelocity(FirstThingsFirst)
%SortVelocity sorts the initial data array within AoA by velocity

rows = size(FirstThingsFirst,1);

i = 1;
row = 2;
rowv = 2;
indexesa(1) = 0;
indexesv(1) = 0;

while i <= rows - 1
    indexesa(row) = i;
    indexesv(rowv) = i;
    if(FirstThingsFirst(i + 1, 23) ~= FirstThingsFirst(i,23))
        row = row + 1;
    end
    if(FirstThingsFirst(i + 1, 4) ~= FirstThingsFirst(i,4))
        rowv = rowv + 1;
    end
    i = i + 1;
end
indexesa(row) = indexesa(row) + 1;
indexesv(row) = indexesv(row) + 1;
for i = 2:row
    for j = 1 + indexesa(i - 1):indexesa(i)
        for h = 1 + indexesa(i - 1):indexesa(i) - 1
            lo = FirstThingsFirst(h,4);
            hi = FirstThingsFirst(h + 1,4);
            if(lo > hi)
                 FirstThingsFirst = Swap(FirstThingsFirst, h);
            end
        end
    end
end

BoringDataNameHere = FirstThingsFirst;
end

