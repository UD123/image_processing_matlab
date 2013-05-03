function [ result] = fgRemove(img, mask )



%BGEXTRACT bgExtract( img, mask ) This function extract the background by
%using a mask (0-background, 1-foreground)
[M_mask,N_mask,ch]=size(mask);
[M_img,N_img,ch]=size(img);

result = img;
%check size consistence
if (M_mask ~= M_img || N_mask ~= N_img)
    fprintf('Image size is not equal to mask size');
end
    
for i=1:M_mask %check if -1 is nesscessary
    for j = 1:N_mask
        if mask(i,j) == 255 
            result(i,j,:) = 0;
        end
    end
end
figure;imshow(img);title('Original Imgage');
figure;imshow(result);title('Background Extracted');

end

