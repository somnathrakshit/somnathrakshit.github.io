+++
title = "A statistical approach to predict flight delay using gradient boosted decision tree"
date = 2017-06-02T01:18:50+05:30
draft = true
authors = ["admin"]

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["machine learning"]

# Project summary to display on homepage.
summary = "Prediction of flight delay in US sector using gradient boosted decision trees"

# Optional image to display on homepage.
image_preview = "avg_arr_delay_week.png"

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = false

# Does the project detail page use source code highlighting?
highlight = true

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.

[header]
image = "projects/avg_arr_delay_week.png"
caption = ""

+++
Supervised machine learning algorithms have been used extensively in different domains of machine learning like pattern recognition, data mining and machine translation. Similarly, there has been several attempts to apply the various supervised or unsupervised machine learning algorithms to the analysis of air traffic data. However, no attempts have been made to apply Gradient Boosted Decision Tree, one of the famous machine learning tools to analyse those air traffic data. This paper investigates the effectiveness of this successful paradigm in the air traffic delay prediction tasks. By combining this regression model based on the machine learning paradigm, an accurate and sturdy prediction model has been built which enables an elaborated analysis of the patterns in air traffic delays. Gradient Boosted Decision Tree has shown a great accuracy in modeling sequential data. With the help of this model, day-to-day sequences of the departure and arrival flight delays of an individual airport can be predicted efficiently. In this paper, the model has been implemented on the Passenger Flight on-time Performance data taken from U.S. Department of Transportation to predict the arrival and departure delays in flights. It shows better accuracy as compared to other methods.

Here are some of the insights obtained.

<center>
![Average Arrival Delay on diffrent days of week](/img/projects/avg_arr_delay_week.png)
</center>

<center>
![Average Departure Delay on diffrent days of week](/img/projects/avg_dep_delay_week.png)
</center>

<center>
![Correlation between Departure Delay and Arrival Delay](/img/projects/correlation_dep_arr_delay.png)
</center>