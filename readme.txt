Copyright 2021-2022 Raducanu George-Cristian 311CA

Topic 2 - Numerical Methods

For the first 2 tasks I respected the structure, the code skeleton provided, and for the last sub-point of the problem
I used the pseudocode provided in pdf.

Task 1 - Proximal interpolation

For this task I implemented the functions from the skeleton:
-proximal_2x2 that applies proximal interpolation on a 2x2 black-and-white image considering equidistant points with
the STEP step between them
-proximal_2x2_RGB achieves the same thing as the previous function only on color images, applying it
on each color channel
-proximal_resize resizes a black and white image to the dimensions given as a parameter, first by scaling
and then by means of proximal interpolation determine the corresponding value
-proximal_resize_RGB is used by the previous function applied to each channel to "resize" an image
dye
-proximal_rotate rotates a black and white image using an appropriate rotation matrix -rotation_angle, and then
by means of interpolation it approximates the value in the final image
-proximal_rotate_RGB rotates a color image by applying the previous function on each color channel.

Task 2 - Bicubic interpolation

For task 2, I created the following functions from the skeleton:
-fx, fy, fxy, precalc_d which calculates and provides the derivatives dx, dy and dxy of each point in the image using
of "derivatives" as finite differences
-bicubic_coef calculates, according to the definition, the matrix of bicubic interpolation coefficients between 4 points (placed in rectangles)
provided as parameters
-bicubic_resize resizes a black and white image to pxq dimensions first by scaling and then applying interpolation
bicubic to approximate the pixel value
-bicubic_resize_RGB is the analogue of the previous function only on color images, using the previous function on each channel

Task 3 - Lanczos interpolation

For task 3, I implemented the required algorithms from the pseudocode in Octave, taking into account the clarifications made on the forum:
-The asymmetric Lanczos block algorithm
- The Lanczos-type rational block algorithm
- The Lanczos algorithm of rational block of adaptive order

Feedback:
The first 2 tasks were ok, having a skeleton, and the last task was more difficult because I didn't have a skeleton, but
the fact that I had the pseudocode in pdf helped a lot.
