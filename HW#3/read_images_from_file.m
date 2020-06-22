% % Use pattern matching to read images from a directory.
% function images = read_images(dir_name)
% imagefiles = dir(strcat(dir_name,'*.jpg'));   
% nfiles = length(imagefiles);
% 
% for ii=1:nfiles
%    currentfilename =  append(dir_name,imagefiles(ii).name);
%    currentimage = imread(currentfilename);
%    images{ii} = currentimage;
% end

% Function takes filename as input and reads all
% the filenames given as imput and returns a 
% collection of images.
function images = read_images(filename)
images = {};
file = fopen(filename);
image_path = fgetl(file);

while ischar(image_path)
    current_image = imread(image_path);
    images = [images, current_image];
    image_path = fgetl(file);
end
fclose(file);