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
│── Report.pdf      # Detailed project report (to be added)  
└── c.jpg           # Input MRI image (user-provided)  

## 🚀 How to Run
1. Clone or download this repository.  
2. Place an MRI brain image in the folder and rename it as **c.jpg**  
   (or update the filename inside main.m).  
3. Open MATLAB and run:  
   main  
4. The program will display:  
   - Input image  
   - Median filtered image  
   - Tumour segmentation  
   - Bounding box  
   - Tumour outline overlay  

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
- Improved **segmentation accuracy** using adaptive thresholding  
- Real-time processing for **clinical applications**  

## 📖 Reference
This work was developed as part of an **ECE Department Project**:  
*“Image Segmentation for Early Stage Brain Tumour Detection using Mathematical Morphological Reconstruction”*  


