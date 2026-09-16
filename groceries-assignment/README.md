# Groceries Association Rule Analysis

**Name:** SHEMA AIMABLE

**Student number:** 101503

This assignment analyses shopping baskets in `groceries.csv` using R, the `arules` package and the Apriori algorithm.

## Submission files

| File | Description |
| --- | --- |
| [Assignment_Report.pdf](Assignment_Report.pdf) | Short report answering all eight questions, including four tables |
| [Assignment_Report.md](Assignment_Report.md) | Report that can be read directly on GitHub |
| [analysis.R](analysis.R) | Commented R code used for the analysis |
| [groceries.csv](groceries.csv) | Dataset used in the analysis |
| [tables/1_top_items.csv](tables/1_top_items.csv) | Ten most frequently purchased items |
| [tables/2_frequent_itemsets.csv](tables/2_frequent_itemsets.csv) | Ten frequent combinations of products |
| [tables/3_association_rules.csv](tables/3_association_rules.csv) | Ten example rules with support, confidence and lift |
| [tables/4_strongest_rules.csv](tables/4_strongest_rules.csv) | Rules with the highest confidence, lift and support |
| [Assignment_Report.docx](Assignment_Report.docx) | Editable copy of the report |

## Run the analysis

Download the repository and open `Assignment.Rproj` in RStudio. Keep `analysis.R` and `groceries.csv` in the same folder.

Install the packages once:

```r
install.packages(c('generics', 'arules'))
```

Run the script:

```r
source('analysis.R')
```

The script prints the results and saves the four CSV tables in `tables/`. The analysis was run with R 4.5.0 and arules 1.7.15.

## Main results

- 9,835 shopping baskets and 169 different items.
- Minimum support of 1% and minimum confidence of 30%.
- 245 frequent itemsets containing at least two products and 125 association rules.
- Whole milk is the most frequent item, appearing in 25.55% of baskets.
- Other vegetables and whole milk form the most common pair, appearing together in 7.48% of baskets.

The report shows eight rules with the highest support and the rules with the highest confidence and lift. The strongest rules were selected by comparing all 125 generated rules.
