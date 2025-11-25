clc; clear; close all;

imgPath = 'image.jpg';
I = imread(imgPath);

if size(I,3) == 3
    Igray = rgb2gray(I);
else
    Igray = I;
end

Igray = im2double(Igray);

sigmas = [0 1 2 3];   % 0 = no blur

figure;

for k = 1:length(sigmas)
    s = sigmas(k);

    if s == 0
        Iproc = Igray;
    else
        Iproc = imgaussfilt(Igray, s);
    end

    BW = edge(Iproc, 'canny');

    subplot(2,2,k);
    imshow(BW);
    title(['Canny, \sigma = ' num2str(s)]);
end
