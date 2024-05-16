function matched_image = histogram_match(im1, im2)
    % Read the input images
    r1 = im1(:,:,1);
    g1 = im1(:,:,2);
    b1 = im1(:,:,3);
    
    r2 = im2(:,:,1);
    g2 = im2(:,:,2);
    b2 = im2(:,:,3);
    
    % Perform histogram matching for each channel
    matched_r = match_channel(r1, r2);
    matched_g = match_channel(g1, g2);
    matched_b = match_channel(b1, b2);
    
    % Combine the matched channels into the final image
    matched_image = cat(3, matched_r, matched_g, matched_b);
    
    % Display the original images and the matched image
    figure;
    subplot(1, 3, 1);
    imshow(im1);
    title('Image 1');
    
    subplot(1, 3, 2);
    imshow(im2);
    title('Image 2');
    
    subplot(1, 3, 3);
    imshow(matched_image);
    title('Histogram Matched Image');
end

function matched_channel = match_channel(channel1, channel2)
    % Perform histogram matching for a single channel
    M = zeros(256,1,'uint8'); 
    hist1 = my_imhist(channel1); 
    hist2 = my_imhist(channel2);
    cdf1 = cumsum(hist1) / numel(channel1);
    cdf2 = cumsum(hist2) / numel(channel2);
    for idx = 1 : 256
        [~,ind] = min(abs(cdf1(idx) - cdf2));
        M(idx) = ind-1;
    end
    [H, W] = size(channel1);
    matched_channel = zeros(H,W,'uint8');
    for x = 1: H
        for y = 1:W
            matched_channel(x,y) = M(double(channel1(x,y))+1);
        end
    end
end

% Example usage:
function hist_values = my_imhist(image)
    % Custom implementation of imhist
    [rows, cols, ~] = size(image);
    hist_values = zeros(256, 1); % Initialize histogram bins
    
    % Compute histogram
    for i = 1:rows
        for j = 1:cols
            intensity = image(i, j);
            hist_values(intensity + 1) = hist_values(intensity + 1) + 1;
        end
    end
end

