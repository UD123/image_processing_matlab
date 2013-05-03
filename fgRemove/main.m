img1 = imread('img1.jpg');
img2 = imread('img2.jpg');

fg_mask1=imread('fg1_mask.png');
fg_mask2=imread('fg2_mask.png');

bg1 = fgRemove(img1,fg_mask1);
bg2 = fgRemove(img2,fg_mask2);

imwrite(bg1,'bg1.png');
imwrite(bg2,'bg2.png');