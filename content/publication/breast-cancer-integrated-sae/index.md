+++
title = "Deep Learning for Integrated Analysis of Breast Cancer Subtype Specific Multi-omics Data"
date = 2018-10-31T01:23:15+02:00

# Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
authors = ["admin", "Subha Shankar Chakraborty", "Indrajit Saha", "Dariusz Plewczynski"]


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
publication = "IEEE TENCON"
publication_short = "IEEE TENCON"

# Abstract.
abstract = "Breast cancer is a deadly disease which commonly occurs all over the world and has been found to be the largest cause of cancer in females. Its detection is still a major challenge, both from a computational as well as from a biological point of view. Next Generation Sequencing (NGS) techniques have accelerated the mapping of human genomes rapidly. Involvement of advanced NGS techniques reveal that multiple genetic components are responsible for the cause of breast cancer and its subtypes. However, the high volume of data that is produced by the NGS techniques are difficult to study because of their high dimensionality and complexity. Thus, the integrated study of multi-omics data is one of the major challenges in medical science. This fact motivated us to study the NGS based high throughput expression data of miRNAs and mRNAs as well as Beta values of DNA methylation of the corresponding mRNAs. In this regard, first, these datasets, together consisting of 33564 features of 305 patients in five classes viz. Luminal A, Luminal B, HER2-enriched, Basal-like and Control, are analysed in an integrated fashion using deep learning technique to classify the breast cancer subtypes properly. Second, the results of the deep learning technique are further analysed in order to identify the deeply connected features, i.e. either miRNA or mRNA or DNA Methylation, which are pivotal in the classification of breast cancer subtypes as well as play a crucial role in the formation of breast cancer. For this purpose, a deep learning technique, called stacked autoencoder is used to transform the features into a low dimensional space, which is then fed to the five well known classifiers for classification. Moreover, the same transformed data is used to select the potential features after performing multiplication with the original data and Bonferroni correction on the p-values produced by the one-sample t-test. The results have been validated quantitatively and through biological significance analysis. During the biological analysis, it is observed that TP53 and BRCA1 have been found, which is known to play a crucial role in breast cancer formation."

# Summary. An optional shortened abstract.
summary = "In this work, it is seen that deep learning technique such as stacked autoencoder can be useful in reducing the dimension of a high dimensional multi-omics data. The performance obtained using this architecture is better than the other methods as shown here. Besides, some genes are identified which are in the pathways of breast cancer, as determined by the deep selection of features and the Bonferroni correction of p-values of the result of the one-sample t-test."

# Digital Object Identifier (DOI)
doi = "10.1109/TENCON.2018.8650144"

# Is this a featured publication? (true/false)
featured = false

# Tags (optional).
#   Set `tags = []` for no tags, or use the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["deep learning", "computational biology"]

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
url_code = "http://www.nitttrkol.ac.in/indrajit/projects/integrated-analysis-breastcancer-subtypes/"
url_dataset = "http://www.nitttrkol.ac.in/indrajit/projects/integrated-analysis-breastcancer-subtypes/"
url_project = ""
url_slides = "files/download/breast_cancer_sae_slides.pdf"
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
