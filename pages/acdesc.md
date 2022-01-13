---
layout: default
title: "research-papers"
header-img: "/img/paris.jpg"
nextpage: "/pages/sift-aid"
prevpage: "/pages/hyperdescriptors"
---

Affine invariant image comparison under repetitive structures
===================

*Full Title*: "Affine invariant image comparison under repetitive structures"

*Authors*: Mariano Rodríguez and Rafael Grompone von Gioi

*Conference*: [ICIP 18](https://2018.ieeeicip.org/)

*Abstract*:
We focus on the problem of affine invariant image comparison in the presence of
noise and repetitive structures. The classic scheme of keypoints, descriptors
and matcher is used. A local field of image gradient orientation is used as
descriptor and two matchers are proposed, based on the a-contrario theory, for
handling repetitive structures. The affine invariance is obtained by affine
simulations. The proposed methods achieve state-of-the-art performances under
repetitive structures.


<center><a href="http://dev.ipol.im/~rdguez-mariano/fixed_files/ac_desc.pdf">Read / Download this article</a> </center>

<center><a href="https://github.com/rdguez-mariano/fast_imas_IPOL"> Source code</a> <small>(on Github)</small></center>

<center><a href="https://github.com/rdguez-mariano/imas_analytics">Tester source code</a> <small>(on Github)</small></center>



### Estimating tilt tolerances
In order to estimate the tilt tolerance of AC-Q, AC-W, SIFT, and RootSIFT, under repetitive structures, a MATLAB function in our **Tester source code** was used. The github repository already comes with the image data base proposed in this paper. They are called upon by **"tolerance_test_ICIP.m"** .

Use the this [guide](/pages/acdesc_code) to reproduce our tests !
