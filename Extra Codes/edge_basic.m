clc; clear; close all;

imgPath = 'image.jpg';   % change this to your image
I = imread(imgPath);

if size(I,3) == 3
    Igray = rgb2gray(I);
else
    Igray = I;
end

Igray = im2double(Igray);
Iblur = imgaussfilt(Igray, 1.2);

sobelImg   = edge(Iblur , 'sobel');
prewittImg = edge(Iblur , 'prewitt');
cannyImg   = edge(Iblur , 'canny');

figure;

subplot(2,2,1);
imshow(Igray);
title('Grayscale Image');

subplot(2,2,2);
imshow(sobelImg);
title('Sobel');

subplot(2,2,3);
imshow(prewittImg);
title('Prewitt');

subplot(2,2,4);
imshow(cannyImg);
title('Canny');
