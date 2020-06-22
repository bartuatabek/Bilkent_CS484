% The function l2 normalizes a histogram by dividing the histogram
% by the norm of the histogram vector, in order to make image
% descriptors more robust against changes in the number of visual words
% (and some other factors). That is, for a bag-of-words histogram h, its
% l2-normalized version is given by h/(?h? + 0.0001).
function result = l2_norm(data)
% norm function gives the result of euclidian norm = sqrt(sum(x.^2)).
result = data / (norm(data) + 0.0001); 