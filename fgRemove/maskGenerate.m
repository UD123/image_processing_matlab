
function [ mask ] = maskGenerate( img )

[M_img,N_img,ch]=size(img);
mask = zeros(M_img,N_img);

for i=1:M_img %check if -1 is nesscessary
    for j = 1:N_img
        if img(i,j,:) ~= 0 
            mask(i,j) = 255;
        end
    end
end

% Dilation 
SE = strel('disk', 3, 4);
mask = imdilate(mask,SE);

figure;imshow(mask);
imwrite(mask,'result.png');
end

