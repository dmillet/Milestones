%w12

%reading files
prison_data = readtable("Prison_data.txt");
state_pop = readtable("States_pops.xlsx");
prison_data = standardizeMissing(prison_data,{-1,-2,-8,-9});


%the parameter we set
varname = 'CUSTOTF';


Year = unique(prison_data.YEAR); %gethers all unique years
years_table = table(Year); %turns the unique years into a seperate table


%empty arrays to be filled with info according to the parameter
varDataArray = [];
popDataArray = [];


%forms the total population data table
Pop_data_at_year = (state_pop.STATEID == 0);
totalPopulationData = state_pop(Pop_data_at_year,:);


%Filters unused year data and places used data in a table
for i = (min(Year):1:max(Year))

    yearPop = append('y',int2str(i)); %adds "y" to fit the excel column names
    popDataArray(end+1) = totalPopulationData.(yearPop); %adds the value to an array. not all values in the table are used

end


%gathers and organizes the parameter's data according to the year
for i = (min(Year):1:max(Year))
    %gethers the total custody # according to the parameter and years
    data_at_year = (prison_data.YEAR == i)&(prison_data.STATEID == 70);
    year_Data_table = prison_data(data_at_year,:);
    varDataArray(end+1) = sum(year_Data_table.CUSTOTF);

end


%removes the NaN from the array
removeNaN = isnan(varDataArray);
varDataArray(removeNaN) = 0;


%total population data
total_population_parameter = (state_pop.STATEID == 0);
popDataTable = state_pop(total_population_parameter,:);


%calculated in costody per 1000
PER_K = (varDataArray ./ popDataArray) * 1000;


%formats arrays to be vertical
varDataArray = varDataArray.';
popDataArray = popDataArray.';
PER_K = PER_K.';


%Arrays turned to tables
varDataTable = array2table(varDataArray);
popDataTable = array2table(popDataArray);


%turning some arrays into tables to concatenate together to get final
%table
%PER_K = PER_K(:,end);
PER_K = array2table(PER_K);


%FINAALLLLYYYYYYYYYYY YYEEEESSSSSSSSSSS !!!!
Final = table(Year, varDataTable, PER_K)
