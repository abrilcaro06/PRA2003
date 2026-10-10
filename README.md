# PRA2003 - Monitoring bacterial movement and populations 
Abril Caro Picas - i6375969

## Biology questions to be answered 

1. What are the average counts of each bacterial strain and their statistical uncertainties?

2. Is there any asymmetry between the normal and the mutant strain?

3. Is there any asymmetry as a function of their momentum?

## Data set description
- There are 10 separate files, all containing around 500k events
- Each file is named output-Set#.txt
- The files contain different bacterial strains, with the IDs being expressed in the last column
- Each event is labeled by a header, where the first value is the event number, and the second value is the number of bacteria under that event


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
| Mycobacterium tubercolosis                  | 3312    |
| Drug-resistant Mycobacterium tuberculosis   | -3312   |
| Salmonella enteric                          | 3334    |
| Salmonella mutant                           | -3334   |


# Week 3 - Code installation
The code that was used to analyze all of the output sets was done in R, and is visible in the repository as "Deliverable3.R". 

To analyze the data, all of the 10 files were downloaded to be ready for use. The code processes each file individually and reads all the 500k events. It reads through the bacteria and gives values for the total events processed. The data is then organized to show the total count, averages, and uncertainties of the bacteria in each specific strain.

The bacteria with IDs that do not match the 12 strains were ignored, along with the invalid data lines. 

# Week 4 - Data analysis
When collecting the results for data analysis, the "Deliverable3.R" code was run through every separate output file.
Each file was then used as a different subsample group, meaning that there were 10 total subgroups for the analysis.
Each code was run individually to give the output values for the averages and uncertainty values for each bacteria ID in each set. All of these were then gathered and averaged once more to result in one average and one uncertainty per bacterial strain.

## Results of averages and uncertainties
For each of the data sets, the uncertainties were written down. The values for the total average were rounded to the third decimal place, except for the values for bacteria ID 3334 and -3334, as those values are too small to round and would give a value of 0.
However, it is important to note that the full numbers were used for the continuation of the data analyis and the rounding was just done to present the data in a more concise form.  

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

The difference of the averages between the different strains was then calculated.


| Bacteria pairs     | The difference between the means     |
| -------------------------------------------- | ---------- |
| 211 / -211                                   | 0.032296   |
| 321 / -321                                   | 0.005687   |
| 2212 / -2212                                 | 0.023873   |
| 3122 / -3122                                 | 0.004563   |
| 3312 / -3312                                 | 0.000441   |
| 3334 / -3334                                 | 0.000036   |


# Results for asymmetry
To answer the other two questions, we must look at the symmetry for each of the bacterial strains.
To do so, I will be using the z-score, which has the following formula:

$$
z = \frac{\text{mean}_1 - \text{mean}_2}{\sqrt{\text{std}_1^2 + \text{std}_2^2}}
$$

| Bacteria ID pairs | z-score    | Asymmetry?   |
| :-----: | :---: | :---: |
| 211 / -211 | 0.657   | No   |
| 321 / -321 | 1.374   | No  |
| 2212 / -2212 | 9.776   | Yes   |
| 3122 / -3122 | 6.876   |  Yes  |
| 3312 / -3312  | 0.00   | No   |
| 3334 / -3334  | 0.00004   | No   |

The z-score looks at whether the difference measured is bigger than the noise produced.
If there were no asymmetry, the means would be equal.
 
The two pairs showing asymmetry were 2212/-2212 and 3122/-3122, and as seen, they have very high z-scores in comparison to the others. The low scores show that they are not statistically significant and are considered symmetric.

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

### Working out example
Explanation of working out for pair 211/-211:

$$
211 -> 19.954 +/- 0.0327
-211 -> 19.923 +/- 0.0319
$$
$$
Difference = 19.954-19.923 = 0.031
$$
σ= sqrt(0.0327^2 + 0.0319^2)
σ = 0.04583

3σ = 3 x 0.04583 = 0.137048

Comparing 0.031 < 0.137048, the difference is within the threshold.
	​

