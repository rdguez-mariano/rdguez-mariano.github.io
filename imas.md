---
layout: default2
title: "Research"
header-img: "img/paris.jpg"
---

Covering the Space of Tilts
====================
*Journal*: [SIIMS](https://www.siam.org/journals/siims.php)

*Abstract*:
We propose a mathematical method to analyze the numerous algorithms performing Image Matching by Affine Simulation (IMAS). To become affine invariant they apply a discrete set of affine transforms to the images, previous to the comparison of all images by a Scale Invariant Image Matching (SIIM), like SIFT . Obviously this multiplication of images to be compared increases the image matching complexity. Three questions arise: a) what is the best set of affine transforms to apply to each image to gain full practical affine invariance? b) what is the lowest attainable complexity for the resulting method? c) how to choose the underlying SIIM method? We provide an explicit answer and a mathematical proof of quasi-optimality of the solution to the first question. As an answer to b) we find that the near-optimal complexity ratio between full affine matching and scale invariant matching is more than halved, compared to the current IMAS methods. This means that the number of key points necessary for affine matching can be halved, and that the matching complexity is divided by four for exactly the same performance. This also means that an affine invariant set of descriptors can be associated with any image. The price to pay for full affine invariance is that the cardinality of this set is around 6.4 times larger than for a SIIM.

<center><a href="https://hal.archives-ouvertes.fr/hal-01589522">See this article on HAL</a></center>



**Links to code and documentation will be soon available !**

#### Standalone IMAS
Standalone C++ code for IMAS (as in IPOL) implementing Fast-Affine-{SIFT, RootSIFT, HalfSIFT, SURF}

#### IMAS with OpenCV
C++ code for IMAS based on OpenCV 3.2 implementing Fast-Affine-{SIFT, RootSIFT, HalfSIFT, SURF, FREAK, LATCH, AKAZE, BRISK, ORB, BRIEF, LUCID, DAISY, AGAST}

#### IMAS on MATLAB
MATLAB code for IMAS. This will run through MEX based on both formers C++ implementations of IMAS.

#### Documentation
Here's a doxygen documentation for both C++ IMAS codes: Standalone and OpenCV.

#### Optimizing Coverings
C++ code for finding near optimal coverings based on radius (initial visibility) and the region to covered.

#### Near Optimal Coverings
Visualizing some of the near optimal coverings found in this work. The following links will be web pages from jupyter notebooks so it might take some time to load for slow connections.

#### Literature Coverings
Visualizing former coverings proposed in the literature. The following links will be web pages from jupyter notebooks so it might take some time to load for slow connections.

#### Applications
Soon you will find here some Applications of IMAS
