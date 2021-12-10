%w11

%general file reading
statePopulation = readtable("States_pops.xlsx");
stateNames = readtable("Stateids.txt");
prisonTable = readtable("Prison_data.txt");


year = 1985;
yearPop = append('y',int2str(year)); %appends y to the year as it is labeled as "y" + year in the txt file and makes year into string

varname = 'CUSTOTM';

rows = (prisonTable.YEAR == year);
%dataTable = 

ID = stateNames(:,1); %table of state IDs
STATE = stateNames(:,2); %Table of state names

narrowedPrisonData = prisonTable(rows, 1:51); %rarrows values to year
PrisonData_relevant = narrowedPrisonData(1:51,varname); %narrows values to which category and to the number of states

narrowedPopulationData = statePopulation(:,yearPop); %grabs the population for each state at a certain year
populationData_relevant = narrowedPopulationData(2:52,:); %fitted to the number of states. there are 56 for some reason??

PER_K = (PrisonData_relevant.Variables ./ populationData_relevant.Variables) * 1000; %how many people per 1000 are incarcerated


dataTable = table(ID, STATE, PrisonData_relevant, PER_K) 



