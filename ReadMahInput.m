function DatGudGudData = ReadMahInput()
%READMAHINPUT creates a cell array of all the data
%   

    Filenames = struct2cell(dir('ASEN 2002 Lab 2 Data'));

    Files = Filenames(1,4:end); 
    % If an error is thrown, check Files{1}. If it is '.DS_Store', change
    % from 3:end to 4:end. Double check rountinely to see if that file is
    % still there, and change from 4:end to 3:end if it isn't

    for i = 1:length(Files)
        Data{i} = csvread(Files{i},1,0);
    end
    
    DatGudGudData = Data;
end

