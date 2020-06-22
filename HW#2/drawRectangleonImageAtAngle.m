close all

I = imread('data/africa/0.jpg');
% figure
% imshow(I);
[f,d] = vl_sift(single(rgb2gray(I)));
% COLOR = [];
% for j = 1:length(f)
%     COLOR = [COLOR compute_color_desc(f, I)];
% end

% xLeft = 20.7734069824219 -  2.09488010406494;
% yBottom = 198.146606445313 - 2.09488010406494;
% rotation = -rad2deg(-0.969980510936934);
% h = images.roi.Rectangle(gca,'Position',[xLeft,yBottom,2.09488010406494*2,2.09488010406494*2],'RotationAngle',rotation);
% 
% roi=createMask(h);
% [row,col]=find(roi);
% RGBpixels = impixel(I,col,row);
% 
% H=zeros([4 4 4]);
% 
% for i=1:size(RGBpixels,1)
%         p=double(RGBpixels(i,:));
%         p=floor(p/(256/4))+1;
%         H(p(1),p(2),p(3))=H(p(1),p(2),p(3))+1;
% end
% H=H(:);
% close all