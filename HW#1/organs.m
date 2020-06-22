% CS 484 Homework 1 Question #2
% Author: Bartu Atabek

close all

% Read the grayscale ct scan image
image = imread( 'ct.png' );

%% Tresholding Organs
% Calculate a threshold that will produce a binary image that has most of
% the organs separated into distinct regions.
threshold_level = 0.515; % selected threshold value by trial-error

% Convert the image into a binary image using the threshold.
organsTreshold = imbinarize(image, threshold_level);
figure, imshowpair(image, organsTreshold, 'montage')
imwrite(organsTreshold, 'thresholded_image.png');
 
%% Segmenting Organs With Morphological Operators
% Separate organs that are connected together or to fill small holes in organs.

% Thresholded image closed; dilated and then eroded the dilated image,
% using the same structuring element for both operations in order to fill
% small holes in the organs such as the liver.
se = strel('disk', 2, 8);
dilate1 = dilation(organsTreshold, se.Neighborhood);
erode1 = erosion(dilate1, se.Neighborhood);
figure, imshowpair(organsTreshold, erode1, 'montage')

% Closed image is opened; eroded and then dilated the eroded image,
% using the same structuring element for both operations in order to
% separate connected organs such as the liver and kidney.
se = strel('disk', 6);
erode2 = erosion(erode1, se.Neighborhood);
dilate2 = dilation(erode2, se.Neighborhood);
figure, imshowpair(erode1, dilate2, 'montage')
imwrite(dilate2, 'after_morphology.png');

%% Connected Component Analysis
% Produce a labeled image that has a distinct label for each region.
labeledImage = bwlabel(dilate2);
coloredLabels = label2rgb(labeledImage, 'hsv', 'k', 'shuffle');
figure, imshow(coloredLabels);
imwrite(coloredLabels, 'connected_components.png');
