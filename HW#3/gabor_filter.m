% CS 484 HW#3
% Bartu Atabek - 21602229
% Creates a Gabor Bank of 4 different
% scales (2,3,4,5) and 4 orientations
% (0,45,90,135) and applies them using
% Gabor filter implementation in Matlab’s
% image processing toolbox and returns the
% magnitude responses.
function gaborMag = gabor_filter(image)
image = rgb2gray(image);
gaborArray = gabor([2 3 4 5],[0 45 90 135]);
gaborMag = imgaborfilt(image,gaborArray);
