Assignment 6 (Group 16)
===============================================

**Andrei Isac (S3257053) - David Pavlov (S3187330) - Win Leong Xuan (S3208435)**

**Introduction to Data Science**

**January 12, 2017**

1. State of the Corpus
----------------------------

2. Your Own Search Engine
----------------------------
This exercise was done using the libraries `NLTK` and `skilearn` for python.

#### 2.1. TF.IDF

The TF.IDF of the Gutenberg corpus was performed using the `TfidfVectorizer` form the skylearn library, the `stop_words='english'` parameter was passed in order to automatically remove not relevant words from the computations.

The results of the `fit_transform` function is a matrix of word importances where each row represent the one file. The TF.IDF result is already normalized and ready to use for further analysis. 

`
[[ 0.00104886  0.00061947  0.         ...,  0.          0.          0.00052443]
 [ 0.          0.00065283  0.00084064 ...,  0.00168129  0.00084064  0.        ]
 [ 0.          0.00042669  0.00054944 ...,  0.00109887  0.00054944  0.        ]]
 `

#### 2.2. Top 10 words

The first three texts in the corpus were chosen to extract the top 10 words according to the TF.IDF. Having already the TF.IDF computed, the next step is sorting the array corresponding to each file and store the index of the top 10 words.

The result is printed along the coefficient for each word:
`
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
`

#### 2.3. where-was-that 


3. Summarize A Novel in 200 Words
----------------------------

