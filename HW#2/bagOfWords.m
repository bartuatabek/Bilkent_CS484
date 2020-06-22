% This function computes the bag of words histograms for each image
% with the help of dictionary obtained from k-means.
function bagOfWords = bagOfWords(images, descSize, numClusters, centers)
% Init bag of words histogram to empty for the given size
counter = 1;
for i = 1:size(images,2)
    H = zeros(1, numClusters);
    % Find descriptor boundaries for image i.
    start = 1;
    tail = descSize{i};

    % Get the descriptors for the image i.
    % For each descriptor find the closest center and increment its
    % value by one.
    for j = start:tail
       H(centers(counter)) = H(centers(counter)) + 1;
       counter = counter +1;
    end
    % Normalize the given histogram
    H = l2_norm(H);
    bagOfWords{i} = H;
end

