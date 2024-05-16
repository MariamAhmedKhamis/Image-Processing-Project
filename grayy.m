function gray_image = grayy(image, color_channel)
    % Convert image to grayscale using the specified color channel
    if color_channel == 1
        gray_image = image(:, :, 1); % Red channel
    elseif color_channel == 2
        gray_image = image(:, :, 2); % Green channel
    elseif color_channel == 3
        gray_image = image(:, :, 3); % Blue channel
    else
        error('Invalid color channel specified. Choose 1 for Red, 2 for Green, or 3 for Blue.');
    end
end
