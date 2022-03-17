clear 
close all
clc
import J_Inverse.*; %importing inverse filter function
import J_Median.*;  %importing proposed median filtering function
import J_Wiener.*;  %importing Wiener filtering function
import J_Mode.*; %importing Mode filtering function
import J_Mean.*; %importing Mean filtering function
import Adjust_int.*; %Adjusting intensity values by adding constant
import Evaluation.*; %Evaluation metrics 
import rmse.*;
import meanAbsoluteError.*;
import MSE3D.*;

in_img = im2double(imread("input\lena_color_512.tif"));
figure(1),subplot(2,2,1),imshow(in_img),title("Original");
figure(2),subplot(2,3,1),imshow(in_img),title("Original");
figure(3),subplot(2,4,1),imshow(in_img),title("Original");
imshow(in_img);
title("Original");
sz=size(in_img,1);

% Adding Motion Blur and Noise
h=fspecial('motion',10,45); % PSF to add motion blur
blur_img = imfilter(in_img,h,"conv");
%g=imnoise(blur_img,'salt & pepper'); 
%g=imnoise(blur_img,'speckle');
g=imnoise(blur_img,'gaussian'); % Adding noise to the blur_img image
figure(1),subplot(2,2,2),imshow(g,[]),title("Degraded");
figure(2),subplot(2,3,2),imshow(g,[]),title("Degraded");
figure(3),subplot(2,4,2),imshow(g,[]),title("Degraded");


%Calling Proposed median filter
imgRestored_med = J_Median(g);
imgRestored_med = Adjust_int(imgRestored_med,g);%added
figure(2);
subplot(2,3,3);
imshow(imgRestored_med,[]);
title("CW Median filtered");

%Mode Filtering
imgRestored_mode = J_Mode(g);
imgRestored_mode = Adjust_int(imgRestored_mode,g);
figure(2);
subplot(2,3,4);
imshow(imgRestored_mode,[]);
title("CW Mode filtered");

%Mean Filtering
imgRestored_mean = J_Mean(g);
imgRestored_mean = Adjust_int(imgRestored_mean,g);
figure(2);
subplot(2,3,5);
imshow(imgRestored_mean,[]);
title("CW Mean filtered");

% Calling Inverse filter
imgRestored_inv = J_Inverse(g,h);
figure(1);
subplot(2,2,3);
imshow(imgRestored_inv,[]);
title("Inverse filtered");

%Wiener filtering
signal_var = var(in_img(:));
imgRestored_wnr = J_Wiener(g,h,signal_var);
imgRestored_wnr = Adjust_int(imgRestored_wnr,g);
figure(1)
subplot(2,2,4);
imshow(imgRestored_wnr,[])
title("Wiener filtered");

%Merged Inverse+Median filtering
imgRestored_med_inv = J_Median(imgRestored_inv);
figure(3);
subplot(2,4,3);
imshow(imgRestored_med_inv,[])
title("Inverse+CW Median filtered");

%Merged Wiener+Median filtering
imgRestored_med_wnr = J_Median(imgRestored_wnr);
imgRestored_med_wnr = Adjust_int(imgRestored_med_wnr,g);
figure(3);
subplot(2,4,4);
imshow(imgRestored_med_wnr,[])
title("Wiener+CW Median filtered");

%Merged Inverse+Mode Filtering
imgRestored_mode_inv = J_Mode(imgRestored_inv);
imgRestored_mode_inv  = Adjust_int(imgRestored_mode_inv,g);
figure(3);
subplot(2,4,5);
imshow(imgRestored_mode_inv,[])
title("Inverse+CW Mode filtered");

%Merged Wiener+Mode Filtering
imgRestored_mode_wnr = J_Mode(imgRestored_wnr);
imgRestored_mode_wnr  = Adjust_int(imgRestored_mode_wnr,g);
figure(3);
subplot(2,4,6);
imshow(imgRestored_mode_wnr,[])
title("Wiener+CW Mode filtered");

%Merged Inverse+Mean Filtering
imgRestored_mean_inv = J_Mean(imgRestored_inv);
imgRestored_mean_inv = Adjust_int(imgRestored_mean_inv,g);
figure(3);
subplot(2,4,7);
imshow(imgRestored_mean_inv,[])
title("Inverse+CW Mean filtered");

%Merged Wiener+Mean Filtering
imgRestored_mean_wnr = J_Mean(imgRestored_wnr);
imgRestored_mean_wnr = Adjust_int(imgRestored_mean_wnr,g);
figure(3);
subplot(2,4,8);
imshow(imgRestored_mean_wnr,[])
title("Wiener+CW Mean filtered");


%Performance Metrics calculation%

%Median Merge Metrics
tab_data=Evaluation(imgRestored_med,imgRestored_inv,imgRestored_wnr,imgRestored_med_inv,imgRestored_med_wnr,g);
col=["Clock-Wise Median Filter","Inverse Filter","Wiener filter","CW_Median+Inverse","CW_Median+Wiener"];
row=["Entropy","RMSE","MAE","PSNR","MSE"];
figure('Name','Median+High Pass Evaluation','NumberTitle','off');
uitable('FontSize',12,'columnname',col,'rowname',row,'position',[25 25 620 620],'data',tab_data);

%Mode Merge Metrics
tab_data=Evaluation(imgRestored_mode,imgRestored_inv,imgRestored_wnr,imgRestored_mode_inv,imgRestored_mode_wnr,g);
col=["Clock-Wise Mode Filter","Inverse Filter","Wiener filter","CW_Mode+Inverse","CW_Mode+Wiener"];
row=["Entropy","RMSE","MAE","PSNR","MSE"];
figure('Name','Mode+High Pass Evaluation','NumberTitle','off');
uitable('FontSize',12,'columnname',col,'rowname',row,'position',[25 25 620 620],'data',tab_data);

%Mean Merge Metrics
tab_data=Evaluation(imgRestored_mean,imgRestored_inv,imgRestored_wnr,imgRestored_mean_inv,imgRestored_mean_wnr,g);
col=["Clock-Wise Mean Filter","Inverse Filter","Wiener filter","CW_Mean+Inverse","CW_Mean+Wiener"];
row=["Entropy","RMSE","MAE","PSNR","MSE"];
figure('Name','Mean+High Pass Evaluation','NumberTitle','off');
uitable('FontSize',12,'columnname',col,'rowname',row,'position',[25 25 618 620],'data',tab_data);

