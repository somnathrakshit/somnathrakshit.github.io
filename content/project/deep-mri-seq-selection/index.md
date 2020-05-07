---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Sequence parameter selection for MRI parameter mapping"
summary: "Our problem statement is to determine if an optimal RF pulse sequence exists for creating good MRI contrast on decoding through end-to-end optimization. In other words, We aim to find an optimal RF pulse sequence based on combined optimization of the sequence and certain brain tissue parameters."
authors: ["admin", "Geetali Tyagi", "Jon Tamir"]
tags: ["deep learning"]
categories: []
date: 2020-05-07T16:33:09-05:00
draft: true 
math: true 

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
url_slides: "https://docs.google.com/presentation/d/e/2PACX-1vS3XEehwaPw9PC1_Kg_sjcbtjBjNqlFYz5cIN_njwa8hjRddScdBD9g9wrdG-hd6ku4FpQOQyz0fbb6/pub?start=true&loop=false&delayms=30000"
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---
> Can an optimal RF pulse sequence be determined for creating good MRI contrast on decoding through end-to-end optimization?

{{< figure src="simulation.png" title="When the RF pulses are discretized, spin simulation using the Bloch equations reduces to successive applications of rotation followed by relaxation to the magnetization vector $M$. An alternative to the Bloch equations is the extended phase graph (EPG) formalism, which simulates the signal evolution of a distribution of spins across a voxel. EPG efficiently keeps track of  signal evolutions across multiple resonant frequencies using the Fourier series" numbered="true" lightbox="true" >}}
To explain the problem further, we’ll try to give more insight into its background.
In MRI or magnetic Resonance Imaging, a net magnetization vector over all portions or voxels of the brain is used as seen in this first image where the magnetized vector is aligned perfectly with the $Z$ dimension. When RF pulses act on this vector, it rotates from the main direction $Z$ and toward the transverse plane which here is $XY$ as shown. This vector tries to recover to its original state. The strength and duration of a RF pulse determine the degree of rotation, or flip angle symbolised by $\theta$. 
This rotation is also dependent on intrinsic brain tissue parameters. For this project we limit our scope to parameters $T_1$ and $T_2$ which are  time constants with which the main or $Z$ magnetization exponentially recovers while transverse or $XY$ magnetization decays.

{{< figure src="Bloch_Toilet.png" title="Signal relaxation visualized through the toilet analogy. The water in the tank represents longitudinal magnetization, water in the bowl represents transverse magnetization, and the toilet flush is an RF excitation. When the toilet is flushed (excitation), water transfers from the tank to the bowl, producing a detectable signal. As the toilet bowl drains ($T_2$ relaxation), the tank refills with water ($T_1$ recovery). Successive flushes will transfer new water from the tank to the bowl." numbered="true" lightbox="true" >}}
This relaxation of $T_1$ and $T_2$ can also be visualized with a toilet analogy. Consider the water in the tank represents magnetization along $Z$, the water in the bowl represents transverse magnetization along $XY$ plane, and the toilet flush is an RF pulse. When the toilet is flushed or a pulse is applied, water transfers from the tank to the bowl, producing a detectable MRI signal. Then the toilet bowl drains corresponding to $T_2$ relaxation while the tank refills with water which corresponds to $T_1$ recovery. 

In the past, the equations in MRI encoding and decoding were limited to empirically defined models. The clear geometry in these simplified computation, but they fail to represent the parameter space of pulse sequences and interactions within it. Such interactions could be used to develop novel contrast mechanisms. This is where deep learning can step up by utilizing its ability to learn non-linear interactions between multi-dimensional inputs.

For training, we used a collection of $T_1$, $T_2$ value pairs from actual brain tissue voxels. To compute the MRI signals, we used a MRI simulator provided by our mentor which takes the flip angle $\theta$ sequence and $T_1$ and $T_2$ values as input and outputs the MRI signal.

Image credits: *J. I. Tamir, F. Ong, S. Anand, E. Karasan, K. Wang and M. Lustig, "Computational MRI With Physics-Based Constraints: Application to Multicontrast and Quantitative Imaging," in IEEE Signal Processing Magazine*