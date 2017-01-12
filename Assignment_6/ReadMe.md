Assignment 6 (Group 16)
===============================================

**Andrei Isac (S3257053) - David Pavlov (S3187330) - Win Leong Xuan (S3208435)**

**Introduction to Data Science**

**January 12, 2017**

1. State of the Corpus
----------------------------
#### 1 & 2. Term Frequency and Zipf's law

For this assignment, we have the 'state_union' corpus which consists of 66 State of the Union speeches. Firstly, we determined the term frequency for every term in each of the document. Then we checked if the the term frequency follows Zipf's law. To determine the Zipf's law distribution, we will use the rank of each term by doing 1/rank * max(TF). Then the 2 distributions was plotted in a log-log scaled graph. According to the figures, we can see that it clearly follows Zipf's law.

[*Exercise 1 part 1 & 2*](Ex1_12.ipynb)

#### 3. Clean up data

To clean up the data, we have removed the stop words and special characters. We have also reduced a few terms to their stem term by using the PorterStemmer. It is good to note that the stemmer doesn't work that optimal looking at the fact sometimes it will remove i.e. the 'e' from 'peace'. Lastly, we have also used lemmatization to clean up certain terms in the document. Then we computed the 10 most common terms within each document of the corpus.

[*Exercise 1 part 3*](Ex1_3.ipynb)

#### 4. Collocations
For this exercise, we would need to find 10 frequent collocations of three words within each document in the corpus, in which at least two words are proper names. We started by filtering out the stop words from the documents and the length of each word cannot be less than 3. We started off with a minimum size of the sliding window of 3 in which from the 20 collocations obtained, in most of them there are 10 frequent collocations. But by increasing the window size, we can see that more names seems to appear in the collocations. Also looking at the fact that the state of the union speeches are formal speeches in which the chance of names being used is higher and by using a bigger windows, it is most probable that you will find at least 2 names within one window.

[*Exercise 1 part 4*](Ex1_4.ipynb)

2. Your Own Search Engine
----------------------------
This exercise was done using the libraries `NLTK` and `skilearn` for python.

[*Exercise 2*](ex_2.ipynb)

#### 2.1. TF.IDF

The TF.IDF of the Gutenberg corpus was performed using the `TfidfVectorizer` form the skylearn library, the `stop_words='english'` parameter was passed in order to automatically remove not relevant words from the computations.

The results of the `fit_transform` function is a matrix of word importances where each row represent the one file. The TF.IDF result is already normalized and ready to use for further analysis. 

```
[[ 0.00104886  0.00061947  0.         ...,  0.          0.          0.00052443]
 [ 0.          0.00065283  0.00084064 ...,  0.00168129  0.00084064  0.        ]
 [ 0.          0.00042669  0.00054944 ...,  0.00109887  0.00054944  0.        ]]
 ```

#### 2.2. Top 10 words

The first three texts in the corpus were chosen to extract the top 10 words according to the TF.IDF. Having already the TF.IDF computed, the next step is sorting the array corresponding to each file and store the index of the top 10 words.

The result is printed along the coefficient for each word:
```
austen-emma.txt
mr  -  0.357436692024
emma  -  0.344999193767
harriet  -  0.265361890146
weston  -  0.230749469692
mrs  -  0.21712575486
knightley  -  0.204003508432
elton  -  0.202954647206
miss  -  0.186461775215
woodhouse  -  0.164671212462
said  -  0.149912789376


austen-persuasion.txt
anne  -  0.324458969468
elliot  -  0.319444893613
captain  -  0.254715089464
wentworth  -  0.240965352276
mrs  -  0.189974970051
charles  -  0.183487378338
mr  -  0.167125746849
russell  -  0.163591156591
walter  -  0.155853737022
musgrove  -  0.143694934843


austen-sense.txt
elinor  -  0.494873206804
marianne  -  0.408902532921
mrs  -  0.226143717665
dashwood  -  0.182055544693
said  -  0.169394445119
jennings  -  0.166161806664
willoughby  -  0.156047609737
edward  -  0.144501733023
lucy  -  0.134374330607
sister  -  0.120325525248
```

#### 2.3. where-was-that 
In order to find the text that most likely correspond to a description we are going to use the cosine measure between normalized vectors of the TF.IDF of the description string and all the files in the corpus. 

In order to achieve this we have created the `find` function that takes as parameter a string, the description. Further more, it computed the TF.IDF of all the files, including the description string as the last added file. It computes the cosine similarity for each possible pair by computing the dot product between the TF.IDF matrix and its transposed matrix, this being possible because the result of the `fit_transform` function returns normalized results. Furthermore, the results only for the searched strings are taken, ordered and printed. If the difference between the first results and the second result is significantly better, than it is pointed that the first result is the most likely result for the query, otherwise the top 10 list is printed.

```
find("story with the sailor and the whale")
find("story with the girl falling into a rabbit hole")
find("story with the girl falling into a rabbit hole Alice")
find("man walk story now then ago time")
```

```
The first result is the clear choice:
1 .  melville-moby_dick.txt  -  0.3534
2 .  bryant-stories.txt  -  0.024
3 .  chesterton-brown.txt  -  0.0174
4 .  whitman-leaves.txt  -  0.0066
5 .  edgeworth-parents.txt  -  0.0036
6 .  carroll-alice.txt  -  0.0036
7 .  burgess-busterbrown.txt  -  0.0
8 .  austen-persuasion.txt  -  0.0
9 .  austen-sense.txt  -  0.0
10 .  bible-kjv.txt  -  0.0


There is no clear choice, but first is preffered:
1 .  carroll-alice.txt  -  0.0476
2 .  bryant-stories.txt  -  0.0397
3 .  chesterton-brown.txt  -  0.0274
4 .  burgess-busterbrown.txt  -  0.0126
5 .  edgeworth-parents.txt  -  0.0121
6 .  whitman-leaves.txt  -  0.0117
7 .  blake-poems.txt  -  0.0086
8 .  chesterton-ball.txt  -  0.0083
9 .  melville-moby_dick.txt  -  0.0075
10 .  chesterton-thursday.txt  -  0.0043


The first result is the clear choice:
1 .  carroll-alice.txt  -  0.5139
2 .  bryant-stories.txt  -  0.0311
3 .  chesterton-brown.txt  -  0.0212
4 .  burgess-busterbrown.txt  -  0.01
5 .  edgeworth-parents.txt  -  0.0093
6 .  whitman-leaves.txt  -  0.0091
7 .  blake-poems.txt  -  0.0066
8 .  chesterton-ball.txt  -  0.0065
9 .  melville-moby_dick.txt  -  0.0059
10 .  chesterton-thursday.txt  -  0.0033


There is no clear choice, but first is preffered:
1 .  chesterton-brown.txt  -  0.1277
2 .  whitman-leaves.txt  -  0.0972
3 .  bryant-stories.txt  -  0.0899
4 .  melville-moby_dick.txt  -  0.0851
5 .  edgeworth-parents.txt  -  0.0811
6 .  chesterton-thursday.txt  -  0.0716
7 .  austen-persuasion.txt  -  0.0643
8 .  chesterton-ball.txt  -  0.063
9 .  milton-paradise.txt  -  0.0548
10 .  austen-emma.txt  -  0.0473
```

We can observe that for the description `story with the sailor and the whale`, the result `melville-moby_dick.txt` has a significant advantage over the second result - `0.3534 >> 0.024`. For the second search, `story with the girl falling into a rabbit hole`, the difference between the first who results is not of the order of magnitude - `0.0476 > 0.0397`, but still, the first result is correct `carroll-alice.txt`.

In order to test the correctness of the algorithm, we have added the `Alice` word in the previous search and we have observed that the `carroll-alice.txt` result is now a clear winner. The last performed search is with random words and it clearly returns no clear winner, the difference between the top 10 results are minor.

3. Summarize A Novel in 200 Words
----------------------------
Sometimes summarizing a text can become a difficult task even for humans so making a machine summarize a text is even harder. There are however several techiques used for automatic text summarization : 

1. Extraction-based summarization - an algorithm is applied which identifies the sentences which explain the text the best and they are extracted without any modifications.
2. Abstraction-based summarization - an algorithm identifies the key phrases, sentences, paragraphs which are considered most important. After that the sections are paraphrased and the summary is generated. As a result the accuracy is better but the implementation of such system is much more difficult
3. Aidded summarization - some machine learning techiques are applied and appart from fully automated summarization a system is created which aids the user with the task of summarization. There are two types of systems - machine aided humman summarization (MAHS), which highlights the important parts of the text and there are human aided machine summarization (HAMS) systems which depend on post-processing.

For the purposes of the assignment the extraction-based summarization techique will be used. As a result only the most relevant sentences will be used. In order to summarize a whole book in less than 200 words there are several steps which have to be executed:

1. The text should be cleaned. This means : analyze only words which contribute to the text,ignore words which have length<4 (the,they,I,am, etc.), ignore all stop words, stem the words
2. A list of important words should be created. Those of the filtered words which occure often in the text are considered important.
3. Based on the list of important words determine the important sections of the text. In order to achieve a higher accuracy we have implemented an algorithm which gives numerical value for the importance of a sentence. Each word from the frequent list has its own weight which is defined as a proportion of the sum off all important words. A sentence is considered more important than other if the sum of the important words` weight in it is higher than the sum of the important words weight in the other one.
4. In order to collect a higher number of sentences which have relevant information minimum sentence length is defined (4 words). Also the maximum number of words in a sentence can also be modified. By default it is 50. This is necessary since the limit of the summary text is 200 words hence longer sentences will give information only about a section and not about different parts of the book.
5. When the list of the relevant sentences is generated it is sorted by the importance weight of the sentences.
6. The top 20 sentences are picked, ordered in chronological order and printed until the word limit is reached.

The above described steps are implemented in [*TextSummarizer*](TextSummarizer.ipynb)
