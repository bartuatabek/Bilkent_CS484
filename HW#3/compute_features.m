% CS 484 HW#3
% Bartu Atabek - 21602229
% Calculates a feature vector of the given image by;
% using only color features,
% using only texture features,
% using color-texture features together.
function featureVector = compute_features(image, labels, numlabels, option)
 % Convert label matrix to cell array of linear indices
idx = label2idx(labels);
numRows = size(image,1);
numCols = size(image,2);

if option == 1 || option == 3
    % Convert image to Lab color space.
    lab = rgb2lab(image);
    colorVector = zeros(numlabels,3);
    % Calculate the average L,a,b features.
    for labelVal = 1:numlabels
      redIdx = idx{labelVal};
      greenIdx = idx{labelVal}+numRows*numCols;
      blueIdx = idx{labelVal}+2*numRows*numCols;
      colorVector(labelVal,1) = mean(lab(redIdx));
      colorVector(labelVal,2) = mean(lab(greenIdx));
      colorVector(labelVal,3) = mean(lab(blueIdx));
    end
    
    if option == 1 
        featureVector = colorVector;
        % Normalize the output to the [0,1] range.
        featureVector = mat2gray(featureVector);
        return
    end
end

if option == 2 || option == 3
    % Calculate 16 Gabor responses with 4 scales and 4 orientations.
    gaborMag = gabor_filter(image);
    textureVector = zeros(numlabels,16);
    % Calculate the average of the Gabor texture features 
    for labelVal = 1:numlabels
        for i = 0:15
            gaborIdx = idx{labelVal}+i*numRows*numCols;
            textureVector(labelVal,i+1) = mean(gaborMag(gaborIdx));
        end
    end
    
    if option == 2
        featureVector = textureVector;
        % Normalize the output to the [0,1] range.
        featureVector = mat2gray(featureVector);
        return
    end
end
    
% Append color-texture features    
featureVector = [colorVector textureVector];
% Normalize the output to the [0,1] range.
featureVector = mat2gray(featureVector);