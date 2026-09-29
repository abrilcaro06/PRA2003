# PRA2003 - Monitoring bacterial movement and populations 
Abril Caro Picas - i6375969

## Biology questions to be answered 

1. What are the average counts of each bacterial strain and their statistical uncertainties?

2. Is there any asymmetry between the normal and the mutant strain?

3. Is there any asymmetry as a function of their momentum?


# Code installation
To analyze the data, we are using 10 separate files that include data for the bacterial strains. All of these files were downloaded to be ready for use. 

Each file contains 4 columns, in which the last column states the bacteria ID. For this analysis, the bacterias which are going to be focused on are: 

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

The code is then run for the 10 different output sets to give averages and uncertainty values for each bacteria ID, for each set. All of these were then gathered and averaged once more to give the output of one average and one uncertainty per bacterial strain.

## Code used
The code that was used to analyze all of the output sets is shown in the repository as "Deliverable3.R". 
The file name was switched in the code when doing separate files, and then re-run for each of the 10 data sets.
Once the values were gathered, I manually added them into a Google Sheet so I could visualize the results in tables. 

# Results of averages and uncertainties
For each of the data sets, the uncertainties were written down. The values for the total average were rounded to the third decimal place, except the values for bacteria ID 3334 and -3334, as those values are too small to round and would give a value of 0.

| Bacteria ID |  Total count   | Total Average   |Total uncertainty   |
| :-----: | :---: | :---: | :---: |
| 211 |  92,126,688  | 19.954   | +/- 0.0327   |
| -211 |   91,977,542 | 19.923   | +/- 0.0319   |
| 321 |  11,587,227  | 2.509   | +/-0.00477   |
| -321 |  11,560,946  | 2.503   | +/- 0.00550   |
| 2212 |  5,578,693  | 1.210   | +/- 0.00190   |
| -2212 |  5,468,447  | 1.183   | +/- 0.00241   |
| 3122 |  1,277,330  | 0.279   | +/- 0.00107  |
| -3122  |  1,254,690  | 0.270    | +/- 0.000985   |
| 3312 |  182,139  | 0.040   | +/- 0.000284   |
| -3312 |  180,104  | 0.040   | +/- 0.000402   |
| 3334 |  5,482  | 0.00117  | +/- 4.17 x10^-5    |
| -3334 |  5,312  | 0.00113   | +/- 5.08 x10^-5    |

When comparing the values for the bacterial strains that are wild type versus mutant, it shows that the total average and uncertainty are very similar. The weighted mean only differs from the original mean if the uncertainties vary greatly; therefore, the original mean is displayed in the table above.


| Bacteria pairs                               | The difference between the means      |
| ------------------------------------------  | ------- |
| 211 / -211                                  | 0.031     |
| 321 / -321                              | 0.006    |
| 2212 / -2212                        | 0.027     |
| 3122 / -3122                    | 0.009    |
| 3312 / -3312                   | 0    |
| 3334 / -3334              | 0.000040   |



# Results for asymmetry
To answer the other two questions, we must look at the symmetry for each of the bacterial strains.
To do so, I will be using the z-score, which has the following formula:
z = (mean1 - mean2) / sqr(std1^2 + std2^2)


| Bacteria ID pairs | z-score    | Asymmetry?   |
| :-----: | :---: | :---: |
| 211 / -211 | 0.657   | No   |
| 321 / -321 | 1.374   | No  |
| 2212 / -2212 | 9.776   | Yes   |
| 3122 / -3122 | 6.876   |  Yes  |
| 3312 / -3312  | 0.00   | No   |
| 3334 / -3334  | 0.00004   | No   |

The two pairs showing asymmetry were 2212/-2212 and 3122/-3122, and as seen, they have very high z-scores in comparison to the others, which have scores lower than 1.96. These low scores show that they are not statistically significant and are considered symmetric. 
Values greater than 1.96 are shown to be statistically significant, as the range within 95% falls within +/- 1.96.


## Calculating based on 3 sigma 

Here is the table including all the bacterial strain pairs, their differences, the combined sigma, and comparison with their corresponding 3 sigma. 

| Pair | Difference between means | Combined σ | 3σ threshold | z | 3σ result |
|---|---:|---:|---:|---:|---|
| 211 / −211 | 0.031 | 0.04568 | 0.13705 | 0.657 | Within 3σ |
| 321 / −321 | 0.006 | 0.007280 | 0.02184 | 1.374 | Within 3σ |
| 2212 / −2212 | 0.027 | 0.003069 | 0.009207 | 9.776 | Above 3σ |
| 3122 / −3122 | 0.009 | 0.001454 | 0.004363 | 6.876 | Above 3σ |
| 3312 / −3312 | 0 | 0.0004922 | 0.001477 | 0.000 | Within 3σ |
| 3334 / −3334 | 0.000040 | 0.00006572 | 0.0001972 | 0.00004| Within 3σ |

