%Mapping submuestreo intrasierra 


pkg load statistics
pkg load dataframe
pkg load symbolic

%DATA ---------------------

%https://stackoverflow.com/questions/28407344/reading-text-number-mixed-csv-files-as-tables-in-octave
%data = dataframe ('Matrix complete_2020.csv');
%Data size
%SR = sum(data(:,4));%N flowers plants
%SR = size(data);SR = SR(1,1);%N plants
%SIE = (data(:, 'Sierra'));

fid = fopen('291007Tabla1.csv');
in = fscanf(fid,'%c');
fclose(fid); 
