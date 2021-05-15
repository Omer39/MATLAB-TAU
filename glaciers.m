%% Exercise 2: 
% bearGlacier1980 & bearGlacier2011
% Code source: https://matlabacademy.mathworks.com/R2021a/portal.html?course=mlip
% Location of Bear Glacier region Latitude: 59.9569, Longitude: -149.5823


clc, clear all, close all;

info1980 = imfinfo("bearGlacier1980.png")
taken1980 = info1980.CreationTime;

info2011 = imfinfo("bearGlacier2011.png")
taken2011 = info2011.CreationTime;

info1980 = imfinfo("bearGlacier1980.png");
type1980 = info1980.ColorType
info2011 = imfinfo("bearGlacier2011.png")
type2011 = info2011.ColorType

% Import the image of Bear Glacier from 1980 
% and save the indexed image as glacier1980 and the map as map1980.

[glacier1980,map1980] = imread("bearGlacier1980.png");
imshow(glacier1980,map1980)
title("Bear Glacier in 1980")

[glacier1980,map1980] = imread("bearGlacier1980.png");
imshow(glacier1980,map1980)
title("Bear Glacier in 1980")

[glacier2011,map2011] = imread("bearGlacier2011.png");
imshow(glacier2011,map2011)
title("Bear Glacier in 2011")

gs1980 = ind2gray(glacier1980,map1980);
gs2011 = ind2gray(glacier2011,map2011);

imshowpair(gs1980,gs2011,"montage")
title("Bear Glacier Comparison - 1980-2011")

% How many colours do you think are necessary?
[I,m] = imapprox(glacier1980,map1980,2);
imshow(I,m)

%%

[glacier1980,map1980] = imread("bearGlacier1980.png");
[glacier2011,map2011] = imread("bearGlacier2011.png");

gs1980 = ind2gray(glacier1980,map1980);
gs2011 = ind2gray(glacier2011,map2011);

imshowpair(gs1980,gs2011,"montage")
title("Bear Glacier Comparison - 1980-2011")

imwrite(ind1980,m2_1980,"indGlacier1980.png")
imwrite(ind2011,m2_2011,"indGlacier2011.png")


%You can also save several images at once to a MAT-file. 
save gsGlaciers gs1980 gs2011
clear
load gsGlaciers.mat
imshowpair(gs1980,gs2011,"montage")

%% Working with Binary Images

[glacier1980,map80] = imread("bearGlacier1980.png");
gs1980 = ind2gray(glacier1980,map80);
gs1980 = im2double(gs1980);

[glacier2011,map11] = imread("bearGlacier2011.png");
gs2011 = ind2gray(glacier2011,map11);
gs2011 = im2double(gs2011);

diffIce = gs1980 - gs2011;
diffIce = rescale(diffIce);
imshowpair(gs1980,gs2011,"montage")
imshow(diffIce)

%Threshold
ice1980 = diffIce>.7;
imshow(ice1980)

ice2011 = diffIce<.3;
imshow(ice2011)


iceAmt1980 = nnz(ice1980)
numPixels = numel(ice1980)
melt = iceAmt1980/numPixels*100


%% Creating Binary Images for Comparison
[glacier1980,map1980] = imread("bearGlacier1980.png");
gs1980 = ind2gray(glacier1980,map1980);

[glacier2011,map2011] = imread("bearGlacier2011.png");
gs2011 = ind2gray(glacier2011,map2011);
imshowpair(gs1980,gs2011,"montage")

%
bw1980 = imbinarize(gs1980);
imshow(bw1980)

bw2011 = imbinarize(gs2011);
imshow(bw2011)

imshowpair(bw1980,bw2011)

iceAmt1980 = nnz(bw1980)
iceAmt2011 = nnz(bw2011)
melt = (iceAmt2011 - iceAmt1980)/iceAmt1980*100

% Try adaptive option
bw1980ad = imbinarize(gs1980,"adaptive");
imshow(bw1980ad)