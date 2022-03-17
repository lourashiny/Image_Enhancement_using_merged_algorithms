function Wnr_filtered = J_Wiener(g,h,signal_var)

Wnr_filtered=zeros(size(g));
max_psnr=psnr(Wnr_filtered,g);
noise_var=0.001;
while noise_var < 0.01
    NSR = noise_var / signal_var;
    img_temp=deconvwnr(g,h,NSR);
    tmp_psnr=psnr(img_temp,g);
    if tmp_psnr > max_psnr
        max_psnr=tmp_psnr;
        Wnr_filtered=img_temp;
    end
    noise_var=noise_var+0.001;
end

return