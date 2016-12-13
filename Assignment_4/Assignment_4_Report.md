Assignment 4 (Group 16)
===============================================

**Andrei Isac (S3257053) - David Pavlov (S3187330) - Win Leong Xuan (S3208435)**

**Introduction to Data Science**

**December 13, 2016**

1. Beethoven and The Killers
----------------------------
For this assignment, we have decided the choose to use last.fm data set. It is good to note that we initially tried using MatLab with this data set, but sadly MatLab isn't able to handle big data. Because we have 360k users in our data set which will be considered as transactions and about 200k artist. By using the Association Rules package, we would need to generate a binary matrix which will be 360k by 200k. MatLab doesn't support a matrix this large. Therefore, for this exercise, we have decided to use R which performed much better with this large data set with reasonable computational time.

[*last.fm R Script*](R/Assign4.R)

**1)** To clean the data set, we removed all rows that contains only 1 play for an artist, taking into consideration that a user may mistakenly played a song or was just browsing through the library. Also, when reading the data set into our environment, R misreads certain characters in the data set, which we have replaced most of them to the correct ASCII characters. There are also a few duplicate artists listened by the same user, but the difference is that the artist name contains a & (Ampersand) so these were replaced with the word "and". We also realised that there are a few URL's in the artist name column, therefore these were also removed. By analyzing the user data set, we have came up with the 2 following distributions for age group and country. Below, you can also find a scatter plot of the confidence against the support and the lift value.

![] (images/Age_Distribution.png)

![] (images/User_Country_Distribution.png) 

**2)** Before generating the association rules, we needed to split the data set into transactions. In our case, we will consider each user a transaction where as each artist will then be the "items". Then we executed the "apriori" function from the "arules" library with a minimum support of 1%, a minimum confidence of 60% and maximum items is 5. Below, you may find the an interactive table (HTML page) of association rules generated with the apriori function.

[*Association Rules*](R/images/basket_rules.html)

![] (R/images/Rplot03.png)

![] (R/images/Rplot-con-0_6-sup-0_01-bylift.png)

Here, you can see a plot where users that listen to artists on the LHS, will most likely listen to artists on the RHS. The size of the circle is based on the support value and the color is based on the lift. These rules are sorted by the lift.

**3)** By looking for recommendations for our friend, we have tuned the apriori algorithm parameters a bit. In order to have more "intersting" rule set some modifications had to be made. For the results the apriori algorithm was executed for suppport = 0.001 and confidence = 0.5. By doing this a more extensive rule set is generated and some results which were previously missed are now available for observation. On the LHS the results had to be filtered to include "ludwig van beethoven" in order to analyze only the results which are relevant to our subject of interest. As a result some artists like The Beatles came up. Here below, you may find the some other artists that you can impress your friend with on the RHS. To get the association rules, we can also use the interactive table to filter for "ludwig van beethoven" on the LHS and then sort descending by the confidence, because then we can see which artist most likely be listened to if a user listens to Beethoven.

[*Association Rules with whole data set*](R/images/basket_rules_broad.html)

![] (R/images/Rplot02-beethoven.png)

**4)** Once again we are going to use the broader result set (support=0.001 and confidence =0.5) in order to analyze more results. To look for users that will most likely The Killers, we will filter out the association rules, that contains The Killer on the RHS therefore we can get an overview which of my Facebook friends that most likely listens to artists on the LHS, will probably like The Killers as a present. Another approach could be to create a query among our friends about a range of artists based on the results from the analysis. A possible set could be to mix it up by including the artist with the highest support - Kaiser Chiefs,the artist with the lowest lift - Athlete, the highest lift - Razorlight, an artist with small support - Snow Patrol and another one with high support - Keane. By mixing it up and having examples ofrom the most of the available options one can easily make prediction about the preferences of his friends like whether they listen to more commercial artists or not, or prefer certain combination of artists. Another available option would be to choose the rules which have highest lift. By doing this we know that if one of our friends really enjoys listening to these groups he will most cerainly appreciate the gift. Here, you can also use the interactive table to get the association rules by filtering for The Killers on the RHS and sort descending by lift.

[*Association Rules with whole data set*](R/images/basket_rules_broad.html)

![] (R/images/Rplot02-killers.png)

**5)** In order to impress our friends another approach should be used. If we want to impress them we should use something which is not so popular but at the same time is possible to be liked by them. In this case a possible solution to observe the rules with least support and pick some of them with relatively higher confidence.

![] (R/images/Rplot-least-support)


2. Understanding Cellular Function With AR
-------------------------------------------
Due to the smaller data set, this exercise is feasible in Matlab. In order to solve the exercise, the provided script `findrules.m` was used. The available data consists of 300 columns, representing the transactions (300 experiments, different gene expression profiles) and `6204 rows` representing the items, representing the genes. The difference from exercise 1 is that one item does not have only two states (bought or not bought / `{0,1}`), but instead has 3 states (underexpressed, neutral, overexpressed / `{-1,0,1}`). As stated in the provided paper [1], the most important results represent overexpressed genes, underexpressed genes being in minority. 

We aim to verify the previous assumptions by preparing the initial data to be processed by the algorithm. Because the algorithm accepts only a binary matrix, we propose the folowing solution. De duplicate each gene e.g. `YMR095C -> {YMR095C high, YMR095C low}` `({-1,0,1} -> {{0,1},{0,1}})`, in this way we will have a binary matrix of '300 transactions x 12408 items'. Note that the data resulted from this analysis does not provide any valuable output in terms of support and confidence. The result confirmed the initial assumption, because from the generated 1000 rules, none included an underexpressed gene. 

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

From the scalability point of view, detecting large frequent item sets is computationally expensive, the greater the number of items the more computational time is needed. In order to reduce the time needed to get the results, the minimum confindence and /or minimum support can be increased. From the initial setup, of 0.1 support and 0.8 confidence, we hav eincreased the minimum support to 0.15 in order to get 6 items sets, with the initial setup maximum 3 items were found in a set. In both cases 10000 rules were mined. In order to generate large data sets the apriori algorithm needs to finish the rule computations for the previous frequent itemsets (lower size) in order to be able to look into greater itemsets, there is no way to limit the maximum set size for the LHS or RHS. 

## 2.2 Strong association rules
In order to get these results we have set the minimum support to 0.1 and minimum confidence to 0.8. The rules which wave over 20% support are shown below:

```
Rule   (Support, Confidence)
Gene SNO1 high -> Gene SNZ1 high  (30%, 87.3786%)
Gene SNZ1 high -> Gene SNO1 high  (30%, 87.3786%)
Gene CTF13,CBF3C high -> Gene SNZ1 high  (25%, 97.4026%)
Gene CTF13,CBF3C high -> Gene SNO1 high  (24.3333%, 94.8052%)
Gene YER175C high -> Gene SNZ1 high  (23%, 95.8333%)
Gene YER175C high -> Gene SNO1 high  (22.3333%, 93.0556%)
Gene YGL117W high -> Gene SNZ1 high  (22%, 98.5075%)
Gene SPL2 low -> Gene PHO84 low  (22%, 89.1892%)
Gene PHO84 low -> Gene SPL2 low  (22%, 83.5443%)
Gene YBR047W high -> Gene SNZ1 high  (21.6667%, 91.5493%)
Gene YER175C high -> Gene CTF13,CBF3C high  (20.6667%, 86.1111%)
Gene CTF13,CBF3C high -> Gene YER175C high  (20.6667%, 80.5195%)
Gene PCL5 high -> Gene SNZ1 high  (20.6667%, 88.5714%)
Gene YPL033C high -> Gene SNO1 high  (20.3333%, 91.0448%)
Gene YBR047W high -> Gene SNO1 high  (20.3333%, 85.9155%)
Gene CPA2 high -> Gene SNZ1 high  (20.3333%, 95.3125%)
Gene YGL117W high -> Gene SNO1 high  (20%, 89.5522%)
Gene CPA2 high -> Gene SNO1 high  (20%, 93.75%)
Gene YOL118C high -> Gene SNO1 high  (20%, 88.2353%)
Gene YGL117W high -> Gene SNO1 high,Gene SNZ1 high  (20%, 89.5522%)
Gene YGL117W high,Gene SNO1 high -> Gene SNZ1 high  (20%, 100%)
Gene YGL117W high,Gene SNZ1 high -> Gene SNO1 high  (20%, 90.9091%)
```

We can observe that the genes SNO1 and SNZ1 imply each other and are present in almost all the rules. The rules would have been much more qualitative if bigger sized itemsets woulb be available, infortunately not possible due to computational overhead and time limits.

As a confirmation our our results, in paper [1] we have the following list of frequent genes: `CTF13, HIS5, LYS1, RIB5, SNO1, SNZ1, SRY1, YBR047W, YHR029C, and YOL118C`. We can confirm that the genes `CTF13, SNO1, SNZ1, YBR047W, YOL118C` also take part of our found top association rules. 

In [2] we have a confirmation that the first 2 association rules are already known. 

[*Genes Matlab Script*](genes.m)

[*OverExpressedRules*](GenesRulesUp.txt)

3. Bibliography
-------------------------------------------
[1] C. Creighton and S. Hanash, “Mining gene expression databases of association rules,” Oxford University Press, vol. 19, no. 1, pp. 79–86, 2003.

[2] TiersLab.com, "SNO1 - SNZ1 Interaction Summary", 2016, Available at https://thebiogrid.org/interaction/237709/sno1-snz1.html


4. Time Tracking
----------------------------
|   Name |                 Work                           |
|--------|------------------------------------------------|
| Andrei | 1.1 Graphs, General Help on 1, Full ex 2       |
| Win    | Exercise 1 in MatLab test and partial R script |
|        |                                                |
