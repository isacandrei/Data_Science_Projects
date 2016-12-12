# Exercise 2 - Understanding Cellular Function With AR 

Due to the smaller data set, this exercise is feasible in Matlab. In order to solve the exercise, the provided script `findrules.m` was used. The available data consists of 300 columns, representing the transactions (300 experiments, different gene expression profiles) and `6204 rows` representing the items, representing the genes. The difference from exercise 1 is that one item does not have only two states (bought or not bought / `{0,1}`), but insteat has 3 states (underexpressed, neutral, overexpressed / `{-1,0,1}`). As stated in the provided paper [reference], the most important results represent overexpressed genes, underexpressed genes being in minority. 

We aim to verify the previous assumptions by preparing the initial data to be processed by the algorithm. Because the algorithm accepts only a binary matrix, we propose the folowing solution. De duplicate each gene e.g. `YMR095C -> {YMR095C high, YMR095C low}` `({-1,0,1} -> {{0,1},{0,1}})`, in this way we will have a binary matrix of '300 transactions x 12408 items'. Note that the data resulted from this analysis does no provide any valuable output in terms of support and confidence. The result confirmed the initial assumption, because from the generated 1000 rules, none included an underexpressed gene. 

After the above short analysis we can conclude that is safe to perform the further analysis only on overexpressed genes. The binary matrix that is constructed in order to be processed by the algoritm is build by the folowing formula: `M(i,j) = 1 if the corerspoding transcript of protein is larger than 0.2`.

## 2.1 Frequent itemsets
In order to generate big or relatively big itemsets in reasonable time, we hase set the minimum support to 15%, minimum confidence to 80% and number of rules to 10000. This configuration was used against the overexpressed genes and we have generated 36 sets of 6 genes (the largest found itemset). The folowing sets were the most common in our results: 

|Frequent Itemsets OverExpressed Genes|
|---------------|
|{ALG11	YER188W	SCD6	CTP1	YJL154C	ORC3}|
|{ALG11	SCD6	CTP1	YCL019W	YJL154C	ORC3}|
|{YMR055C	SCD6	CTP1	YCL019W	YLR116W	ORC3}|
|{FAS1	SCD6	YCL019W	YLR116W	ORC3	YOR226C}|
|{SCD6	CTP1	YCL019W	YJL154C	YJR110W	ORC3}|

As we can observe, multiple genes occur in more than one itemset, while looking at the whole frequent itemsets, most of the genes occur in more than 5 itemsets. In order to add some value to this analysys, from our initial analysis, with both underexpressed and overexpressed genes, we have foun some frequent itemsets that contain both, unfortunately because fo the computationally expensive algorithm only itemsets of size 3 were found:

|Frequent Itemsets All|
|-----------------------|
|ALG11-high	YPL022W-high	ZRT1-low|
|ALG11-high	PTP3-high	ZRT1-low|
|ALG11-high	ORC3-high	ZRT1-low|
|ALG11-high	IDP2-high	ZRT1-low|
|YIL137C-high	SCD6-high	ZRT1-low|
|YIL137C-high	YPL022W-high	ZRT1-low|
