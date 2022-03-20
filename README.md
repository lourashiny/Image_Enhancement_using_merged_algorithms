-------------------------------Image Enhancement using Merged Algorithms---------------------------------------

The Program has 11 files that is needed to run it.
1. All J_*.m files
2. Evaluation.m files for perfomance metrics calculation
3. Adjust_int.m for adjusting intensity values of image.
4. meanAbsoluteError.m, MSE3D.m and rmse.m are needed to calculate the performance metrics.

Flow of the program files:

	- J_Final.m is the main function file. We only have to start running this file to get all the outputs. J_Final imports all the other files those are needed for the actions needed to perform.
	
	- J_Final program starts by reading a colour image of any size and converting it to double for calcuation. Display the original image 3 times fo three figure window.
	
	- After Reading the colour image the image is degraded by add blur to it by convolving the image with a motion blur psf function. Noise of our choice (in our work speckle, salt & pepper and gausssian) is added to the blurred image to obtain the final degraded image. Display the degraded image three times in three figure window.
	
	- The degraded image is passed to all the J_<low-pass filter name>(g) functions first and the obtained image's intensity is adjusted and then displayed in figure window 2.
	
	- Then, the degraded image is passed to all the J_<High-pass filter name>(g,h,<signal_var>) functions and the obtained image is adjusted and displayed in figure window 1.
	
	- Finally, the degraded image is passed to all the J_<Merged filter name>() functions to enhance the image and the resultant image is adjusted and displayed accordingly in figure window 3.
	
	- After enhancing the image, the evaluation for the performance metrics happen. Evaluation is split based on the three low pass filters. There are three tables with comparison on how a Clock-Wise low pass filter performs compared to High-pass filter and Merged Filter. The function Evaluation(<low-pass>,<high-pass1>,<high-pass2>,<low+high_pass1>,<low+high_pass2>).
	




