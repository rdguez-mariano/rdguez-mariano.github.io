---
layout: default2
title: "Research Paper"
header-img: "/img/paris.jpg"
prevpage: "/pages/acdesc"
---

AID : an affine invariant descriptor for SIFT
===================

*Full Title*: "SIFT-AID: boosting SIFT with an affine invariant descriptor based on convolutional neural networks"

*Authors*: Mariano Rodríguez, Gabrielle Facciolo, Rafael Grompone von Gioi, Pablo Musé, Jean-Michel Morel and Julie Delon

*Conference*: [ICIP 19](http://www.2019.ieeeicip.org/)

*Abstract*:
The classic approach to image matching consists in detection, description and matching of keypoints. The descriptor encodes the local information around the keypoint. A benefit of local approaches is that viewpoint deformations are well approximated by affine maps. This motivated the quest for affine invariant local descriptors. Despite numerous efforts such descriptors remained elusive, ultimately resulting in the compromise of using viewpoint simulations to achieve affine invariance. In this work we propose a fully affine invariant descriptor based on CNNs that does not rely on simulations. This is achieved by training a network to associate similar vectorial representations to patches related by affine transformations. During matching, these vectors are compared very efficiently. The invariance to translation, rotation and scale is still obtained by the first stages of SIFT, which produce the keypoints. The proposed descriptor outperforms the state-of-the-art in retaining affine invariant properties.


<!-- <center><a href="http://dev.ipol.im/~rdguez-mariano/fixed_files/ac_desc.pdf">Read / Download this article</a> </center> -->

<!-- <center><a href="https://github.com/rdguez-mariano/fast_imas_IPOL"> Source code</a> <small>(on Github)</small></center> -->

<!-- <center><a href="https://github.com/rdguez-mariano/imas_analytics">Tester source code</a> <small>(on Github)</small></center> -->
