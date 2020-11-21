+++
title = "Answerability Classification Using Hand-Crafted Features"
date = "2020-04-20"
+++
# Answerability Classification Using Hand-Crafted Features
Competing with the members in my class on a challenge to predict whether a visual question is answerable. For this task, we were required to create a multi-modal (computer vision + natural language processing) classification system.

Microsoft Azure Vision API has been used to obtain the tags for each image. They have been joined together with space character in between to create artifical sentence. Then, the TF-IDF representation for these artificially generated sentences are created to be used as features. The TF-IDF representation for the questions have been created as features.

The two TF-IDF matrices are now stacked horizontally to create the unified feature set. We use this as the input dataset for our machine learning model. Random forest model has been used for this.

However, we see that the dataset is imbalanced. Thus, we try to resample the dataset so that the minority class has equal number of samples as the majority class. We do this by randomly copying the samples. Finally, with this resampled dataset, we once again run a random forest classifier. We see that the results improve.

Finally, we run Grid Search to find the best hyperparameter for the random forest model and test it on the validation set, which has not been resampled. We see that when the number of estimators is equal to 1000, random forest model performs the best with accuracy metric.