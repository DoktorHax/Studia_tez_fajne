%% Displaying Image Data
% This example shows how to display an image and convert it to grayscale in MATLAB(R).

%   Copyright 2014 The MathWorks, Inc.

%% Read the Image
function animacja3
% The sample file named |peppers.png| contains an RGB image.  Read the
% image into the workspace using the |imread| function.

RGB = imread('peppers.png');

%% Display the Color Image 
% Display the image data using the |imshow| function.

imshow(RGB)

%% Convert to Grayscale 
% Convert the RGB image to grayscale using the |rgb2gray| function.

gray = rgb2gray(RGB);

%% Display the Grayscale Image 
% Display the grayscale image using |imshow|.

imshow(gray)


displayEndOfDemoMessage(mfilename)
return