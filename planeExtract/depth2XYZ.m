function [ result ] = depth2XYZ( depth_img )
%DEPTH2XYZ transfer a depth image to 3d points (x,y,z) array 3xN (N=w*h) 
[M,N,ch]=size(depth_img);
point_Num = M*N;
result = zeros(3,point_Num);

count = 1;
for j=1:N
    for i = 1:M
            result(1,count) = i;
            result(2,count) = j;
            result(3,count) = depth_img(i,j);
            count = count + 1;
    end
end

end

