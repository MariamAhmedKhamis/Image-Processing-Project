function convert_to_gray(image)
    
    blue_channel = image(:, :, 3); 

    gray_single_blue = blue_channel;

    figure;
    subplot(3, 3, 1); imshow(image); title('Original Image');
    
    subplot(3, 3, 6); imshow(gray_single_blue); title('Single Blue Channel');
end
