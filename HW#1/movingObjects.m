% CS 484 Homework 1 Question #3
% Author: Bartu Atabek

close all

% Read all the highway frame sequence
highway_background = imread('highway/in000470.jpg');
highway_frame2 = imread('highway/in000550.jpg');
highway_frame3 = imread('highway/in000750.jpg');
highway_frame4 = imread('highway/in000850.jpg');

% Read all the pedestrian frame sequence
pedestrians_background = imread( 'pedestrians/in000300.jpg' );
pedestrians_frame2 = imread( 'pedestrians/in000356.jpg');
pedestrians_frame3 = imread( 'pedestrians/in000475.jpg');
pedestrians_frame4 = imread( 'pedestrians/in000575.jpg');

%% Detecting Cars in The Highway

% Analyzing Frame 2
% -----------------
% Using the first frame as the background frame, subtract it from frame 2.
detected_objects = imdifference(highway_background, highway_frame2);
% imwrite(detected_objects, 'frame2_background_subtract.png');

% Threshold the difference image to find the changing pixels.
threshold = imbinarize(detected_objects, 0.1);
% imwrite(threshold, 'frame2_threshold.png');

% Thresholded image opened; eroded and then dilated the eroded image,
% using the same structuring element for both operations.
se = strel('square', 3);
erode = erosion(threshold, se.Neighborhood);
dilate = dilation(erode, se.Neighborhood);
% imwrite(dilate, 'frame2_morph.png');

% Produce a labeled image that has a distinct label for each object.
coloredLabels = connectedComponents(dilate);
figure, imshow(coloredLabels);
% imwrite(coloredLabels, 'frame2_label.png');

% Analyzing Frame 3
% -----------------
% Using the first frame as the background frame, subtract it from frame 3.
% Subtract the frame again from frame 2 to highlight differences more.
detected_objects = imdifference(highway_background, highway_frame3);
detected_objects = detected_objects + imdifference(highway_frame2, highway_frame3);
% imwrite(detected_objects, 'frame3_background_subtract.png');

% Threshold the difference image to find the changing pixels.
threshold = imbinarize(detected_objects, 0.03);
% imwrite(threshold, 'frame3_threshold.png');

% Morphological Operations
se = strel('square', 3);
erode = erosion(threshold, se.Neighborhood);

se = strel('square', 2);
erode = erosion(erode, se.Neighborhood);

se = strel('disk', 5);
dilate = dilation(erode, se.Neighborhood);
% imwrite(dilate, 'frame3_morph.png');

% Produce a labeled image that has a distinct label for each object.
coloredLabels = connectedComponents(dilate);
figure, imshow(coloredLabels);
% imwrite(coloredLabels, 'frame3_label.png');

% Analyzing Frame 4
% -----------------
% Using the first frame as the background frame, subtract it from frame 4.
detected_objects = imdifference(highway_background, highway_frame4);
% imwrite(detected_objects, 'frame4_background_subtract.png');

% Threshold the difference image to find the changing pixels.
threshold = imbinarize(detected_objects, 0.15);
% imwrite(threshold, 'frame4_threshold.png');

% Morphological Operations
se = strel('square', 2);
erode = erosion(threshold, se.Neighborhood); 

se = strel('disk', 5);
dilate = dilation(erode, se.Neighborhood);
% imwrite(dilate, 'frame4_morph.png');

% Produce a labeled image that has a distinct label for each object.
coloredLabels = connectedComponents(dilate);
figure, imshow(coloredLabels);
% imwrite(coloredLabels, 'frame4_label.png');

% Detecting Pedestrians in The Park

% Analyzing Frame 2
% -----------------
% Using the first frame as the background frame, subtract it from frame 2.
detected_objects = imdifference(pedestrians_background, pedestrians_frame2);
detected_objects = detected_objects + imdifference(pedestrians_frame2, pedestrians_background);
% imwrite(detected_objects, 'frame2_background_subtract.png');

% Threshold the difference image to find the changing pixels.
threshold = imbinarize(detected_objects, 0.08);
% imwrite(threshold, 'frame2_threshold.png');

% Morphological Operations
se = strel('line', 6, 90);
dilate = dilation(threshold, se.Neighborhood);
erode = erosion(dilate, se.Neighborhood);

se = strel('rectangle', [5 2]);
erode = erosion(erode, se.Neighborhood); 

se = strel('line', 5, 60);
erode = erosion(erode, se.Neighborhood);

se = strel('square', 5);
dilate = dilation(erode, se.Neighborhood);
% imwrite(dilate, 'frame2_morph.png');

% Produce a labeled image that has a distinct label for each object.
coloredLabels = connectedComponents(dilate);
figure, imshow(coloredLabels);
% imwrite(coloredLabels, 'frame2_label.png');

% Analyzing Frame 3
% -----------------
% Using the first frame as the background frame, subtract it from frame 3.
detected_objects = imdifference(pedestrians_background, pedestrians_frame3);
detected_objects = detected_objects + imdifference(pedestrians_frame3, pedestrians_background);
% imwrite(detected_objects, 'frame3_background_subtract.png');

% Threshold the difference image to find the changing pixels.
threshold = imbinarize(detected_objects, 0.1);
% imwrite(threshold, 'frame3_threshold.png');

% Morphological Operations
se = strel('square', 2);
erode = erosion(threshold, se.Neighborhood);

se = strel('disk', 5);
dilate = dilation(erode, se.Neighborhood);  
erode = erosion(dilate, se.Neighborhood); 
% imwrite(erode, 'frame3_morph.png');

% Produce a labeled image that has a distinct label for each object.
coloredLabels = connectedComponents(erode);
figure, imshow(coloredLabels);
% imwrite(coloredLabels, 'frame3_label.png');

% Analyzing Frame 4
% -----------------
% Using the first frame as the background frame, subtract it from frame 4.
detected_objects = imdifference(pedestrians_background, pedestrians_frame4);
detected_objects = detected_objects + imdifference(pedestrians_frame4, pedestrians_background);
% imwrite(detected_objects, 'frame4_background_subtract.png');

% Threshold the difference image to find the changing pixels.
threshold = imbinarize(detected_objects, 0.17);
% imwrite(threshold, 'frame4_threshold.png');

% Morphological Operations
se = strel('rectangle', [7 3]);
dilate = dilation(threshold, se.Neighborhood);  
erode = erosion(dilate, se.Neighborhood); 
% imwrite(erode, 'frame4_morph.png');

% Produce a labeled image that has a distinct label for each object.
coloredLabels = connectedComponents(erode);
figure, imshow(coloredLabels);
% imwrite(coloredLabels, 'frame4_label.png');

%% Finds the changed areas in a frame using the background subtraction technique.
function difference = imdifference(background, frame)
difference = rgb2gray(background) - rgb2gray(frame);
end

%% Produces a labeled image that has a distinct label for each object.
function coloredLabels = connectedComponents(image)
labeledImage = bwlabel(image);
coloredLabels = label2rgb(labeledImage, 'hsv', 'k', 'shuffle');
end