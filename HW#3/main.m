% CS 484 HW#3
% Bartu Atabek - 21602229
% Sample script that takes a set of input images from
% given directory oversegments them using SLIC0 algorithm
% then merges the superpixel regions using color, texture, and
% color-texture features and outputs the images to designated
% folders. Also, outputs samle gabor filter responses.
clear
close all

images = read_images('cs484_hw3_data/');
threshold = 0.45;

%% Superpixel segmentation
for i = 1:size(images,2)
     [labels, numlabels] = superpixels(images{i}, 200);

     figure
     BW = boundarymask(labels);
     image = imoverlay(images{i}, BW, 'white');
     imshow(image);
     imwrite(image,sprintf('out/segmentation/image_%d.jpg',i));
end

%% Segmentation results after merging using features (color, texture, color-texture).
for option = 1:3
    for i = 1:size(images,2)
        [labels, numlabels] = superpixels(images{i}, 200);
        merged_labels = merge_regions(images{i}, labels, numlabels, threshold, option);

        figure
        BW = boundarymask(merged_labels);
        image = imoverlay(images{i}, BW, 'white');
        imshow(image);
        imwrite(image,sprintf('out/merged/opt%d/image_%d.jpg',i,option));
    end
end

%% Generate sample gabor responses
%samples = randperm(21);
%gaborArray = gabor([2 3],[0 45]);
%
%for i = 1:5
%     gaborMag = gabor_filter(images{samples(i)});
%
%     figure
%     subplot(2,2,1);
%     for p = 1:4
%         subplot(2,2,p)
%         imshow(gaborMag(:,:,p),[]);
%         theta = gaborArray(p).Orientation;
%         lambda = gaborArray(p).Wavelength;
%         title(sprintf('Orientation=%d, Wavelength=%d',theta,lambda));
%     end
%     saveas(gcf,sprintf('out/gabor/img%d/gabor%d.jpg',i,samples(i)));
%end
