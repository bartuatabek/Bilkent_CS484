% Inputs collection of images and then computes the following descriptors.
% Gradient-based descriptorsrs: Each point will have a SIFT descriptor of length 128.
% Color-based descriptors: Each point will have a color descriptor of length 64.
% Outputs the descriptors and no of descriptors for each image.
function [descSize, gDesc, cDesc] = compute_sift(images)
gDesc = [];
cDesc = [];
for i = 1:size(images,2)
    % Compute gradient SIFT descriptors.
    [f,d] = vl_sift(single(rgb2gray(images{i})));
    descSize{i} = size(f,2);
    gDesc = [gDesc d]; % Record the no of descriptors for image i.
    
    % For each detected feature compute a color descriptor.
    for j = 1:size(f,2)
        colorDescriptor = compute_color_desc(f, images{i});
        cDesc = [cDesc colorDescriptor];
    end
end