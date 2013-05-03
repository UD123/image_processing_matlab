function [warpI2]=warpFlow(i2,vx,vy)
% warp i1 according to flow field in vx vy, modified by Aaron Shan

% [M,N]=size(i2);
% [x,y]=meshgrid(1:N,1:M);
% warpI2=interp2(x,y,i2,x+vx,y+vy,'bicubic');
% %warpI2=interp2(x,y,i2,x+vx,y+vy);
% I=find(isnan(warpI2));
% warpI2(I)=zeros(size(I));

nChannels=size(i2,3);
for i=1:nChannels
    [im,isNan]=warpFL(i2(:,:,i),vx,vy);
    warpI2(:,:,i)=im;
end