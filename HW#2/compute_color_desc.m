% Computes color descriptor for a given image and a specified local 
% feature given as input. Outputs lenght 64 descriptor.
function outd = compute_color_desc(feature, image)

% Location, scale and orientation values computed from the local
% feature used to form a scaled square around the point.
center = feature(1:2);
scale = feature(3) * 2;
orientation = feature(4);

x = center(1) - scale/2;
y = center(2) - scale/2;

% % Rotate the image into the desired angle then crop with the
% % calculated square dimensions.
x = [12 -12 12 -12];
y = [12 12 -12 -12];

x = x*scale;
y= y*scale;

transformedx = (x*cos(orientation) - y*sin(orientation)) + x;
transformedy = (y*cos(orientation) + x*sin(orientation)) + y;

masked = poly2mask(transformedx, transformedy, size(image,1), size(image,2));
r = (image(:,:,1));
g = (image(:,:,2));
b = (image(:,:,3));

% Get the pixels from the image.
r = r(masked);
g = g(masked);
b = b(masked);

RGBpixels = [r g b];

% Init 4x4x4 histogram.
outd = zeros([4 4 4]);

% Flatten the three-dimensional histogram
for i = 1:size(RGBpixels, 1)
    p = double(RGBpixels(i,:));
    p = floor(p / (256 / 4)) + 1;
    outd(p(1), p(2), p(3)) = outd(p(1), p(2), p(3)) + 1;
end
outd = outd(:);