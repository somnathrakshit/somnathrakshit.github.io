---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Relevance Prediction from Eye-movements Using Semi-interpretable Convolutional Neural Networks"
authors: ["Nilavra Bhattacharya", "admin", "Jacek Gwizdka", "Paul Kogut"]
date: 2019-12-10T16:16:12-06:00
doi: ""

# Schedule page publish date (NOT publication's date).
publishDate: 2019-12-10T16:16:12-06:00

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["1"]

# Publication name and optional abbreviated publication name.
publication: "Fifth ACM SIGIR Conference on Human Information Interaction and Retrieval"
publication_short: "CHIIR 2020"

abstract: "We propose an image-classification method to predict the perceived-relevance of text documents from eye-movements. We conduct an eye-tracking study where participants read short news articles, and rate them as relevant or irrelevant for answering a trigger question. We encode participants' eye-movement scanpaths as images, and use these images to train a convolutional neural network classifier. The classifier is then used to predict the perceived-relevance of news article from the scanpath images. This method is content-independent, and the classifier does not require knowledge of the screen-content, or the participant's information-task. Even with little data, the image classifier can predict perceived-relevance with up to 80% accuracy. When compared to similar eye-tracking studies from the literature, the scanpath image classifier outperforms previously reported metrics by appreciable margins. We also attempt to interpret how the image classifier differentiates between scanpaths on relevant and irrelevant documents."

# Summary. An optional shortened abstract.
summary: "We propose an image-classification method to predict the perceived-relevance of text documents from eye-movements. We conduct an eye-tracking study where participants read short news articles, and rate them as relevant or irrelevant for answering a trigger question. We encode participants' eye-movement scanpaths as images, and use these images to train a convolutional neural network classifier. The classifier is then used to predict the perceived-relevance of news article from the scanpath images. This method is content-independent, and the classifier does not require knowledge of the screen-content, or the participant's information-task. Even with little data, the image classifier can predict perceived-relevance with up to 80% accuracy. When compared to similar eye-tracking studies from the literature, the scanpath image classifier outperforms previously reported metrics by appreciable margins. We also attempt to interpret how the image classifier differentiates between scanpaths on relevant and irrelevant documents."

tags: ["computer vision", "deep learning"]
categories: []
featured: true

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_pdf:
url_code:
url_dataset:
url_poster:
url_project:
url_slides:
url_source:
url_video:

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "Class Activation Map showing the regions of interest as determined by our CNN"
  focal_point: ""
  preview_only: false

# Associated Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `internal-project` references `content/project/internal-project/index.md`.
#   Otherwise, set `projects: []`.
projects: []

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
slides: ""
---
