---
layout: default
title: "research-papers"
header-img: "/img/paris.jpg"
nextpage: "/pages/adimas"
prevpage: "/pages/sift-aid"
---

Robust estimation of local affine maps
===================

*Full Title*: "Robust estimation of local affine maps and its applications to image matching"

*Authors*: Mariano Rodríguez, Gabriele Facciolo, Rafael Grompone von Gioi, Pablo Musé and Julie Delon

*Conference*: [WACV 20](http://wacv20.wacv.net/)

*Abstract*:
The classic approach to image matching consists in the detection, description and matching of keypoints. This defines a zero-order approximation of the mapping between two images, determined by corresponding point coordinates. But the patches around keypoints typically contain more information, which may be exploited to obtain a first-order approximation of the mapping, incorporating local affine maps between corresponding keypoints. In this work, we propose a LOCal Affine Transform Estimator (LOCATE) method based on neural networks. We show that LOCATE drastically improves the accuracy of local geometry estimation by tracking inverse maps. A second contribution on guided matching and refinement is presented. The novelty here consists in the use of LOCATE to propose new SIFT-keypoint correspondences with precise locations, orientations and scales. Our experiments show that the precision gain provided by LOCATE does play an important role in applications such as guided matching. The third contribution of this paper consists in a modification to the RANSAC algorithm, that use LOCATE to improve the homography estimation between a pair of images. These approaches outperform RANSAC for different choices of image descriptors and image datasets, and permit to increase the probability of success in identifying image pairs in challenging matching databases.

<center><a href="https://hal.archives-ouvertes.fr/hal-02156259/file/main_hal.pdf">Read / Download this article</a></center>

<center><a href="https://github.com/rdguez-mariano/locate"> Source code</a> <small>(on Github)</small></center>

<p></p>

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/fHN3bw_gXkA?&start=1645&end=1829" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>


### Reconstruction from tangent planes

In this work we estimate local affine maps from a query image to a target image. Notice that these local affine maps are in fact the tangent planes of the corresponding global transformation from the query image to the target image.

Under reasonable assumptions, tangent planes can determine the global transformation. Indeed, even a simple affine reconstruction already provides a fair enough reconstruction. Let us check this fact for the simple case of an homography. For that, we first compute correspondences (with some matching method)

<center>
<img src="/img/locate/coca_teaser_matches.png" alt="reconstruction" width="90%">
</center>

and then compute the local affine maps with LOCATE around each of these correspondences. This affine information will allow us to transform query patches on the target image plane, which are approximations of the global transformation. Each pixel intensity is averaged with the information of all patches enclosing it.

<center>
<img src="/img/locate/coca_affineReconstruction.png" alt="reconstruction" width="90%">
</center>

Two main reasons cause the blur in the reconstructed image. They are:

- Some patches belong to higher order scales in the Gaussian pyramid. Therefore, they are already blurred by definition.
- Approximation errors incurred by different affine maps around a pixel will also lead to blurred reconstructions.

To reproduce this last experiment just modify the last part of the file 'py-tools/gen-Fig.1-WACV20.py', changing

```python
img1 = cv2.cvtColor(cv2.imread('./acc-test/adam.1.png'),cv2.COLOR_BGR2GRAY) # queryImage
img2 = cv2.cvtColor(cv2.imread('./acc-test/adam.2.png'),cv2.COLOR_BGR2GRAY) # queryImage

WriteTangentsInTarget(img1, img2)
```

to

```python
img1 = cv2.cvtColor(cv2.imread('./acc-test/coca.1.png'),cv2.COLOR_BGR2GRAY) # queryImage
img2 = cv2.cvtColor(cv2.imread('./acc-test/coca.2.png'),cv2.COLOR_BGR2GRAY) # queryImage

WriteTangentsInTarget(img1, img2, skipBlurryPatches=False)
```

and then execute it. The image above appears in file 'temp/affineReconstruction.png'.

### Guided matching

Yet another straight forward application of LOCATE is guided matching. For example, imagine that somehow the following two patches have been successfully matched by a local matching method.

<center>
<style>
table, th, td {
  border: 0px solid black;
  border-collapse: collapse;
}
</style>
<table style="width:100%">
  <tr>
    <td align="center">Query Patch</td>
    <td align="center">Target Patch</td>
  </tr>
  <tr>
    <td><img src="/img/locate/adam_p1init.png" alt="p1init" width="100%"></td>
    <td><img src="/img/locate/adam_p2init.png" alt="p2init" width="100%"></td>
  </tr>
</table>
</center>

Ideally, the above means that patch centers' coordinates correspond perfectly. However nothing could be say about their surroundings. LOCATE can provide an insight into how these surroundings are transformed. Now, let us continue our example. Yellow keypoints represent the aforementioned match. Four query keypoints (coloured in red, green, light blue and blue) are fixed by hand. These query keypoints are transformed into the target image by the approximating affine map provided by LOCATE; giving birth to four inferred keypoints in the target image. These four new keypoints in query and target patches can be considered as new tentative matches.

<center>
<style>
table, th, td {
  border: 0px solid black;
  border-collapse: collapse;
}
</style>
<table style="width:100%">
  <tr>
    <td align="center" style="width:50%;">Fixed query keypoints</td>
    <td align="center" style="width:50%;">LOCATE inferred target keypoints</td>
  </tr>
  <tr>
    <td style="width:50%;"><img src="/img/locate/adam_p1.png" alt="p1init" width="100%"></td>
    <td style="width:50%;"><img src="/img/locate/adam_p2.png" alt="p2init" width="100%"></td>
  </tr>
</table>
</center>


Let us see how these corresponding keypoints between patches are translated into image coordinates.

<center>
<style>
table, th, td {
  border: 0px solid black;
  border-collapse: collapse;
}
</style>
<table style="width:100%">
  <tr>
    <td align="center" style="width:50%;">Keypoints in the query image</td>
  </tr>
  <tr>
    <td style="width:50%;"><img src="/img/locate/adam_im1.png" alt="p1init" width="100%"></td>    
  </tr>
  <tr>
  <td align="center" style="width:50%;">Keypoints in the target image</td>
  </tr>
  <tr>
    <td style="width:50%;"><img src="/img/locate/adam_im2.png" alt="p2init" width="100%"></td>
  </tr>
</table>
</center>

We have just established a simple guided matching procedure without any verification on new tentative matches. This last experiment can be reproduced just by executing 'py-tools/gen-Fig.1-WACV20.py' and the resulting images will appear in folders `temp/im1, temp/im2, temp/p1, temp/p2`. Notice that these folders need to be created beforehand.
