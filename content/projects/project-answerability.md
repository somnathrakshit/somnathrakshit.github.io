+++
title = "Answerability Classification Using Hand-Crafted Features"
date = "2020-04-20"
+++
# Answerability Classification Using Hand-Crafted Features
In this project, I competed with the members in my class on a challenge to predict whether a visual question is answerable or not by using a given image and an associated question in the form of a text. For this task, we were required to create a multi-modal (computer vision + natural language processing) classification system.

First, Microsoft Azure Vision API was used to obtain the tags for each image. These tags were then joined together with spaces in between to create artifical sentences. Then, the TF-IDF representation for these artificially generated sentences were created to be used later as features. The TF-IDF representation for the questions were also created as features.

The two TF-IDF matrices were then stacked horizontally to create the unified feature set. We used this as the input dataset for our machine learning model, for which we selected random forest model using scikit-learn.

However, we saw that the dataset was quite imbalanced. Thus, we tried to resample the dataset so that the minority class had equal number of samples as the majority class. We did this by randomly copying the samples from the minority class. Finally, we ran the random forest classifier on both the balanced as well as the imbalanced dataset. We found that the results improved substantially.

Finally, we ran Grid Search to find the best hyperparameter for the random forest model and tested it on the validation set, which had not been resampled. We saw that when the number of estimators was equal to 1000, random forest model performed the best with respect to our testing metric, i.e. accuracy. This model was then submitted to run on the hidden test set. My model was then judged as the winner since it outperformed the models developed by all of my classmates. 
