I = imread('lenna.jpg');
subplot(1,2,1), imshow(I)
CI = imcomplement(I)
%CI = 255 - I
subplot(1,2,2), imshow(CI)
 
close all;
clear all;
I = imread('lenna.jpg');
c = input('Enter the constant, c = ');
j = double(I)/255;
K = c*log(1+j)
subplot(1,2,1), imshow(I), title('Original Image')
subplot(1,2,2), imshow(K), title('Log Transformed Image')
 
I = imread('lenna.jpg');
c = input('Enter the constant, c = ');
gamma = input('Enter gamma correction, g = ');
j = double(I)/255;
K = c*j.^gamma
subplot(1,2,1), imshow(I), title('Original Image')
subplot(1,2,2), imshow(K), title('Power Law Transformed Image')
 
I = imread('lenna.jpg');
J = imadjust(I, stretchlim(I),[])
subplot(1,2,1), imshow(I), title('Original Image')
subplot(1,2,2), imshow(J), title('Contrast Stretching')
 
I = imread('lenna.jpg');
subplot(3,3,1), imshow(I)
for i = 1:8
    Ii = bitget(I,i)*2^(i-1);
    subplot(3,3,i+1), imshow(Ii)
end

I = imread('E:\6 Sem\DIP\lake.tif');
subplot(1,2,1), imshow(I)
subplot(1,2,2),imhist(I)

close all
clc
x=imread('Picture39.jpg');
x=rgb2gray(x);
y=histeq(x);
subplot(2,2,1),imshow(x)
subplot(2,2,2),imshow(y)
subplot(2,2,3),imhist(x)
subplot(2,2,4),imhist(y)

I = imread('C:\Users\nikil\Desktop\th1.jpg');
J = imnoise(I,'gaussian',0.2,0.1);
K = imnoise(I,'poisson');
L = imnoise(I,'salt & pepper',0.2);
subplot(2,2,1), imshow(I), title('Origianl Image')
subplot(2,2,2), imshow(J), title('Image with Gaussian Noise')
subplot(2,2,3), imshow(K), title('Image with Poisson Noise')
subplot(2,2,4), imshow(L), title('Image with Salt & Pepper Noise')

I = imread('C:\Users\nikil\Desktop\th1.jpg');
subplot(1,4,1), imshow(I)
H1 = fspecial('average',5)
FilterAverage = imfilter(I,H1,'replicate')
subplot(1,4,2), imshow(FilterAverage)
H2 = fspecial('gaussian',5)
FilterGaussian = imfilter(I,H2,'replicate')
subplot(1,4,3), imshow(FilterGaussian)
H3 = fspecial('sobel')
FilterSobel = imfilter(I,H3,'replicate')
subplot(1,4,4), imshow(FilterSobel)
H = fspecial('laplacian',0.2)
FilterLaplacian = imfilter(I,H,'replicate');
figure,imshow(FilterLaplacian)

clc
close all
 
x=imread('child.jpg');
x=rgb2gray(x);
figure,imshow(x)
title('original Image')
y=imnoise(x,'salt & pepper', 0.05);
figure,imshow(y)
title('Image with salt and pepper noise')
y1=medfilt2(y);
h=1/9*ones(3,3);
y2=conv2(y,h,'same');
figure,imshow(y1);
title(' 3x3 median filter applied')
figure,imshow(uint8(y2));
figure,imshow((y2));
title(' 5x5 median filter applied')
y=medfilt2(y);
figure,imshow(y);

clc
close all
 
x=imread('child.jpg');
x=rgb2gray(x);
figure,imshow(x)
title('original Image')
figure,imhist(x);
y=imnoise(x,'salt & pepper', 0.05);
figure,imshow(y)
title('Image with salt and pepper noise')
figure,imhist(y)
title('Histogram of noisy Image')
y1=medfilt2(y);
h=1/9*ones(3,3);
y2=conv2(y,h,'same');
figure,imshow(y1);
title(' 3x3 average filter applied')
y2=medfilt2(y,[5 5]);

close all
clc
x=imread('cat.jpg');
x=rgb2gray(x);
figure,imshow(x);
h=[0 -1 0;-1 5 -1;0 -1 0];
y=conv2(x,h,'same');
figure,imshow(uint8(y));
h=[-1 -1 -1;-1 9 -1;-1 -1 -1];
y=conv2(x,h,'same');
figure,imshow(uint8(y));

I = imread('C:\Users\nikil\Desktop\th1.jpg');
H = fspecial('unsharp')
FilterUnSharp = imfilter(I,H,'replicate');
figure, imshow(I)
figure, imshow(FilterUnSharp)