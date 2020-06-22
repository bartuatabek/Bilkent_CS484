% CS 484 HW#3
% Bartu Atabek - 21602229
% Use pattern matching to read images from a directory.
function images = read_images(dir_name)
imagefiles = dir(strcat(dir_name,'*.jpg'));   
nfiles = length(imagefiles);

for ii=1:nfiles
   currentfilename =  append(dir_name,imagefiles(ii).name);
   currentimage = imread(currentfilename);
   images{ii} = currentimage;
end
