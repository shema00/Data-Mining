# Groceries association rule analysis
# SHEMA AIMABLE - Student number: 101503
# Keep this file and groceries.csv in the same folder.
# Run the next line ONCE if arules is not installed:
# install.packages(c('generics', 'arules'))
library(arules)

# 1. Read and clean the data
# Each row is one shopping basket. The file has no column headings.
data <- read.csv('groceries.csv', header = FALSE, colClasses = 'character')
baskets <- apply(data, 1, function(row) {
  row <- trimws(row)                     # Remove extra spaces.
  unique(row[!is.na(row) & row != ''])    # Keep actual items only.
})
groceries <- as(baskets, 'transactions')  # Format required by arules.
total_baskets <- length(groceries)
cat('Transactions:', total_baskets, '\n')
cat('Different items:', length(itemLabels(groceries)), '\n')
dir.create('tables', showWarnings = FALSE)

# 2. Ten most frequently purchased items
counts <- itemFrequency(groceries, type = 'absolute')
top_counts <- head(sort(counts, decreasing = TRUE), 10)
item_table <- data.frame(
  Item = names(top_counts),
  Baskets = as.numeric(top_counts),
  Percentage = round(100 * top_counts / total_baskets, 2)
)
print(item_table, row.names = FALSE)
write.csv(item_table, 'tables/1_top_items.csv', row.names = FALSE)

# 3. Frequent itemsets
# support = 0.01 means the items occur together in at least 1% of baskets.
# minlen = 2 means an itemset must have at least two items.
itemsets <- apriori(groceries,
  parameter = list(target = 'frequent itemsets', support = 0.01, minlen = 2),
  control = list(verbose = FALSE))
itemsets <- sort(itemsets, by = 'support', decreasing = TRUE)
top_itemsets <- head(itemsets, 10)
itemset_table <- data.frame(
  Itemset = labels(top_itemsets),
  Baskets = round(quality(top_itemsets)$support * total_baskets),
  Support_percent = round(100 * quality(top_itemsets)$support, 2)
)
print(itemset_table, row.names = FALSE)
write.csv(itemset_table, 'tables/2_frequent_itemsets.csv', row.names = FALSE)

# 4. Association rules
# confidence = 0.30 means at least 30% of baskets with the antecedent
# also contain the consequent. A rule has at least two items in total.
rules <- apriori(groceries,
  parameter = list(support = 0.01, confidence = 0.30, minlen = 2),
  control = list(verbose = FALSE))
rules <- sort(rules, by = 'support', decreasing = TRUE)
cat('Frequent itemsets:', length(itemsets), '\n')
cat('Association rules:', length(rules), '\n')
best_confidence <- which.max(quality(rules)$confidence)
best_lift <- which.max(quality(rules)$lift)
best_support <- which.max(quality(rules)$support)

# Show eight common rules plus the highest-confidence and highest-lift rules.
examples <- rules[c(1:8, best_confidence, best_lift)]
rule_table <- data.frame(
  Rule = 1:length(examples),
  Antecedent = labels(lhs(examples)),
  Consequent = labels(rhs(examples)),
  Support_percent = round(100 * quality(examples)$support, 2),
  Confidence_percent = round(100 * quality(examples)$confidence, 2),
  Lift = round(quality(examples)$lift, 3)
)
print(rule_table, row.names = FALSE)
write.csv(rule_table, 'tables/3_association_rules.csv', row.names = FALSE)

# 5. Rules with the highest confidence, lift and support
winners <- rules[c(best_confidence, best_lift, best_support)]
winner_table <- data.frame(
  Measure = c('Highest confidence', 'Highest lift', 'Highest support'),
  Rule = labels(winners),
  Support_percent = round(100 * quality(winners)$support, 2),
  Confidence_percent = round(100 * quality(winners)$confidence, 2),
  Lift = round(quality(winners)$lift, 3)
)
print(winner_table, row.names = FALSE)
write.csv(winner_table, 'tables/4_strongest_rules.csv', row.names = FALSE)

# Questions 4, 6, 7 and 8 explain these results in the written report.
