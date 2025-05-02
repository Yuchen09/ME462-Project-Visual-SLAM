# Visual-SLAM with MATLAB – ME462 Robotic Vision Project

**Author**: Yuchen Xia  
**Date**: April 30, 2025  
**Course**: ME462 Robotic Vision

---

## 📌 Overview

This project implements a **monocular visual-SLAM (vSLAM)** system in MATLAB, based on the official MathWorks example:  
📖 [Monocular Visual Simultaneous Localization and Mapping](https://www.mathworks.com/help/vision/ug/monocular-visual-simultaneous-localization-and-mapping.html)

The system estimates camera trajectory and reconstructs a 3D map using only image input. To explore SLAM in a more realistic setting, I recorded my own video, extracted frames using MATLAB, calibrated the camera, and adapted the example code to run the vSLAM pipeline on real-world data.

---

## 🔧 Project Steps

### 1. Understanding the Example
The original MATLAB vSLAM example was studied in detail. It consists of:
- Image loading & camera parameter initialization
- Feature extraction and matching (ORB)
- Pose estimation using PnP
- 3D point triangulation and map building
- Keyframe insertion and local bundle adjustment
- Loop closure using bag-of-words
- Global pose graph optimization
- Visualization and optional comparison with ground truth

### 2. Recording Real Data
- A 60-second indoor video was recorded with a smartphone (1920×1080 @ 30fps).
- MATLAB was used to extract every 5th frame, resulting in 906 images for the dataset.

### 3. Camera Calibration
- Calibration images of a checkerboard pattern were taken.
- MATLAB’s `estimateCameraParameters` function was used to obtain intrinsic parameters for the external webcam used.

### 4. Adapting the Code
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

