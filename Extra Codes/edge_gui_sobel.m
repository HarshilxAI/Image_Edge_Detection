function edge_gui_sobel()
    clc; close all;

    imgPath = 'image.jpg';
    I = imread(imgPath);

    if size(I,3) == 3
        Igray = rgb2gray(I);
    else
        Igray = I;
    end

    Igray = im2double(Igray);

    hFig = figure('Name','Sobel Threshold Demo','NumberTitle','off');

    hAx1 = subplot(1,2,1);
    imshow(Igray);
    title('Input Image');

    hAx2 = subplot(1,2,2);
    BW = edge(Igray,'sobel',0.2);
    imshow(BW);
    title('Sobel (T = 0.2)');

    uicontrol('Style','text', ...
              'Position',[200 10 180 20], ...
              'String','Threshold', ...
              'HorizontalAlignment','center');

    hSlider = uicontrol('Style','slider', ...
                        'Min',0.01, 'Max',0.5, 'Value',0.2, ...
                        'Position',[200 35 180 20], ...
                        'Callback',@sliderCallback);

    function sliderCallback(~,~)
        T = get(hSlider,'Value');
        BW = edge(Igray,'sobel',T);
        axes(hAx2);
        imshow(BW);
        title(sprintf('Sobel (T = %.2f)', T));
    end
end
