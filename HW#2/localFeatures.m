functions result = localFeatures(gallery, query)
images = read_images(gallery);
[descSize, gDesc, cDesc] = compute_sift(images);
[idx1, C1, idx2, C2, idx3, C3, idx4, C4, idx5, C5, idx6, C6] = visualWords(gDesc, cDesc, size1, size2);  