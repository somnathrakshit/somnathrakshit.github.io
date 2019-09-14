+++
title = "Deep Learning for Detection and Localization of Thoracic Diseases using Chest X-Ray Imagery"
date = 2019-03-16T01:59:10+02:00

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["admin", "Indrajit Saha", "Michal Wlasnowolski", "Ujjwal Maulik", "Dariusz Plewczynski"]

# Publication type.
# Legend:
# 0 = Uncategorized
# 1 = Conference paper
# 2 = Journal article
# 3 = Preprint / Working Paper
# 4 = Report
# 5 = Book
# 6 = Book section
# 7 = Thesis
# 8 = Patent
publication_types = ["1"]

# Publication name and optional abbreviated version.
publication = "The 18th International Conference on Artificial Intelligence and Soft Computing"
publication_short = "ICAISC"

# Abstract.
abstract = "Classification of diseases from biomedical images is a fast growing emerging field of research. In this regard, chest X-Rays (CXR) are one of the most widely used medical images to diagnose common heart and lung diseases where previous works have explored the usage of various pre-trained deep learning models to perform the classification. However, these models are very deep, thus use large number of parameters. Moreover, it is still not possible to find readily available access to a practicing radiologist for proper diagnosis from an X-Ray image of chest. Hence, this fact motivated us to conduct this research with the aim to classify CXR images in an automated manner with smaller number of parameters during training for 14 different categories of thoracic diseases and produce heatmap for the corresponding image in order to show the location of abnormality. For the purpose of classification, transfer learning is used with the pre-trained network of Resnet18, while the heatmaps are generated using pooling along the channel dimension and then computing the average of class-wise features. The proposed model contains less parameters to train and provides better performance than the other models present in the literature. The trained model is then validated both quantitatively and visually by producing localized images in the form of heatmaps of the CXR images. Moreover, the dataset and code of this work are provided online."

# Summary. An optional shortened abstract.
summary = "Classification of diseases from biomedical images is a fast growing emerging field of research. In this regard, chest X-Rays (CXR) are one of the most widely used medical images to diagnose common heart and lung diseases where previous works have explored the usage of various pre-trained deep learning models to perform the classification. However, these models are very deep, thus use large number of parameters. Moreover, it is still not possible to find readily available access to a practicing radiologist for proper diagnosis from an X-Ray image of chest. Hence, this fact motivated us to conduct this research with the aim to classify CXR images in an automated manner with smaller number of parameters during training for 14 different categories of thoracic diseases and produce heatmap for the corresponding image in order to show the location of abnormality. For the purpose of classification, transfer learning is used with the pre-trained network of Resnet18, while the heatmaps are generated using pooling along the channel dimension and then computing the average of class-wise features. The proposed model contains less parameters to train and provides better performance than the other models present in the literature. The trained model is then validated both quantitatively and visually by producing localized images in the form of heatmaps of the CXR images. Moreover, the dataset and code of this work are provided online."

# Digital Object Identifier (DOI)
doi = "10.1007/978-3-030-20915-5_25"

# Is this a featured publication? (true/false)
featured = true

# Tags (optional).
#   Set `tags = []` for no tags, or use the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["deep learning", "computer vision"]

# Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["deep-learning"]` references 
#   `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects = []

# Slides (optional).
#   Associate this page with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references 
#   `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides = ""

# Links (optional).
url_pdf = ""
url_code = "http://www.nitttrkol.ac.in/indrajit/projects/deeplearning-chestxray/"
url_dataset = "https://nihcc.app.box.com/v/ChestXray-NIHCC/folder/36938765345"
url_project = ""
url_slides = ""
url_video = ""
url_poster = ""
url_source = ""

# Custom links (optional).
#   Uncomment line below to enable. For multiple links, use the form `[{...}, {...}, {...}]`.
# links = [{name = "Custom Link", url = "http://example.org"}]

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
[image]
  # Caption (optional)
  caption = ""

  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  focal_point = ""
+++
