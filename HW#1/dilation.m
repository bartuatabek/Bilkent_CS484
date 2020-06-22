% Used Definition (1): The dilation is the set of all displacements z
% such that Bz and A overlapy by at least one element.
function out = dilation(source_image, str_elem)
% Size of the source image
[N,M] = size(source_image);
% Init the output image to all zeros
% with the dimensions of the source image
out = zeros(N,M);

% pad the image with zeroes in order to fit
% the str_elem at each pixel.
padx = floor(size(str_elem,1) / 2);
pady = floor(size(str_elem,2) / 2);
padded_img = zeros(N + (2 * padx), M + (2 * pady));
padded_img(padx+1:padx+N, pady+1:pady+M) = source_image;

% loop over the pixels of the image
for i = padx+1: padx+N
    for j = pady+1:pady+M
        % If the structuring element "hits", then at least one element
        % in intersection is non-zero.
        if mod(size(str_elem,1),2) == 0 && mod(size(str_elem,2),2) == 0
           img_seg = padded_img(i-padx:i+padx-1, j-pady:j+pady-1);
        elseif mod(size(str_elem,1),2) == 0
           img_seg = padded_img(i-padx:i+padx-1, j-pady:j+pady);
        elseif mod(size(str_elem,2),2) == 0
           img_seg = padded_img(i-padx:i+padx, j-pady:j+pady-1);
        else
           img_seg = padded_img(i-padx:i+padx, j-pady:j+pady);
        end
        intersection = img_seg .* str_elem;
        if sum(sum(intersection)) > 0
            out(i-padx,j-pady) = 1;
        end
    end
end