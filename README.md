# PRA2003 - Monitoring bacterial movement and populations 
Abril Caro Picas - i6375969

## Biology questions to be answered 

1. What are the average counts of each bacterial strain and their statistical uncertainties?

2. Is there any asymmetry between the normal and the mutant strain?

3. Is there any asymmetry as a function of their momentum?


# Code installation
To analyze the data, we are using 10 separate files that include data for the bacterial strains. All of these files were downloaded to be ready for use. 

Each file contains 4 columns, in which the last column states the bacteria ID. For this analysis the bacterias which are going to be focused on are: 

| Bacteria name                               | ID      |
| ------------------------------------------  | ------- |
| E. coli WT                                  | 211     |
| E. coli mutant                              | -211    |
| Bacillus subtilis WT                        | 321     |
| Bacillus subtilis mutant                    | -321    |
| Pseudomonas aeruginosa WT                   | 2212    |
| Pseudomonas aeruginosa antibiotic-resistant | -2212   |
| Streptococcus pneumoniaet                   | 3122    |
|Capsule-deficient streptococcus pneumoniae   | -3122   |
| Salmonella enteric                          | 3334    |
| Salmonella mutant                           | -3334   |

Once the data is processed, the code will give values for the total events processed, bacteria with IDs that do not match the 12 strains and are therefore ignored, and the invalid data lines. 

Out of the data that is processed, the code organizes the values to show the total count, averages, and uncertainties of the bacteria in each specific strain.

The code is then run for the 10 different output sets to give averages and uncertainty values for each bacteria ID, for each set. All of these were then gathered and averaged once more to give the output of one average and one uncertainty per bacteria strain

# Results of averages and uncertainties
For each of the data sets, the uncertainties were written down. All of the values were rounded to the second decimal place, except the values for bacteria ID 3334 and -3334 as those values are too small to round and would give a value of 0.

| Bacteria ID | Total Average    | Total uncertainty   |
| :-----: | :---: | :---: |
| 211 | 19.95   | 6.57 x 10^-3   |
| -211 | 19.92   | 6.57 x 10^-3   |
| 321 | 2.51   | 2.33 x 10^-3   |
| -321 | 2.50   | 2.33 x 10^-3   |
| 2212 | 1.21   | 1.62 x 10^-3   |
| -2212 | 1.18   | 1.60 x 10^-3   |
| 3122 | 0.28   | 7.74 x 10^-4   |
| -3122  | 0.27   | 7.68 x 10^-4    |
| 3312 | 0.04   | 2.92 x 10^-4   |
| -3312 | 0.04   | 2.91 x 10^-4   |
| 3334 | 0.00117   | 5.09 x 10^-5  |
| -3334 | 0.00113   | 5.03 x 10^-5   |

When comparing the values for the bacterial strains that are wild type versus mutant, it shows that the total average and uncertainty are very similar. The weighted mean only differs from the original mean if the uncertainties vary greatly; therefore, the original mean is displayed in the table above.



