close all
clc
x=imread('child.jpg');
imshow(x)
x=rgb2gray(x);
figure,imshow(x)
y=fft2(x);
%figure,imshow(abs(y))
%y=fftshift(y);
z=zeros(347,490);
%z(150:170,220:250)=y(150:170,220:250);
 
%z1=fftshift(z1);
%z(1:50,1:50)=y(1:50,1:50);
%z(1:100,1:100)=y(1:100,1:100);
z(1:300,1:300)=y(1:300,1:300);
%z=y;
z1=ifft2(z);
figure,imshow(uint8(z1))

Clc
close all
clear all
 x=imread('cameraman.jpg');
figure,imshow(x)
x1=fft2(x);
 %y=imread('tracy.tif');
y=imread('lena.png');
%y=imread('boat.png');
figure,imshow(y)
y1=fft2(y);
 z=abs(x1).*exp(j.*angle(y1));
z1=ifft2(z);
figure,imshow(uint8(z1));
title('Magnitude of cameraman with phase of Lena');
z=abs(y1).*exp(j.*angle(x1));
z1=ifft2(z);
figure,imshow(uint8(z1));
title('Magnitude of Lena with phase of cameraman');

Clc
close all
clear all
 
x=imread('cameraman.jpg');
figure,imshow(x)
x1=fft2(x);
x1(1,1)=0;
x2=ifft2(x1);
figure,imshow(uint8(x2))
title('DC value=0')
x1(1,1)=1.5559e+007;
x2=ifft2(x1);
figure,imshow(uint8(x2))
title('DC value=50%')

close all
clc
x=imread('child.jpg');
imshow(x)
x=rgb2gray(x);
figure,imshow(x)
y=dct2(x);
figure,imshow(uint8(y))
%y2=10*log(1+abs(y));
figure,mesh(y)
 
z=zeros(347,490);
z(1:20,1:20)=y(1:20,1:20);
figure,imshow(uint8(z))
y1=idct2(z);
figure,imshow(uint8(y1));
 
z(1:50,1:50)=y(1:50,1:50);
figure,imshow(uint8(z))
y1=idct2(z);
figure,imshow(uint8(y1));
 
z(1:100,1:100)=y(1:100,1:100);
figure,imshow(uint8(z))
y1=idct2(z);
figure,imshow(uint8(y1));
 
z(1:150,1:250)=y(1:150,1:250);
figure,imshow(uint8(z))
y1=idct2(z);
figure,imshow(uint8(y1))

Clc
close all
clear all
 x=imread('cameraman.jpg');
figure,imshow(x)
x1=fft2(x);
x1(1,1)=0;
x2=ifft2(x1);
figure,imshow(uint8(x2))
title('DC value=0')
x1(1,1)=1.5559e+007;
x2=ifft2(x1);
figure,imshow(uint8(x2) 
title('DC value=50%’)

clc;
close all;
clear all;
I=imread('C:\Users\nikil\Desktop\th1.jpg');
I=im2double(I);
m=1;
for i=1:8:256
    for j=1:8:256
        for x=0:7
            for y=0:7
            img(x+1,y+1)=I(i+x,j+y);
            end
        end
            k=0;
            for l=1:8
                img_expect{k+1}=img(:,l)*img(:,l)';
                k=k+1;
            end
            imgexp=zeros(8:8);
            for l=1:8
                imgexp=imgexp+(1/8)*img_expect{l};%expectation of E[xx']
            end
            img_mean=zeros(8,1);
            for l=1:8
                img_mean=img_mean+(1/8)*img(:,l);
            end
            img_mean_trans=img_mean*img_mean';
            img_covariance=imgexp - img_mean_trans;
            [v{m},d{m}]=eig(img_covariance);
            temp=v{m};
             m=m+1;
            for l=1:8
                v{m-1}(:,l)=temp(:,8-(l-1));
            end
             for l=1:8
           trans_img1(:,l)=v{m-1}*img(:,l);
             end
           for x=0:7
               for  y=0:7
                   transformed_img(i+x,j+y)=trans_img1(x+1,y+1);
               end
           end
mask=[1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 
      1 1 1 1 1 1 1 1 ];
  trans_img=trans_img1.*mask;
           for l=1:8
           inv_trans_img(:,l)=v{m-1}'*trans_img(:,l);
           end
            for x=0:7
               for  y=0:7
                  inv_transformed_img(i+x,j+y)=inv_trans_img(x+1,y+1);
               end
           end
          end
  end
  imshow(transformed_img);
  figure
  imshow(inv_transformed_img);
