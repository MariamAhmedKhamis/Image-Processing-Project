

im=double(rgb2gray(imread('Lanne.png')));

F_u_v=fft2(im);

F_u_v=(fftshift(F_u_v));

figure(1);

subplot(1,2,1);imshow(uint8(im));

title('Original Image');

temp=log(abs(F_u_v));

subplot(1,2,2);

imshow(temp,[]);

title('Fourier Spectra');

%% Idle Lowpass filter

% Creating Transfer function

[M,N]=size(im);

% Set up range of variables.

u = 0:(M - 1);

v = 0:(N - 1);

% Compute the indices for use in meshgrid.

idx = find(u > M/2);

u(idx) = u(idx) - M;

idy = find(v > N/2);

v(idy) = v(idy) - N;

% Compute the meshgrid arrays.

[V, U] = meshgrid(v, u);

% Compute the distances D(U, V).

D0=30;

D = sqrt(U.^2 + V.^2);

H =ifftshift( double(D <=D0));

%Applying the transfer function

g=real(ifft2(H.*F_u_v));

%Crop to original size.

%g=g(1:size(F_u_v,1),1:size(F_u_v,2));

figure(2);

subplot(1,2,1);imshow(uint8(abs(g)));

title('Filtered Image');

subplot(1,2,2);imshow(H,[]);

title('Idle Lowpass filter');

%% Gaussian Filter

Hg = ifftshift(exp(-(D.^2)./(2*(D0^2))));

% Applying Gaussian Filter

g=real(ifft2(Hg.*F_u_v));

figure(3);

subplot(1,2,1);imshow(uint8(abs(g)));

title('Filtered Image');

subplot(1,2,2);imshow(Hg,[]);

title('Gaussian Lowpass filter');

%% Idle Highpass filter

D0=10;

H =ifftshift( double(D <=D0));

Hp=1-H;

% Applying Highpass filter

g=real(ifft2(Hp.*F_u_v));

figure(4);

subplot(1,2,1);imshow(uint8(abs(g)));

title('Filtered Image');

subplot(1,2,2);imshow(Hp,[]);

title('Idle Highpass filter');

%% Gaussian Highpass filter

D0=10;

H= ifftshift(exp(-(D.^2)./(2*(D0^2))));

Hgh=1-H;

g=real(ifft2(Hgh.*F_u_v));

figure(5);

subplot(1,2,1);imshow(uint8(abs(g)));

title('Filtered Image');

subplot(1,2,2);imshow(Hgh,[]);

title('Gaussian Highpass filter');