function [warpI2,I]=warpFL(i2,vx,vy)
% warp i1 according to flow field in vx vy
[M,N]=size(i2);
[x,y]=meshgrid(1:N,1:M);
warpI2=interp2(x,y,i2,x+vx,y+vy,'bicubic');
%warpI2=interp2(x,y,i2,x+vx,y+vy);
I=find(isnan(warpI2));
warpI2(I)=zeros(size(I));

%% test begin
% [M,N]=size(i2);
% im = zeros(size(i2));
% for i=1:M
%     for j = 1:N
%         if(i-vy(i,j)>0 && j-vx(i,j)>0 && i-vy(i,j)<=M  && j-vx(i,j)<=N)
%         im(i-vy(i,j),j-vx(i,j)) = i2(i,j);
%         end
%     end
% end
% warpI2 = im;
% I = 0;
        
        
        


