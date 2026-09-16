# Groceries: Association Rule Analysis

Name: SHEMA AIMABLE    Student number: 101503

## Method

The analysis uses the groceries.csv dataset and the Apriori algorithm from the R arules package [1]. Each row represents one shopping basket. Before the analysis, blank cells and extra spaces in item names were removed. Rows with the same items were kept because they can represent separate purchases.

The minimum support was set to 1% and the minimum confidence to 30%. This keeps combinations found in at least 1% of baskets, and rules where at least 30% of baskets with the antecedent also contain the consequent. The assignment did not give specific thresholds.

## Question 1: Understand the data

a-b. There are 9,835 transactions and 169 different grocery items. c. Table 1 lists the ten most frequently purchased items. The basket count shows how many transactions contain each item.

| Item | Baskets | Percentage of baskets |
| --- | --- | --- |
| whole milk | 2,513 | 25.55% |
| other vegetables | 1,903 | 19.35% |
| rolls/buns | 1,809 | 18.39% |
| soda | 1,715 | 17.44% |
| yogurt | 1,372 | 13.95% |
| bottled water | 1,087 | 11.05% |
| root vegetables | 1,072 | 10.90% |
| tropical fruit | 1,032 | 10.49% |
| shopping bags | 969 | 9.85% |
| sausage | 924 | 9.40% |

Whole milk is the most frequently purchased item. It appears in 2,513 baskets, which is 25.55% of the dataset, or about one in four baskets.

## Question 2: Frequent itemsets

a-b. An itemset is a group of products found in the same basket. The analysis found 245 frequent itemsets containing at least two products. Table 2 shows the ten with the highest support. A + sign joins products in the same itemset.

| Itemset | Baskets | Support |
| --- | --- | --- |
| other vegetables + whole milk | 736 | 7.48% |
| rolls/buns + whole milk | 557 | 5.66% |
| whole milk + yogurt | 551 | 5.60% |
| root vegetables + whole milk | 481 | 4.89% |
| other vegetables + root vegetables | 466 | 4.74% |
| other vegetables + yogurt | 427 | 4.34% |
| other vegetables + rolls/buns | 419 | 4.26% |
| tropical fruit + whole milk | 416 | 4.23% |
| soda + whole milk | 394 | 4.01% |
| rolls/buns + soda | 377 | 3.83% |

c. Other vegetables + whole milk has the highest support among combinations with two or more products. The two items appear together in 736 baskets, so their support is 736 / 9,835 = 7.48%. d. About 7 or 8 baskets out of every 100 contain both products. Support therefore shows how common a combination is.

## Question 3: Association rules

a-b. The analysis generated 125 association rules. Table 3 contains the eight rules with the highest support and the two rules with the highest confidence and lift. The antecedent is the condition of the rule. The consequent is the item associated with that condition. Rule 1, for example, links baskets containing other vegetables with whole milk.

| Rule | Antecedent | Consequent | Support | Confidence | Lift |
| --- | --- | --- | --- | --- | --- |
| 1 | other vegetables | whole milk | 7.48% | 38.68% | 1.514 |
| 2 | rolls/buns | whole milk | 5.66% | 30.79% | 1.205 |
| 3 | yogurt | whole milk | 5.60% | 40.16% | 1.572 |
| 4 | root vegetables | whole milk | 4.89% | 44.87% | 1.756 |
| 5 | root vegetables | other vegetables | 4.74% | 43.47% | 2.247 |
| 6 | yogurt | other vegetables | 4.34% | 31.12% | 1.608 |
| 7 | tropical fruit | whole milk | 4.23% | 40.31% | 1.578 |
| 8 | tropical fruit | other vegetables | 3.59% | 34.21% | 1.768 |
| 9 | citrus fruit + root vegetables | other vegetables | 1.04% | 58.62% | 3.030 |
| 10 | citrus fruit + other vegetables | root vegetables | 1.04% | 35.92% | 3.295 |

## Question 4: Understanding the measures

Support is the percentage of all baskets containing the items on both sides of a rule. Confidence is the percentage of antecedent baskets that also contain the consequent. Lift compares this confidence with the consequent’s percentage in the whole dataset [2, 3]. The following three rules illustrate the difference.

### Rule 1: other vegetables -> whole milk

Both products occur in 736 baskets, giving support of 736 / 9,835 = 7.48%. Of the 1,903 baskets containing other vegetables, 736 also contain whole milk. Confidence is therefore 736 / 1,903 = 38.68%. The overall percentage for whole milk is 25.55%. Dividing confidence by this percentage gives lift of 1.514, using unrounded values. This means whole milk is about 1.51 times as common in these baskets as overall.

### Rule 3: yogurt -> whole milk

Both products occur in 551 baskets, giving support of 551 / 9,835 = 5.60%. Of the 1,372 baskets containing yogurt, 551 also contain whole milk. Confidence is therefore 551 / 1,372 = 40.16%. The overall percentage for whole milk is 25.55%. Dividing confidence by this percentage gives lift of 1.572, using unrounded values. This means whole milk is about 1.57 times as common in these baskets as overall.

### Rule 5: root vegetables -> other vegetables

Both products occur in 466 baskets, giving support of 466 / 9,835 = 4.74%. Of the 1,072 baskets containing root vegetables, 466 also contain other vegetables. Confidence is therefore 466 / 1,072 = 43.47%. The overall percentage for other vegetables is 19.35%. Dividing confidence by this percentage gives lift of 2.247, using unrounded values. This means other vegetables is about 2.25 times as common in these baskets as overall.

## Question 5: Find interesting rules

a-c. Comparing all 125 rules gives the results below. The rule numbers are the same as those in Table 3.

| Measure | Rule | Association | Highest value |
| --- | --- | --- | --- |
| Confidence | 9 | citrus fruit + root vegetables -> other vegetables | 58.62% |
| Lift | 10 | citrus fruit + other vegetables -> root vegetables | 3.295 |
| Support | 1 | other vegetables -> whole milk | 7.48% |

d. The three measures select different rules because they measure different things. Rule 1 is the most common combination. Rule 9 has the highest percentage of antecedent baskets containing the consequent. Rule 10 has the largest increase compared with the consequent’s overall frequency. These results apply to the thresholds used in this analysis.

## Question 6: Interpret a rule

Rule 5, root vegetables -> other vegetables, means that baskets containing root vegetables often also contain other vegetables. Of the 1,072 baskets containing root vegetables, 466 also contain other vegetables. Confidence is therefore 43.47%.

The rule shows a fairly strong positive association. Its lift is 2.247, so other vegetables are about 2.25 times as common in baskets containing root vegetables as in the whole dataset. Both categories appear together in 4.74% of all baskets. However, the rule does not mean that every purchase of root vegetables includes other vegetables.

## Question 7: Business application

a. Root vegetables and other vegetables could be placed close together in the produce area. They appear in the same basket 466 times, and their lift of 2.247 shows a positive association.

b. A possible bundle would contain root vegetables and other vegetables. For example, the manager could select products from both categories for a mixed vegetable offer and check whether customers buy it.

c. When an online basket contains root vegetables but no other vegetables, the supermarket could recommend a product from the other-vegetables category. This follows rule 5, since 43.47% of baskets containing root vegetables also include other vegetables.

## Question 8: Understanding association

a. An association rule does not prove that buying one product causes someone to buy another. It only shows that the products occur together. Customers may buy both for the same meal, because of a promotion, or because they like both products.

b. A rule can have high confidence but low lift when the consequent is already very common. For example, if confidence is 80% but the consequent occurs in 90% of all baskets, lift is 0.80 / 0.90 = 0.889. The high confidence does not show an increase over the usual purchase rate.

c. Lift greater than 1 means the products occur together more often than expected if their purchases were independent. It indicates a positive association, but it does not prove causation.

## References

[1] R arules documentation: Mining Associations with the Apriori Algorithm. https://search.r-project.org/CRAN/refmans/arules/html/apriori.html

[2] IBM Db2 documentation: Characteristics of association rules and item sets. https://www.ibm.com/docs/en/db2/11.1.0?topic=visualizer-characteristics-association-rules-item-sets

[3] IBM Db2 documentation: Lift in an association rule. https://www.ibm.com/docs/en/db2/11.1.0?topic=SSEPGG_11.1.0%2Fcom.ibm.im.model.doc%2Fc_lift_in_an_association_rule.htm
