# Visual-SLAM with MATLAB – ME462 Robotic Vision Project

**Author**: Yuchen Xia  
**Date**: April 30, 2025  
**Course**: ME462 Robotic Vision

---

## 1. Introduction
Visual Simultaneous Localization and Mapping (visual-SLAM) is a technique that enables a moving camera to estimate its own trajectory and build a map of the surrounding environment using only visual input. It plays an essential role in fields such as robotics and autonomous navigation. This project is based on the official MATLAB example provided by MathWorks [1], which presents a modular vSLAM system including feature detection, pose estimation and map construction. To better understand the implementation, example code was studied first in detail and then extended it by using customized data. By recording a short video and extracting frames through MATLAB, vSLAM was applied with a customized image sequence. This report summarizes both the steps of the original implementation, and the modifications required to make it work with my own dataset.

---



## 2. Implement visual-SLAM example code 
This part summarizes MATLAB example code about Visual-SLAM. The process contains a series of steps, like image preprocessing, feature extraction and matching, pose estimation, map point triangulation, keyframe selection, bundle adjustment, loop closure detection, and visualization. Each step plays an important role in reconstructing the camera's 3D position and orientation. The following summarizes the main steps of how their Visual-SLAM is implemented.

###	Initialization and Image Loading 
-Prepare input image sequence and camera parameters for processing.

### Map Initialization
-Estimate the initial camera motion and triangulate the first 3D map points.

###	Store Key Frames and Map Points
-Save the initial key frames and map points into structured datasets.

###	Place Recognition Database Setup
-Create a visual vocabulary using bag-of-words for future loop detection.

###	Initial Map Refinement
-Apply bundle adjustment to optimize the initial reconstruction.

###	Tracking
-Track camera motion frame by frame and decide when to insert new key frames.

### Local Mapping
-Expand and refine the map by triangulating new points and adjusting nearby poses.

###	Loop Closure 
-Detect and correct drift by recognizing revisited places and updating the global map.

###	Evaluation with Ground Truth
-Compare the estimated trajectory with ground truth data to assess system accuracy.

## 2.2.1 Map initialization
<p align="center">
  <img src="figure/figure2.2.4.1-2" width="400">
</p>

## 2. Recording Real Data
- A 60-second indoor video was recorded with a smartphone (1920×1080 @ 30fps).
- MATLAB was used to extract every 5th frame, resulting in 906 images for the dataset.

## 3. Camera Calibration
- Calibration images of a checkerboard pattern were taken.
- MATLAB’s `estimateCameraParameters` function was used to obtain intrinsic parameters for the external webcam used.

##4. Adapting the Code
- Modified image loading to work with the custom image sequence
- Replaced the default camera intrinsics with the calibrated parameters
- Removed the ground truth section as no GT data was available
- Tuned parameters to improve tracking on real images

---








## 📷 Key Results

- ✅ Initial map points triangulated successfully
- ✅ ORB features tracked across frames
- ✅ Loop closure detected and triggered global optimization
- ✅ Final trajectory visualized with purple "optimized path"

> _Real-world challenges included camera shake, lighting variation, and ensuring enough texture in the environment for feature detection._

---

## 📈 Figures

<p align="center">
  <img src="figures/initial_map.png" width="400" title="Initial Map and Keyframes">
  <img src="figures/final_trajectory.png" width="400" title="Optimized Trajectory After Loop Closure">
</p>

---

## ✅ Conclusion

This project demonstrates how a visual-SLAM system can be adapted to real data using MATLAB. From recording to calibration and tracking, the pipeline was tested end-to-end. Although working with real-world images presents challenges like motion blur and lighting, the overall SLAM system performed well after parameter tuning and code adaptation. This hands-on process deepened my understanding of visual localization and 3D mapping in practical scenarios.

---

## 📚 Reference

[1] MathWorks. "Monocular Visual Simultaneous Localization and Mapping."  
*MATLAB Documentation*. https://www.mathworks.com/help/vision/ug/monocular-visual-simultaneous-localization-and-mapping.html

