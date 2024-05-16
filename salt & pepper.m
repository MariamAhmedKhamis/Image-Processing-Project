image = imread('coins.png');
figure, imshow(image), title ('Original Image')
imageno = imnoise(image,'salt & pepper',0.02);
figure, imshow(imageno), title ('Noised Image')