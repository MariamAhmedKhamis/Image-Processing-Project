function [original_image1, original_image2, matched_image, hist_original1, hist_original2, hist_matched] = histogram_matching(image1, image2)
    % Convert image1 to grayscale if it's RGB
 
    % Convert image2 to grayscale if it's RGB
    if size(image2, 3) == 3
        image2_gray = GrayScaleLum(image2);
    else
        image2_gray = image2;
    end
    
    % Perform histogram equalization on both images
    equalized_image1 = HistoEqualization(image1_gray);
    equalized_image2 = HistoEqualization(image2_gray);
    
    % Compute histograms of original images
    hist_original1 = Histogram(image1_gray);
    hist_original2 = Histogram(image2_gray);
    
    % Compute histogram of the matched image
    hist_matched = Histogram(equalized_image1);
    
    % Perform histogram matching
    matched_hist = MatchHistograms(hist_original1, hist_original2);
    
    % Initialize matched image
    matched_image = uint8(zeros(size(image1_gray)));
    
    % Apply histogram matching to each pixel of image1
    for i = 1:size(image1_gray, 1)
        for j = 1:size(image1_gray, 2)
            intensity = image1_gray(i, j) + 1; % MATLAB arrays are 1-indexed
            matched_image(i, j) = matched_hist(intensity);
        end
    end
    
    % Return original images
    original_image1 = image1_gray;
    original_image2 = image2_gray;
    
    % Display figures or other processing
    figure;
    subplot(2, 3, 1);
    imshow(original_image1);
    title('Original Image 1');
    
    subplot(2, 3, 2);
    imshow(original_image2);
    title('Original Image 2');
    
    subplot(2, 3, 3);
    imshow(matched_image);
    title('Matched Image');
    
    subplot(2, 3, 4);
    bar(hist_original1);
    title('Histogram of Original Image 1');
    
    subplot(2, 3, 5);
    bar(hist_original2);
    title('Histogram of Original Image 2');
    
    subplot(2, 3, 6);
    bar(hist_matched);
    title('Histogram of Matched Image');
end

function [newimage] = HistoEqualization(oldimage)
    % Calculate histogram
    histogram = Histogram(oldimage);
    
    % Compute cumulative distribution function
    cdf = cumsum(histogram) / numel(oldimage);
    
    % Perform histogram equalization
    newimage = round(255 * cdf(oldimage + 1));
end

function [histogram] = Histogram(oldimage)
    histogram = zeros(1, 256);
    [rows, cols] = size(oldimage);
    
    for x = 1:rows
        for y = 1:cols
            intensity = oldimage(x, y) + 1; % MATLAB arrays are 1-indexed
            histogram(intensity) = histogram(intensity) + 1;
        end
    end
end

function [matched_hist] = MatchHistograms(hist_original1, hist_original2)
    % Compute cumulative distribution functions
    cdf_original1 = cumsum(hist_original1) / sum(hist_original1);
    cdf_original2 = cumsum(hist_original2) / sum(hist_original2);
    
    % Interpolate the CDF of hist_original2 to match the bins of hist_original1
    matched_cdf = interp1(1:256, cdf_original2, 1:256);
    
    % Perform histogram matching
    [~, indexes] = min(abs(cdf_original1 - matched_cdf), [], 2);
    matched_hist = zeros(256, 1);
    matched_hist(1:256) = indexes - 1; % Adjust for MATLAB indexing
end
