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

<!-- *Conference*: [ICIP 19](http://www.2019.ieeeicip.org/) -->

*Abstract*:
The classic approach to image matching consists in the detection, description and matching of keypoints. The descriptor encodes the local information around the keypoint. An advantage of local approaches is that viewpoint deformations are well approximated by affine maps. This motivated the quest for affine invariant local descriptors. Despite numerous efforts, such descriptors remained elusive, ultimately resulting in the compromise of using viewpoint simulations to attain affine invariance. In this work we propose a CNN-based patch descriptor which captures affine invariance without the need for viewpoint simulations. This is achieved by training a neural network to associate similar vectorial representations to patches related by affine transformations. During matching, these vectors are compared very efficiently. The invariance to translation, rotation and scale is still obtained by the first stages of SIFT, which produce the keypoints. The proposed descriptor outperforms the state-of-the-art in retaining affine invariant properties.

<center><a href="https://hal.archives-ouvertes.fr/hal-02016010v1">Read / Download this article</a> <small>(on HAL)</small></center>

<!-- <center><a href="http://dev.ipol.im/~rdguez-mariano/fixed_files/ac_desc.pdf">Read / Download this article</a> </center> -->

<center><a href="https://github.com/rdguez-mariano/sift-aid"> Source code</a> <small>(on Github)</small></center>

### Highlights on Notredame

<center>
Optimal Affine-RootSIFT
<div > <img src="/img/sift-aid/notredame-ARootSIFT.png" alt="Affine-RootSIFT" width="80%"></div>

SIFT-AID
<div > <img src="/img/sift-aid/notredame-SIFT-AID.png" alt="SIFT-AID" width="80%"></div>
</center>


### Testing AID

In order to reproduce or to further test AID descriptors we suggest to follow all the instruction appearing in [SIFT-AID's github repository](https://github.com/rdguez-mariano/sift-aid).

#### Density estimations
```bash
python py-tools/gen-ICIP19-HistoThresholds.py
```

Positive and negative density estimation on measurements. For that, 60000 random intra and extra class pairs were used. The vertical line depicts the threshold minimizing both error probabilities: false negatives and false positives.

<center>
<style>
table, th, td {
  border: 0px solid black;
  border-collapse: collapse;
}
</style>
<table style="width:100%">
  <tr>
    <td align="center">RootSIFT L2 Norm</td>
    <td align="center">AID Sign Alignments</td>
  </tr>
  <tr>
    <td><img src="/img/sift-aid/Histo_RootSIFT.png" alt="Histo_RootSIFT" width="100%"></td>
    <td><img src="/img/sift-aid/Histo_SignAlignment.png" alt="Histo_SignAlignment" width="100%"></td>
  </tr>
</table>
</center>

#### Testing on true matches from Affine-RootSIFT

Lets investigate if those matches seen by Affine-RootSIFT and not seen by SIFT-AID are really AID's fault. For that, the following test bypasses the first stages of SIFT and manually selects precise SIFT keypoints in gaussian pyramids from the query and target images. These precise keypoints are the best possible choices that could have been found by the first stages of SIFT.

Modify the following lines in *launch-ICIP19-test.py*

```python
test_OnFiltered_ARootSIFT = True
test_timePerformances = False
```

and execute

```bash
python py-tools/launch-ICIP19-test.py
```
Command output:
```
./acc-test/coca
   AID score on SIFT Keypoints created from ASIFT Keypoints 100%, if applied only on true matches this should hold 1113=1113
./acc-test/notredame
   AID score on SIFT Keypoints created from ASIFT Keypoints  92%, if applied only on true matches this should hold 24=24
./acc-test/arc
   AID score on SIFT Keypoints created from ASIFT Keypoints  97%, if applied only on true matches this should hold 189=189
./acc-test/graf
   AID score on SIFT Keypoints created from ASIFT Keypoints  81%, if applied only on true matches this should hold 107=107
./acc-test/adam
   AID score on SIFT Keypoints created from ASIFT Keypoints 100%, if applied only on true matches this should hold 191=191
Overall AID score ( 98%): 1624 Matched, 34 Missed
```

This  experiment  reveals that AID would have been sufficient to identify almost all Affine-RootSIFT matches, provided that proper keypoints had been correctly spotted by the first stages of SIFT.

Let's now dig deeper on those missed matches. The following figure plots missed and retrieved matches with respect to zoom and viewpoint angle differences between patches. Those quantities were computed by the means of local affine approximations (First order Taylor development) of ground truth homographies.

<center>
<div > <img src="/img/sift-aid/SeenByAID.png" alt="SeenByAID" width="80%"></div>
</center>

Notice that most of the missing matches for  AID  descriptors  involve  viewpoint  angles  close  to 75 degrees (the maximal viewpoint angle present in the training dataset). They come from the graffiti pair.

#### Testing on all keypoints from Affine-RootSIFT

This test appears in our paper as Test II in Table 1. It can be obtained with a simple hack, simply modify csv files in *acc-tests* folder in the following way:
- Download and compile [Fast image matching by affine simulations](https://github.com/rdguez-mariano/fast_imas_IPOL).
- Execute the command below and the output csv files should override csv files in the *acc-tests* folder.

```bash
./main -im1 img1.png -im2 img2.png -desc 11 -match_ratio 1 -applyfilter 0
```

This test also says that not only we could have seen most Affine-RootSIFT matches but also many more (provided that better keypoints were computed).

#### SIFT-AID performances

This test gives information on the number of matches in consensus with an homography (corresponding to Test I in Table 1 of our paper) and elapsed time in computing descriptors and matching them (corresponding to Table 2 of our paper).

Modify the following lines in *launch-ICIP19-test.py*

```python
test_OnFiltered_ARootSIFT = False
test_timePerformances = True
```

and execute

```bash
python py-tools/launch-ICIP19-test.py
```

If you want to compare reconstruct results of Affine-RootSIFT download and compile [Fast image matching by affine simulations](https://github.com/rdguez-mariano/fast_imas_IPOL). Then move the `main` executable to `acc-test/z_main` and uncomment the following lines in *launch-ICIP19-test.py*.

```python
method = 'Optimal Affine-RootSIFT'
total, good_HC, ET_KP, ET_M, KPs1, KPs2, simus = IMAScaller(img1,img2, desc = 11)
full_info += (good_HC,total,ET_KP,ET_M)
print(method+" --> HC = %d, TM = %d, ET_KP = %3.3f, ET_M = %3.3f" %(good_HC,total,ET_KP,ET_M))
```

**Remark:** HC stands for Homography consistent Matches, TM - Total Matches, ET_KP - Elapsed Time in KeyPoint computation and ET_M - Elapsed Time in Matching.
