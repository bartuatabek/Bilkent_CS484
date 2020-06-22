function [bagOfWords1, bagOfWords2, bagOfWords3, bagOfWords4, bagOfWords5, bagOfWords6] = findBagOfWords(images, descSize, size1, size2, C1, C2, C3, C4, C5, C6)
bagOfWords1 = bagOfWords(images, descSize, size1, C1);
bagOfWords2 = bagOfWords(images, descSize, size2, C2);
bagOfWords3 = bagOfWords(images, descSize, size1, C3);
bagOfWords4 = bagOfWords(images, descSize, size2, C4);
bagOfWords5 = bagOfWords(images, descSize, size1, C5);
bagOfWords6 = bagOfWords(images, descSize, size2, C6);