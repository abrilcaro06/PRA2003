
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
| Streptococcus pneumoniae                   | 3122    |
|Capsule-deficient streptococcus pneumoniae   | -3122   |
| Mycobacterium tubercolosis                  | 3312    |
| Drug-resistant Mycobacterium tuberculosis   | -3312   |
| Salmonella enteric                          | 3334    |
| Salmonella mutant                           | -3334   |


# Week 3 - Code installation
The code that was used to analyze all of the output sets was done in R, and is visible in the repository as **"Deliverable3.R"**.  

To analyze the data, all of the 10 files were downloaded to be ready for use. The code processes each file individually and reads all the 500k events. It reads through the bacteria and gives values for the total events processed. The data is then organized to show the total count, averages, and uncertainties of the bacteria in each specific strain.

The bacteria with IDs that do not match the 12 strains were ignored, along with the invalid data lines. 

# Week 4 - Data analysis
When collecting the results for data analysis, the "Deliverable3.R" code was run through every separate output file.
Each file was then used as a different subsample group, meaning that there were 10 total subgroups for the analysis.
Each code was run individually to give the output values for the averages and uncertainty values for each bacteria ID in each set. All of these were then gathered and averaged once more to result in one average and one uncertainty per bacterial strain.

## Results of averages and uncertainties
For each of the data sets, the uncertainties were written down. The values for the total average were rounded to the third decimal place, except for the values for bacteria ID 3334 and -3334, as those values are too small to round and would give a value of 0.
However, it is important to note that the full numbers were used for the continuation of the data analysis, and the rounding was just done to present the data in a more concise form.  

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
To do so, different methods may be used, either calculating asymmetry with a formula or finding the z-score. Yet both of them give resulting values to help answer the question.

One of the formulas to calculate asymmetry is:

$$
A = \frac{N(\text{WT}) - N(\text{mutant})}{N(\text{WT}) + N(\text{mutant})}
$$

This asymmetry value can then be divided by the standard deviation to find the number of sigmas present. If the sigma value is above the 3-sigma threshold, it would be considered asymmetric. The figure below presents the values that were calculated 


<img width="589" height="372" alt="Screenshot 2026-10-10 at 11 49 25 AM" src="https://github.com/user-attachments/assets/8a6448fb-bc3a-4d92-8ab2-0fe6aa3fedfe" />

_Figure 1: Table including average count, standard deviation, and uncertainty results for each strain_  

The results were then further analyzed to give the difference value, the asymmetry, the significance with regard to sigma, and whether they were asymmetric or symmetric.

<img width="737" height="270" alt="Screenshot 2026-10-10 at 12 29 29 PM" src="https://github.com/user-attachments/assets/cb81740a-e642-4eb6-b209-603fb9eec313" />
_Figure 2: Overview of results including the difference, asymmetry values, significance, and the level of symmetry_  

These values were all saved in the CSV file called "Combined.csv".


Furthermore, the results may be calculated using the z-score calculation, which has the following formula:

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

### Statistical Comparison

* **Value for 211:** $19.954 \pm 0.0327$
* **Value for -211:** $19.923 \pm 0.0319$

#### 1. Difference Calculation
$$
\text{Difference} = 19.954 - 19.923 = 0.031
$$

#### 2. Standard Error of the Difference ($\sigma$)
$$
\sigma = \sqrt{0.0327^2 + 0.0319^2} = 0.04568
$$

#### 3. Threshold ($3\sigma$)
$$
3\sigma = 3 \times 0.04568 = 0.13704
$$

Comparing $0.031 < 0.13704$, the difference is **within the threshold** (not statistically significant at the $3\sigma$ level).

# Plotting of each bacterial strain pair - Week 6 
To answer the third question of identifying whether the strains had asymmetry as a function of momentum, multiple calculations and visualizations had to be done.

Code of named **Part1Deliverable6.R** reads all the data sets and calculates the momentum using the functions below. Each of the output sets that we were given contained lines that hold values for px, py, pz, and the ID numbers. 

$$
p = \sqrt{p_x^2 + p_y^2 + p_z^2}
$$

The code then adds the information into a CSV file, reading from output-Set# into momenta-Set#.csv. 

Then a separate code was created labeled **"Part2Deliverable6.py** in this code, it asks the user for which ID they want to look at; it then sorts it into bins. It prints the results and saves them as asymmetry(ID).csv files, where it also codes for two graphs. One with the dN/dP vs momentum and the other one graphing the asymmetry versus momentum of each pair. 

### Calculating the bins
Each bacterial pair has different momentum ranges and shapes so the bin arrays must be changed in each. The size of the bins is impacted by the amount of bacteria in that bin. The more bacteria that were present meant that the bin would be narrower, whilst vise versa for fewer bacteria. Therefore, each bin must have enough bacteria; otherwise, there might be too much noise or incorrect error bars. 

Additionally, a calculation was done to correct for bin widths for the dN/dP. This was done by converting the data from frequency to density. This was important so the bins could be compared with one another. 

$$
density = frequency/bin width
$$

##### Specific bins per ID pair

| Bacteria pairs     | Specific bin values     |
| -------------------------------------------- | ---------- |
| 211 / -211                                   |bins=np.array([0, 0.25, 0.50, 0.75, 1, 1.5, 2, 3, 4, 6, 8, 12, 16, 24, 32])   |
| 321 / -321                                   | bins=np.array([0, 0.5, 1, 1.5, 2, 2.5, 3, 4, 6, 8, 12, 16, 24, 40   |
| 2212 / -2212                                 | bins=np.array[0, 1, 1.5, 2, 2.5, 3, 4, 6, 8, 12, 16])  |
| 3122 / -3122                                 | bins=np.array[0, 1, 1.5, 2, 2.5, 3, 4, 6, 8, 12, 16]   |
| 3312 / -3312                                 |  bins=np.array[0, 1, 1.5, 2, 2.5, 3, 4, 6, 8, 12, 16])   |
| 3334 / -3334                                 | bins = np.array([0, 1, 2, 3, 4.5, 7, 10, 15, 21])   |

### Further calculations
The initial asymmetry formula was used again, and dN/dP was also calculated.

$$
A = \frac{N(\text{WT}) - N(\text{mutant})}{N(\text{WT}) + N(\text{mutant})}
$$

$$
\frac{dN}{dP} = \frac{N}{\text{width} \times \text{event}}
$$

Then the mean per bin and uncertainty were calculated for each dataset, which represented the subsamples. 
The results were then plotted into two graphs for each pair. 

## Results for each bacteria pair showing bacteria per unit momentum
### How to read plots:
The first graph shows the number of bacteria per unit momentum, where dN/dP was on the y-axis, and the momentum was on the x-axis.
The horizontal lines at each point express the bin width, whilst the vertical lines are the error bars. 
Each bin width is altered based on the number of bacteria in each bin; if the error bars are too big, then widen the bins. 


### 211/-211

<img width="1507" height="839" alt="Screenshot 2026-10-13 at 7 31 34 PM" src="https://github.com/user-attachments/assets/c328a6bf-ceec-4172-b00f-a4840ac57b42" />

- There is a steep decline with momentum
- Overlap between WT and mutant in every bin
- Error bars are largest at the lower momentum (bin 3-4)

### 321/-321

<img width="950" height="600" alt="dN:dP 321" src="https://github.com/user-attachments/assets/ea9c63d5-3a25-478f-8a4e-406a77e61387" />

- peak dN/dP at around 0.67
- the WT and mutant overlap at every bin
- larger error bars at lower momentum likely from subsample 10 distribution 


### 2212/-2212

<img width="1710" height="1033" alt="PRA2003_dNdP_2212_P aeruginosa" src="https://github.com/user-attachments/assets/5bf5c424-d770-44ca-a213-6d7fe4576f85" />

- peak dN/dP at 0.22
- larger error bars, between 2.5-4 show that subsample 10 has a different momentum distribution


### 3122/-3122

<img width="892" height="602" alt="Screenshot 2026-10-12 at 19 26 35" src="https://github.com/user-attachments/assets/6e74af31-3db4-4459-84b3-d68cf6a6c3ef" />

- peak dN/dP is around 4.7 x 10^-2
- The dN/dP decreases with increasing momentum for the WT and mutant
- Error bars are large in some bins, indicating variability between subsamples


### 3312/-3312

<img width="950" height="600" alt="PRA2003_dNdP_3312_M tuberculosis" src="https://github.com/user-attachments/assets/13afdc55-1b4c-4add-9e4b-a27b397240d0" />

- peak dN/dP at 0.0055

### 3334/-3334

<img width="1120" height="679" alt="Screenshot 2026-10-13 at 17 25 14" src="https://github.com/user-attachments/assets/b54e2e9f-dea5-494f-ba1a-e071bb32a88a" />

- Both strains peak at a low momentum and fall steadily
- The error bars are very similar, and large uncertainty at bins 3-5

## Results for each bacteria pair showing asymmetry versus momentum 
### How to read plots:
The second graph shows whether the wild type (WT) and mutant differ at specific momentum. The axis are asymmetry (based on the previous formula) on the y-axis, and momentum on the x-axis. 

Here, the pink line represents the asymmetry value. Additionally, if the wild type is greater than the mutant at every momentum, the points will show up above 0. 
The gray area shows the overflow bins. 

If the pink band overlaps with the red line, it is not asymmetric. However, the error bars must also be taken into consideration with their overlap with the pink and red bands.


### 211/-211

<img width="1509" height="839" alt="Screenshot 2026-10-13 at 7 31 42 PM" src="https://github.com/user-attachments/assets/71292807-9b1f-4eb6-aa18-8d71b67dbf57" />

- Assymetry is 0.0008 +/- 0.0001
- Asymmetry rises with momentum
- Pink line above the red, so it's symmetrical
- SD is over zero

### 321/-321

<img width="950" height="600" alt="asymmetry321" src="https://github.com/user-attachments/assets/54b812bd-c866-4fc6-99a4-c43127f091c8" />

- Asymnetry is 0.0011 +/- 0.0007
- This is below the threshold, meaning that it is symmetrical
- However, note that the pink line and red line are very close to one another
- SD is over zero


### 2212/-2212

<img width="1710" height="1033" alt="PRA2003_asymmetry_2212_P aeruginosa" src="https://github.com/user-attachments/assets/1f40b36d-9e11-4e06-a32a-e99d324e11f6" />

- The WT is greater than the mutant at every momentum (points above 0)
- Shows asymmetry

### 3122/-3122

<img width="900" height="595" alt="Screenshot 2026-10-12 at 19 26 41" src="https://github.com/user-attachments/assets/e53c9f41-207b-4b0b-8b53-2f6f3e4df6d9" />

- The pink band at A = 0.00894 +/- 0.00106
- The pink band does not overlap with the red line, so it is asymmetric

### 3312/-3312

<img width="950" height="600" alt="PRA2003_asymmetry_3312_M tuberculosis" src="https://github.com/user-attachments/assets/5ff54379-62b9-4df6-8b43-c101b5bf3e7a" />

- The pink band at 0.0056 +/- 0.0062, slightly below 3 sigma
- The pink band overlaps with the red line, so it is symmetric

### 3334/-3334

<img width="1170" height="675" alt="Screenshot 2026-10-13 at 17 25 32" src="https://github.com/user-attachments/assets/eca40455-b1fa-4c23-b233-1e178ce60431" />

- The pink band at 0.0152 +/- 0.0293
- The pink band at overlaps with the red line, so it is symmetric


# Conclusion

Overall, the 12 different bacteria IDs were analyzed, with their average counts and uncertainty being counted, and each bacteria pair being plotted in graphs demonstrating the asymmetry between the normal and the mutant strain as well as the asymmetry with regard to the function of momentum. The average counts for each event fall between a maximum of 19.95 +/- 0.03 (from E.coli WT) to counts as low as 0.0012 +/- 0.00004 (Salmonella WT). The asymmetry was investigated, finding only ID pairs 2212/-2212, and 3122/-3122 to be asymmetric, whilst the momentum-binned results matched these as well. 


