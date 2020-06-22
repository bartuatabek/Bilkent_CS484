% CS 484 HW#3
% Bartu Atabek - 21602229
% Merges the superpixel regions by;
% using only color features,
% using only texture features,
% using color-texture features together.
function merged_labels = merge_regions(image, labels, numlabels, threshold, option)

isMerged = -1;
cnumlabels = numlabels;
merged_labels = labels + 1;

while isMerged  ~= 0
    isMerged = -1;
    % Calculate chossen the feature vectors (i.e.
    % color,texture,color-texture).
    featureVector = compute_features(image, merged_labels, cnumlabels, option);
    
    % Find the neighboring regions of each superpixel region.
    [~, Al] = regionadjacency(merged_labels, 8);
    
    for i = 1:cnumlabels
        v1 = featureVector(i,:);
        % Compare the feature vector with all neighboring pairs.
        for j = 1:size(Al{i},2)
            nv1 = featureVector(Al{i}(j),:);
            
            % Calculate the Euclidian distance between the feature vectors.
            eudist = sqrt(sum((v1 - nv1).^2));
            
            % If the Euclidean distance between their feature vectors
            % is less than threshold, merge the two regions.
            if eudist < threshold
                % Re-organize the labels.
                merged_labels(merged_labels==Al{i}(j)) = i;
                merged_labels(merged_labels>=Al{i}(j)) = merged_labels(merged_labels>=Al{i}(j)) - 1;
                % Decrement the no of labels.
                cnumlabels = cnumlabels - 1;
                isMerged = 1;
                break
            end
        end
        
        % Repeat steps 2 & 3 
        if isMerged == 1
            break
        end
    end
    
    % If no further merging can done
    if isMerged < 0
        isMerged = 0;
    end
end