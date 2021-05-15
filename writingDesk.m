%% Exercise 1

% This code is adapted from Hyung Jin Chang's Robot Vision assignments
% Recommended tutorial links
% https://www.mathworks.com/learn/tutorials/matlab-onramp.html
% https://www.coursera.org/learn/matlab

clc, clear all,close all;

I=imread('Writing_desk.jpg');
imshow(I);
title('Writing Desk')


%% Q2.2

%Find coordinates

% vase=I(270:495,511:628,1:3);
% painting=I(...
% statuettes=I(...
figure;
imshow(vase)
title('vase')
figure;
imshow(painting)
title('painting')
figure;
imshow(statuettes)
title('statuettes')
%% Q2.3

statuettesRed=statuettes(:,:,1);
statuettesGreen=statuettes(:,:,2);
statuettesBlue=statuettes(:,:,3);
figure
imshow(statuettesRed)
title('statuettesRed')
figure
imshow(statuettesGreen)
title('statuettesGreen')
figure
imshow(statuettesBlue)
title('statuettesBlue')
%% Q2.4
% 0.299 * R + 0.587 * G + 0.114 * B (formulation from rgb2gray function)
statuettesGray= 0.299*double(statuettesRed)+0.587*double(statuettesGreen)...
    +0.114*double(statuettesBlue);

statuettesGray = int8(statuettesGray);
figure
imshow(statuettesGray)
title('Statuettes in Gray Scale')
%% Q2.5
%Remapped painting form RGB to BRG
paintingRemapped=cat(3, painting(:,:,3), painting(:,:,1), painting(:,:,2));

figure
imshow(paintingRemapped)
title('"PAINTING" RGB to BRG')