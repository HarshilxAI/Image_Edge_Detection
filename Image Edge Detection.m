clc; clear; close all;

imgPath = '/MATLAB Drive/srawan_pandey.jpeg';

I = imread(imgPath);

if size(I, 3) == 3
    Igray = rgb2gray(I);
else
    Igray = I;
end
BW_sobel   = edge(Igray, 'sobel');
BW_prewitt = edge(Igray, 'prewitt');
BW_roberts = edge(Igray, 'roberts');
BW_log     = edge(Igray, 'log');
BW_canny   = edge(Igray, 'canny');

I_d = double(Igray);

Gx = [-1 0 1; -2 0 2; -1 0 1];
Gy = [-1 -2 -1; 0 0 0; 1 2 1];

Ix = imfilter(I_d, Gx, 'replicate');
Iy = imfilter(I_d, Gy, 'replicate');

G = sqrt(Ix.^2 + Iy.^2);
G_norm = G ./ max(G(:));

threshold = 0.2;
BW_manual_sobel = G_norm > threshold;

figure('Name','Edge Detection Comparison','NumberTitle','off');

subplot(2,4,1);
imshow(Igray);
title('Original');

subplot(2,4,2);
imshow(BW_sobel);
title('Sobel');

subplot(2,4,3);
imshow(BW_prewitt);
title('Prewitt');

subplot(2,4,4);
imshow(BW_roberts);
title('Roberts');

subplot(2,4,5);
imshow(BW_log);
title('LoG');

subplot(2,4,6);
imshow(BW_canny);
title('Canny');

subplot(2,4,7);
imshow(G_norm, []);
title('Gradient Magnitude');

subplot(2,4,8);
imshow(BW_manual_sobel);
title('Manual Sobel');

