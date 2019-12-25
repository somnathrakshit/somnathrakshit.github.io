---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Relevance Prediction from Eye-movements Using Semi-interpretable Convolutional Neural Networks"
subtitle: ""
summary: "We propose an image-classification method to predict the perceived-relevance of text documents from eye-movements. We conduct an eye-tracking study where participants read short news articles, and rate them as relevant or irrelevant for answering a trigger question. We encode participants' eye-movement scanpaths as images, and use these images to train a convolutional neural network classifier. The classifier is then used to predict the perceived-relevance of news article from the scanpath images. This method is content-independent, and the classifier does not require knowledge of the screen-content, or the participant's information-task. Even with little data, the image classifier can predict perceived-relevance with up to 80% accuracy. When compared to similar eye-tracking studies from the literature, the scanpath image classifier outperforms previously reported metrics by appreciable margins. We also attempt to interpret how the image classifier differentiates between scanpaths on relevant and irrelevant documents."
authors: ["Nilavra Bhattacharya", "admin", "Jacek Gwizdka"]
tags: ["computer vision", "deep learning"]
categories: []
date: 2019-12-24T18:41:08-06:00
lastmod: 2019-12-24T18:41:08-06:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---
We propose an image-classification method to predict the perceived-relevance of text documents from eye-movements. We conduct an eye-tracking study where participants read short news articles, and rate them as relevant or irrelevant for answering a trigger question. We encode participants' eye-movement scanpaths as images, and use these images to train a convolutional neural network classifier. The classifier is then used to predict the perceived-relevance of news article from the scanpath images. This method is content-independent, and the classifier does not require knowledge of the screen-content, or the participant's information-task. Even with little data, the image classifier can predict perceived-relevance with up to 80% accuracy. When compared to similar eye-tracking studies from the literature, the scanpath image classifier outperforms previously reported metrics by appreciable margins. We also attempt to interpret how the image classifier differentiates between scanpaths on relevant and irrelevant documents.