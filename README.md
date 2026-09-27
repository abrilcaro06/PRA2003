# PRA2003 - Monitoring bacterial movement and populations 
Abril Caro Picas - i6375969

## Biology questions to be answered 

1. What are the average counts of each bacterial strain and their statistical uncertainties?

2. Is there any asymmetry between the normal and the mutant strain?

3. Is there any asymmetry as a function of their momentum?


# Code installation
To collect the data, we are using 10 separate files that include data for the bacterial strains. 

All of the files will be read to give values for the total events processed, bacteria with IDs that dont match the 12 strains (which are later ignored), and the invalid lines.
Out of the data that is processed, the code organizes the values to show the total count, averages, and uncertainties of the bacteria in each specific strain.

The code is then run for the 10 different output sets, to give averages and uncertainty values for each bacteria ID, for each set. 
