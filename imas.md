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



#### Finding near optimal coverings (C++ code)
C++ code for finding near optimal coverings based on radius (initial visibility) and the region to cover.
<center><a href="data/imas/opt_covering.zip">opt_covering.zip</a></center>
This code doesn't have any documentation available but there exist a pseudo-code that has been published in IPOL [(See its web page)](/hyperdescriptors). Executing the program is very simple, the syntax is:
```
r=1.6           # radius of disks
region=4.5      # region to be covered
N=2             # number of groups of concentric disks

epsilon         # Parameter for discretising annulus.
                # Used to check for covering conditions

./opt_covering $r $region $epsilon $N
```

Extract first and then compile in linux with :
```
mkdir -p build && cd build && cmake .. && make
```

#### Visualising non optimal and near optimal coverings (Matlab code)
Here you will find former coverings proposed in the literature and some of the near optimal coverings found in this work. All those coverings can be visualised in matlab with the following matlab functions and script: <center><a href="data/imas/ploting_coverings.zip">ploting_coverings.zip</a></center>

 Modify (if needed) and execute the script **"coverings2file_auto.m"** to visually generate coverings in 2D and 3D.  Those visualising functions are very demanding in terms of memory (Sorry about that !). You might want to disable 3D visualisation by modifying the script.

 The reader will also notice that the variables "covering" and "filename" in the script are used to control which coverings will be printed from "get_feasible_covering.m" and "get_literature_covering.m".
