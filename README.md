# 🧠 Brain Tumour Detection using Image Segmentation

This project detects **early-stage brain tumours** from MRI scans using **image preprocessing, thresholding, and mathematical morphological reconstruction** in MATLAB.  
The system enhances MRI images, segments suspicious regions, and highlights tumour areas with **bounding boxes** and **outlines**.

## ✨ Features
- **Pre-processing**: Noise removal using **Median Filtering**  
- **Segmentation**: Threshold-based binary mask + morphological operations  
- **Region Analysis**: Identifies tumour using solidity and area  
- **Bounding Box**: Draws a yellow rectangle around tumour  
- **Outline Overlay**: Marks tumour boundaries in red on original MRI  

## 📂 Project Structure
Brain_Tumour_Detection_Project/  
│── main.m          # Main MATLAB script  
│── README.md       # Project documentation    
└── sample.jpg      # Sample MRI brain image (provided)  

## 🚀 How to Run
1. Clone or download this repository.  
2. Use the provided **sample.jpg** or replace it with your own MRI brain image.  
3. Open MATLAB and run:  
   main  
4. The program will display:  
   - Input image  
   - Median filtered image  
   - Tumour segmentation  
   - Bounding box  
   - Tumour outline overlay  

## 🖼️ Sample Result
Input Image → Tumour Detection Output  

![Input MRI](sample.jpg)  
*(Sample brain MRI used in testing. Run `main.m` to see tumour segmentation and detection results.)*  

## 🛠️ Tools & Technologies
- MATLAB (R2016a or later)  
- Image Processing Toolbox  
- Median Filtering (for noise removal)  
- Mathematical Morphological Reconstruction  
- Thresholding-based Segmentation  
- Regionprops (Solidity & Area analysis)  
- Bounding Box Detection  
- Morphological Operations (fill, erosion, outline extraction)  
- Visualization with MATLAB plotting  

## 🔮 Future Work
- Integration of **PCA + SVM classifiers** for tumour classification  
- Use of **Convolutional Neural Networks (CNNs)** for deep learning-based detection  
- Improved **segmentation accuracy** using adaptive thresholding  
- Real-time processing for **clinical applications**  
- Extending dataset with multiple MRI modalities (T1, T2, FLAIR)  

## 📖 Reference
This work was developed as part of an **ECE Department Project**:  
*“Image Segmentation for Early Stage Brain Tumour Detection using Mathematical Morphological Reconstruction”*  


