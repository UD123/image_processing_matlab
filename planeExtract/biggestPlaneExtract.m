function [ img_plane,remainder,mask_biggest_plane ] = biggestPlaneExtract( color_img, indices, XYZ, remainder)
%img_planeEXTRACT Summary of this function goes here
%   Detailed explanation goes here
[M,N,ch] = size(color_img);
img_plane = zeros(M,N,3);
mask_plane = zeros(M,N);
mask_biggest_plane = zeros(M,N);

[Npts,n] = size(indices);

for i = 1:Npts
    %img_plane(XYZ(1,indices(i)),XYZ(2,indices(i)),:) = color_img(XYZ(1,indices(i)),XYZ(2,indices(i)),:);
    mask_plane(remainder(1,indices(i)),remainder(2,indices(i)),:) = 255;
end
CC = bwconncomp(mask_plane);
numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
mask_biggest_plane(CC.PixelIdxList{idx}) = 255;

biggest_indices_img = CC.PixelIdxList{idx};
biggest_indices = biggest_indices_img;

[Npts,n] = size(biggest_indices);

j = 1;
for i = 1:Npts
    %img_plane(XYZ(1,biggest_indices(i)),XYZ(2,biggest_indices(i)),:) = color_img(XYZ(1,biggest_indices(i)),XYZ(2,biggest_indices(i)),:);
    img_plane(XYZ(1,biggest_indices(i)),XYZ(2,biggest_indices(i)),:) = color_img(XYZ(1,biggest_indices(i)),XYZ(2,biggest_indices(i)),:);
%end
remainder_id = (remainder(1,:)+(remainder(2,:)-1)*M)'; 
%XYZ(:,indices)=[];

% while j <= length(remainder_id)
%      if biggest_indices(i) == remainder_id(j)
%         remainder(:,j)=[];
%         break;
%      end
%      j = j + 1;
% end
j = find (remainder_id(:) == biggest_indices(i));
remainder(:,j)=[];
%display(i);
end
%remainder = XYZ;
img_plane = uint8(img_plane);
end

