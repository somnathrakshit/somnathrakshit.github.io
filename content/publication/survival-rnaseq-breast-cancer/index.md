---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Survival Analysis with the Integration of RNA-Seq and Clinical Data to Identify Breast Cancer Subtype Specific Genes"
authors: ["Indrajit Saha", "admin", "Michal Denkiewicz", "Jnanendra Prasad Sarkar", "Debasree Maity", "Ujjwal Maulik", "Dariusz Plewczynski"]
date: 2019-11-27T00:02:32-06:00
doi: "https://doi.org/10.1007/978-3-030-34872-4_16"

# Schedule page publish date (NOT publication's date).
publishDate: 2019-11-27T00:02:32-06:00

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["1"]

# Publication name and optional abbreviated publication name.
publication: "8th International Conference on Pattern Recognition and Machine Intelligence 2019"
publication_short: "PReMI 2019"

abstract: "Breast cancer is one of the most widespread forms of cancer that affects a significant portion of the female population today. Its early detection and subsequent treatment can be life saving. However, it is difficult clinically and computationally to detect breast cancer and its subtypes in their early stages. On the other hand, Next Generation Sequencing (NGS) techniques have significantly accelerated the process of mapping the human genomes by providing high-throughput expression data of RNA. In this work, we study such NGS based expression data of mRNAs with the clinical data in order to (a) rank the genes based on their importance in survival of breast cancer subtypes and (b) find the relation between the up/down regulation of genes and survival probability of a population. In this regard, first volcano plot is used to find the differentially expressed genes for each subtype, and second, such genes are used to perform the Kaplan-Meier survival analysis with the integration of mRNA expression and clinical data to rank the genes by their importance in survival of breast cancer subtypes. These genes are ranked based on the p-value and significant genes are filtered out by considering the cut-off as p-value <0.05 for each breast cancer subtype. In our analysis, we have found a relation between gene regulation and survival probability, e.g. up and down regulated genes of a population show low rate of survival of that population. Moreover, for the biological significance, PPI network and KEGG Pathway analysis are conducted on a common set of genes that are present in all subtypes. The datasets, code and supplementary materials of this work are provided online (http://www.nitttrkol.ac.in/indrajit/projects/mrna-survival-breastcancer-subtypes/)."

# Summary. An optional shortened abstract.
summary: ""

tags: ["computational biology"]
categories: []
featured: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_pdf:
url_code: 
url_dataset: http://www.nitttrkol.ac.in/indrajit/projects/mrna-survival-breastcancer-subtypes/
url_poster:
url_project: http://www.nitttrkol.ac.in/indrajit/projects/mrna-survival-breastcancer-subtypes/
url_slides:
url_source:
url_video:

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
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
