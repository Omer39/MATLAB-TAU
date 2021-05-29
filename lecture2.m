%% The Mean and Median Filter for  the image with Salt and Paper Noise

clc,close all,clear all;
% Picture credit
%https://spectrum.ieee.org/slideshow/robotics/industrial-robots/meet-the-robots-of-fukushima-daiichi

Image = imread('Fukushima.jpg');%RGB image
Image = rgb2gray(Image); %grayscale image
noisyImage = imnoise(Image,'salt & pepper',.15);

%Define the row and column of the filter
M=3;
N=3;

%Expand the matrix to apply the filters
paddedA=padarray(noisyImage,[floor(M/2),floor(N/2)]);

MedianFilteredImage = zeros([size(Image,1) size(Image,2)]);
MeanFilteredImage = zeros([size(Image,1) size(Image,2)]);

for i = 1:size(paddedA,1)-(M-1)
    for j = 1:size(paddedA,2)-(N-1)
        temp = paddedA(i:i+(M-1),j:j+(N-1),:);
        MedianFilteredImage(i,j)=median(temp(:));%MEDIAN
        MeanFilteredImage(i,j)=mean(temp(:)); %MEAN
    end
end
%add a function
% [0 255] range

MedianFilteredImage = uint8(MedianFilteredImage);
MeanFilteredImage = uint8(MeanFilteredImage);

figure,
subplot(2,2,1)
imshow(Image),title('Original Image');
subplot(2,2,2)
imshow(noisyImage),title('the image with Salt and Paper Noise');
subplot(2,2,3)
imshow(MedianFilteredImage),title('IMAGE AFTER MEDIAN FILTERING');
subplot(2,2,4)
imshow(MeanFilteredImage),title('IMAGE AFTER MEAN FILTERING');
