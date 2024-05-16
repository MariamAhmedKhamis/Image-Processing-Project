Image = imread('s.png');
figure, imshow(Image), title ('Original Image')
noiseimage = imnoise(Image,'gaussian',0.07);
figure, imshow(noiseimage), title ('Noised Image')