clc; clear; close all;

imgPath = 'image.jpg';
I = imread(imgPath);

if size(I,3) == 3
    Igray = rgb2gray(I);
else
    Igray = I;
end

Igray = im2double(Igray);

Gx = [-1 0 1; -2 0 2; -1 0 1];
Gy = [-1 -2 -1; 0 0 0; 1 2 1];

Ix = imfilter(Igray, Gx, 'replicate');
Iy = imfilter(Igray, Gy, 'replicate');

G  = sqrt(Ix.^2 + Iy.^2);

G = G ./ max(G(:));

T = 0.2;    % threshold
BW = G > T;

figure;

subplot(1,3,1);
imshow(Igray);
title('Grayscale');

subplot(1,3,2);
imshow(G, []);
title('Gradient Magnitude');

subplot(1,3,3);
imshow(BW);
title('Sobel Result');
