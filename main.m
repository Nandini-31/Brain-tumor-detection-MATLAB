clc;
close all;
clear all;

% ================================
% Brain Tumour Detection Project
% ================================

% Step 1: Read Input Image
s = imread('c.jpg');   % Change 'c.jpg' to your MRI image filename
figure;
imshow(s);
title('Input Image','FontSize',20);

% Step 2: Preprocessing (Anisotropic Diffusion Filter)
num_iter = 10;
delta_t = 1/7;
kappa = 15;
option = 2;

disp('Preprocessing image please wait . . .');
inp = anisodiff(s, num_iter, delta_t, kappa, option);
disp('Removing noise... Filtering Completed !!');

inp = uint8(inp);
inp = imresize(inp, [256, 256]);

% Convert to grayscale if RGB
if size(inp,3) > 1
    inp = rgb2gray(inp);
end

figure;
imshow(inp);
title('Filtered Image','FontSize',20);

% Step 3: Thresholding for Tumour Segmentation
sout = imresize(inp, [256, 256]);
t0 = 60;
th = t0 + ((max(inp(:)) + min(inp(:))) / 2);

for i = 1:size(inp,1)
    for j = 1:size(inp,2)
        if inp(i,j) > th
            sout(i,j) = 1;
        else
            sout(i,j) = 0;
        end
    end
end

% Step 4: Region Labelling & Properties
label = bwlabel(sout);
stats = regionprops(logical(sout),'Solidity','Area','BoundingBox');

density = [stats.Solidity];
area = [stats.Area];

high_dense_area = density > 0.6;
max_area = max(area(high_dense_area));
tumor_label = find(area == max_area);
tumor = ismember(label, tumor_label);

% Step 5: Show Tumour Region
if max_area > 100
    figure;
    imshow(tumor);
    title('Tumor Alone','FontSize',20);
else
    msgbox('No Tumor Detected !!','Status');
    return;
end

% Step 6: Bounding Box
box = stats(tumor_label);
wantedBox = box.BoundingBox;

figure;
imshow(inp);
title('Bounding Box','FontSize',20);
hold on;
rectangle('Position', wantedBox, 'EdgeColor','y');
hold off;

% Step 7: Morphological Processing
filledImage = imfill(tumor, 'holes');
dilationAmount = 5;
rad = floor(dilationAmount);
[r,c] = size(tumor);
erodedImage = false(r,c);

for i = 1:r
    for j = 1:c
        x1 = max(1, i-rad);
        x2 = min(r, i+rad);
        y1 = max(1, j-rad);
        y2 = min(c, j+rad);
        erodedImage(i,j) = min(min(filledImage(x1:x2, y1:y2)));
    end
end

figure;
imshow(erodedImage);
title('Eroded Image','FontSize',20);

% Step 8: Tumour Outline
tumorOutline = tumor;
tumorOutline(erodedImage) = 0;

figure;
imshow(tumorOutline);
title('Tumor Outline','FontSize',20);

% Step 9: Overlay Outline on Original
rgb = cat(3, inp, inp, inp);
red = rgb(:,:,1);
green = rgb(:,:,2);
blue = rgb(:,:,3);

red(tumorOutline) = 255;
green(tumorOutline) = 0;
blue(tumorOutline) = 0;

tumorOutlineInserted(:,:,1) = red;
tumorOutlineInserted(:,:,2) = green;
tumorOutlineInserted(:,:,3) = blue;

figure;
imshow(tumorOutlineInserted);
title('Detected Tumor','FontSize',20);

% Step 10: Final Visualization (All Stages)
figure;
subplot(231); imshow(s); title('Input Image','FontSize',12);
subplot(232); imshow(inp); title('Filtered Image','FontSize',12);
subplot(233); imshow(inp); title('Bounding Box','FontSize',12);
hold on; rectangle('Position', wantedBox, 'EdgeColor','y'); hold off;
subplot(234); imshow(tumor); title('Tumor Alone','FontSize',12);
subplot(235); imshow(tumorOutline); title('Tumor Outline','FontSize',12);
subplot(236); imshow(tumorOutlineInserted); title('Detected Tumor','FontSize',12);
