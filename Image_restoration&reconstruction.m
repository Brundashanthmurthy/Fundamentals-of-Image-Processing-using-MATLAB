 clc
close all
 x=imread('lenna.jpg');
x=rgb2gray(x);
figure,imshow(x)
title('original Image')
figure,imhist(x);
title('Histogram of original Image')
y=imnoise(x,'salt & pepper', 0.05);
figure,imshow(y)
title('Image with salt and pepper noise')
figure,imhist(y)
title('Histogram of noisy Image')
y1=medfilt2(y);
h=1/9*ones(3,3);
y2=conv2(y,h,'same');
figure,imshow(y1);
title(' 3x3 median filter applied')
figure,imshow(uint8(y2));
title(' 3x3 average filter applied')
y2=medfilt2(y,[5 5]);
figure,imshow((y2));
title(' 5x5 median filter applied')
y=medfilt2(y);
figure,imshow(y);
y=medfilt2(y);
figure,imshow(y)

%MIN FILTERING
%READ AN IMAGE
A = imread('E:\6 Sem\DIP\lake.tif');
A = rgb2gray(A(1:300,1:300,:));
figure,imshow(A),title('ORIGINAL IMAGE');
 %PREALLOCATE THE OUTPUT MATRIX
B=zeros(size(A));
 %PAD THE MATRIX A WITH ZEROS
modifyA=padarray(A,[1 1]);
x=[1:3]';
        y=[1:3]';
       for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
     %VECTORIZED METHOD 
       window=reshape(modifyA(i+x-1,j+y-1),[],1);
%FIND THE MINIMUM VALUE IN THE SELECTED WINDOW
        B(i,j)=min(window)
end
end
 %CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
B=uint8(B);
figure,imshow(B),title('IMAGE AFTER MIN FILTERING');

  %READ AN IMAGE
A = imread('E:\6 Sem\DIP\lake.tif');
A = rgb2gray(A(1:300,1:300,:));
figure,imshow(A),title('ORIGINAL IMAGE');
%PREALLOCATE THE OUTPUT MATRIX
B=zeros(size(A));
 
%PAD THE MATRIX A WITH ZEROS
modifyA=padarray(A,[1 1]);
 
        x=[1:3]';
        y=[1:3]';
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
      
       %VECTORIZED METHOD
       window=reshape(modifyA(i+x-1,j+y-1),[],1);
 
       %FIND THE MAXIMUM VALUE IN THE SELECTED WINDOW
        
       B(i,j)=max(window);
   
    end
end
 
%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
B=uint8(B);
figure,imshow(B),title('IMAGE AFTER MAX FILTERING');

close all
clc
A=1.8;
x=imread('lenna.jpg');
x=rgb2gray(x);
 
figure,imshow(x);
h=[0 -1 0;-1 A+4 -1;0 -1 0];
y=conv2(x,h,'same');
figure,imshow(uint8(y));
 
h=[-1 -1 -1;-1 A+8 -1;-1 -1 -1];
y=conv2(x,h,'same');
figure,imshow(uint8(y));