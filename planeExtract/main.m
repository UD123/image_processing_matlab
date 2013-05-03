%Extract plane from a color image according to the detph map
%Aaron Shan
%April 2, 2013

%The code has make use of Peter's function of computer vision
%http://www.csse.uwa.edu.au/~pk/research/matlabfns/



%Step 1: Read depth
depth_img = imread('box/box2_1080_depth.png');
color_img = imread('box/box2_1080.png');
ref_img = imread('box/box1_1080.png');

% Step 2: Run optical flow to generate motion vector from 2 image
cd OpticalFlow
demoflow;
cd ..

% Step 3: Change depth map into 3d points
XYZ = depth2XYZ(depth_img);

% Step 4: Fit the 3d points to a plane using Ransac and extract plane
t = 3; % threshold for inliers (the distance between plane and point)
i = 1;
remainder = XYZ;
number_remainder = 1;
while number_remainder > 0.2 
[P, id_inliers] = ransacfitplane(remainder, t, 0);
%[ img_plane,remainder,mask_plane ] = biggestPlaneExtract(color_img, id_inliers,XYZ,remainder);
[ img_plane,remainder,mask_plane ] = planeExtract(color_img, id_inliers,remainder);
number_remainder = length(remainder)/length(XYZ);
figure;imshow(img_plane);
imwrite(img_plane,strcat('box/result/plane',num2str(i),'.png'));
imwrite(mask_plane,strcat('box/result/plane',num2str(i),'_mask.png'));



% Step 5: Extract same plane from reference image using optical flow
[warped_mask_plane]=warpFlow(mask_plane,vx,vy); %vx, vy are from optical_flow 
imwrite(warped_mask_plane,strcat('box/result/plane',num2str(i),'_ref_depth.png'));
[ ref_img_plane ] = extractMask( ref_img, warped_mask_plane );
imwrite(ref_img_plane,strcat('box/result/plane',num2str(i),'_ref.png'));
i = i + 1;
end