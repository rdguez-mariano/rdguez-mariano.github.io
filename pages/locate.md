---
layout: default2
title: "Research Paper"
header-img: "/img/paris.jpg"
prevpage: "/pages/sift-aid"
---

Robust estimation of local affine maps
===================

*Full Title*: "Robust estimation of local affine maps and its applications to image matching"

*Authors*: Mariano Rodríguez, Gabrielle Facciolo, Rafael Grompone von Gioi, Pablo Musé and Julie Delon

*Conference*: [WACV 20](http://wacv20.wacv.net/)

*Abstract*:
The classic approach to image matching consists in the detection, description and matching of keypoints. This defines a zero-order approximation of the mapping between two images, determined by corresponding point coordinates. But the patches around keypoints typically contain more information, which may be exploited to obtain a first-order approximation of the mapping, incorporating local affine maps between corresponding keypoints. In this work, we propose a LOCal Affine Transform Estimator (LOCATE) method based on neural networks. We show that LOCATE drastically improves the accuracy of local geometry estimation by tracking inverse maps. A second contribution on guided matching and refinement is presented. The novelty here consists in the use of LOCATE to propose new SIFT-keypoint correspondences with precise locations, orientations and scales. Our experiments show that the precision gain provided by LOCATE does play an important role in applications such as guided matching. The third contribution of this paper consists in a modification to the RANSAC algorithm, that use LOCATE to improve the homography estimation between a pair of images. These approaches outperform RANSAC for different choices of image descriptors and image datasets, and permit to increase the probability of success in identifying image pairs in challenging matching databases.

<center><a href="https://hal.archives-ouvertes.fr/hal-02156259/file/main_hal.pdf">Read / Download this article</a></center>

<center><a href="https://github.com/rdguez-mariano/locate"> Source code</a> <small>(on Github)</small></center>
---
<center>More coming soon !!!</center>
