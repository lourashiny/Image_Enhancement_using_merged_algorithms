function adjusted_img = Adjust_int(img_res,g)

inten=0.001;
adjusted_img=zeros(size(g));
max_psnr=psnr(adjusted_img,g);
img_temp=img_res;
while inten < 0.1
    img_temp=img_temp+inten;
    tmp_psnr=psnr(img_temp,g);
    if tmp_psnr > max_psnr
        max_psnr=tmp_psnr;
        adjusted_img=img_temp;
    end
    inten=inten+0.001;
end 
return