+++
title = "Detection and Localisation of Diabetic Retinopathy"
date = 2018-05-15T01:21:26+05:30
draft = true 
authors = ["admin"]

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["deep learning", "computer vision"]

# Project summary to display on homepage.
summary = "Automated classification and localization of diabetic retinopathy was performed using Keras in fundus images. This work demonstrates that it is possible to obtain performance comparable to the state of the art performance in this task using a deep learning model with much less parameters."

# Optional image to display on homepage.
image_preview = "dr1.jpeg"

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = false

# Does the project detail page use source code highlighting?
highlight = false

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = "projects/dr1.jpeg"
caption = "Result obtained after performing localization on a fundus image"
+++
[Slides](https://docs.google.com/presentation/d/e/2PACX-1vQpi7z7g1swVv-bcG2GeYggnhCjL1zXOq3BJYMXnqGtJC6pVg7Iq7qr-4bODfVGEcngX9PGiuJ5P8Qs/pub?start=false&loop=false&delayms=15000), [Report](/files/download/project_report_jgec.pdf)

Diabetic retinopathy occurs when the retina is damaged because fluids leak from blood vessels into the retina. The presence of hemorrhage is one of the earliest signs to indicate the severity of the disease. In this paper we review techniques, algorithms and methodologies used for the detection of hemorrhage from diabetic retinopathy retinal images. The retina is a transparent layer of vascularized neural tissue lining the inner layer of the back wall of the eye, between the retinal pigment epithelium on the outer and the vitreous on the inner side. The retina captures photons and converts these two photochemical and electrical energy integrates the Signals and transmits the resultant signal to the visual cortex of the brain via the optic nerve tracts and radiations. The retinal architecture is lamellar. Within this there are major types performing sensory nutritional regulatory immunomodulatory and structure and functions. The retina is uniquely partitioned from the vascular system by the blood retinal barrier and blood aqueous barrier. The blood supply is dual to the inner retina it is by the retinal circulation lying within the in a retina and to the outer retina it is by the choroidal circulation, Hrithik vascular layer lying outside of the retinal pigment epithelium. The retinal pigment epithelium and the choroid are critical to retinal function. Is the eye is imagined to be a camera in the retina is the film. Just like a picture cannot be developed if the camera has defective film, vision is not possible in an eye with a defective retina.

If caught early then diabetic retinopathy can be treated, otherwise it can lead to irreversible blindness. Unluckily, medical specialists capable of detecting the disease are not available in many parts of the world where diabetes is prevalent. Deep neural networks have helped in solving many such problems in the recent past. Medical image classification has been done accurately using deep neural networks and thus, we will be using this in our project. The aim of this project is to use deep learning to help doctors identify the patients in need, particularly among underserved populations. 

Prolonged diabetes leads to DR, where the retina is damaged due to fluid leaking from the blood vessels. Usually, the stage of DR is judged based on blood vessels, exudes, hemorrhages, microaneurysms and texture. In this paper, we have discussed different methods for features extraction and automatic DR stage detection. An ophthalmologist uses an ophthalmoscope to visualize the blood vessels and his or her brain to detect the DR stages. Recently digital imaging became available as a tool for DR screening. It provides high quality permanent records of the retinal appearance, which can be used for monitoring of progression or response to treatment, and which can be reviewed by an ophthalmologist, digital images have the potential to be processed by automatic analysis systems. A combination of both accurate and early diagnosis as well as correct application of treatment can prevent blindness caused by DR in more than 50% of all cases. Therefore, regular screenings for DR of patients with diabetes is important. The grading of the resultant fundus images is an important cost factor. Automated DR detection can reduce the grading cost and thereby make the whole screening process less expensive. Some of the algorithms and systems reviewed in this paper are close to achieve DR identification in clinical practice.