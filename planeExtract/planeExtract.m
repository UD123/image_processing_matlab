function [ img_plane,remainder,mask_plane ] = planeExtract( color_img, indices, XYZ )
%img_planeEXTRACT Summary of this function goes here
%   Detailed explanation goes here
[M,N,ch] = size(color_img);
img_plane = zeros(M,N,3);
mask_plane = zeros(M,N);

[Npts,n] = size(indices);

for i = 1:Npts
    img_plane(XYZ(1,indices(i)),XYZ(2,indices(i)),:) = color_img(XYZ(1,indices(i)),XYZ(2,indices(i)),:);
    mask_plane(XYZ(1,indices(i)),XYZ(2,indices(i)),:) = 255;
end

XYZ(:,indices)=[];
remainder = XYZ;
img_plane = uint8(img_plane);
end

