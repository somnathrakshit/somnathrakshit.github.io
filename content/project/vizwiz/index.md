---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Answerability Classification Using Hand-Crafted Features"
summary: "Competing with the members in your class on a challenge to predict whether a visual question is answerable. For this task, we were required to create a multi-modal (computer vision + natural language processing) classification system."
authors: ["Somnath Rakshit"]
tags: ["machine learning", "computer vision", "natural language processing"]
categories: []
date: 2020-04-05T03:13:05-05:00

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---
Competing with the members in your class on a challenge to predict whether a visual question is answerable. For this task, we were required to create a multi-modal (computer vision + natural language processing) classification system. 

Microsoft Azure Vision API has been used to obtain the tags for each image. They have been joined together with space character in between to create artifical sentence. Then, the TF-IDF representation for these artificially generated sentences are created to be used as features. The TF-IDF representation for the questions have been created as features.

The two TF-IDF matrices are now stacked horizontally to create the unified feature set. We use this as the input dataset for our machine learning model. Random forest model has been used for this.

However, we see that the dataset is imbalanced. Thus, we try to resample the dataset so that the minority class has equal number of samples as the majority class. We do this by randomly copying the samples. Finally, with this resampled dataset, we once again run a random forest classifier. We see that the results improve.

Finally, we run Grid Search to find the best hyperparameter for the random forest model and test it on the validation set, which has not been resampled. We see that when the number of estimators is equal to 1000, random forest model performs the best with accuracy metric.