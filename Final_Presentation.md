Coursera Capstone Project Presentation
========================================================
author: Trung-Hieu Nguyen
date: 21/11/2015  

Introducton
========================================================
type: exclaim

<b>Data:</b>
-The data comes from the <a href="http://www.yelp.com/dataset_challenge" style="color: #CC0000"> Yelp</a> Dataset Challenge
<small>
- 1.6M reviews, 500K tips from 366K users for 61K businesses
- Text review includes star rating (1-5)
- Nearly 500k business attributes.
</small>  

<b>Task:</b> We define the question of interest ourselves and find the answer from given data.

<b>Question:</b> Can we predict the sentiment of restaurant reviews (positive or negative) from the words in the text?  

<b>Code work:</b> [Github  repository](https://github.com/nth1502/Coursera_Yelp_Capstone)
The Method
========================================================
type: exclaim

<b>Data wrangling:</b>
<small>
- Raw JSON data loading.
- Only used business and review  data for anlysis.
- 3 focused varibales: business id, star rating, textual reviews. 
</small>  

<b>Natural Language Processing:</b>
<small>
- Convert emoticon into natural language (package qdap) 
- Usual cleaning routine (package tm)
- Save final result for reproducibility. 
</small>

The method:
========================================================
type: exclaim

<b>N-gram exploration:</b>
<small>
- Unclear uni-gram
- Clear bi-gram to distinguish positive and negative reviews
- Tri-gram is the most differentiated.
</small>  

<b>The models:</b>
<small>
- Logistic regression is the most suitable.
- Using Python package graphlab with split of train and test set of 3:7.
</small>

The Result
========================================================
type: exclaim

<b>Result:</b>
<small>
- Accuracy of about 94% achieved on the testing dataset. 
- Confusion Matrix (1 = positive sentiment)
- Apply to specific business and use intuitive observation to assess model.
- Successfully predict positve/negative sentiment based on textual reviews.
</small>  

<b>Confusion matrix:</b> 

|        |   | Predicted | label  |
|--------|---|-----------|--------|
|        |   |     0     |    1   |
| Target | 0 |    4871   |  9339  |
| label  | 1 |    6009   | 201198 |




Discussion
========================================================
type: exclaim

- Data used was only subset and cannot be applied for other in general
- Multifactor model can be developed to further predict star rating from text, not only sentiment.

