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

## Code used
The code that was used to analyze all of the output sets is shown in the repository as "Deliverable3.R". 
The file name was switched in the code when doing separate files, and then re-run for each of the 10 data sets.
Once the values were gathered, I manually added them into a Google Sheet so I could visualize the results in tables. 
The link for the Google Sheet can be found here: https://docs.google.com/spreadsheets/d/1M1eYmuaDnKOEvihmmviTgG9ciG0y3ECd0DlT6uIRdLk/edit?usp=sharing

# Results of averages and uncertainties
For each of the data sets, the uncertainties were written down. All of the values were rounded to the second decimal place, except the values for bacteria ID 3334 and -3334 as those values are too small to round and would give a value of 0.

| Bacteria ID |  Total count   | Total Average   |Total uncertainty   |
| :-----: | :---: | :---: | :---: |
| 211 |  92,126,688  | 19.95   | 6.57 x 10^-3   |
| -211 |   91,977,542 | 19.92   | 6.57 x 10^-3   |
| 321 |  11,587,227  | 2.51   | 6.57 x 10^-3   |
| -321 |  11,560,946  | 2.50   | 6.57 x 10^-3   |
| 2212 |  5,578,693  | 1.21   | 6.57 x 10^-3   |
| -2212 |  5,468,447  | 1.18   | 6.57 x 10^-3   |
| 3122 |  1,277,330  | 0.28   | 6.57 x 10^-3   |
| -3122  |  1,254,690  | 0.27    | 6.57 x 10^-3   |
| 3312 |  182,139  | 0.04   | 6.57 x 10^-3   |
| -3312 |  180,104  | 0.04   | 6.57 x 10^-3   |
| 3334 |  5,482  | 0.00117  | 6.57 x 10^-3   |
| -3334 |  5,312  | 0.00113   | 6.57 x 10^-3   |

When comparing the values for the bacterial strains that are wild type versus mutant, it shows that the total average and uncertainty are very similar. The weighted mean only differs from the original mean if the uncertainties vary greatly; therefore, the original mean is displayed in the table above.

# Results for asymmetry
To answer the other two questions, we must look at the symmetry for each of the bacterial strains.
To do so I will be using the z-score, which has the following formula:
z = (mean1 - mean2) / sqr(std1^2 + std2^2)


| Bacteria ID pairs | z-score    | Total uncertainty   |
| :-----: | :---: | :---: |
| 211 / -211 | 3.34   | Evidence of asymmetry   |
| 321 / -321 | 1.82   | Weak evidence of asymmetry  |
| 2212 / -2212 | 11.86   | Evidence of asymmetry   |
| 3122 / -3122 | 8.25   |  Evidence of asymmetry  |
| 3312 / -3312  | 0   | No evidence of asymmetry   |
| 3334 / -3334  | 0.56   | No evidence of asymmetry   |


