function Inv_filtered = J_Inverse(g,h)
G=fftshift(fft2(g));
%{
subplot(2,2,3);
imshow(log(abs(G)),[]);
title("IMG Spectrum");
%}
N=size(g,1);
h=ifftshift(h);
H=fftshift(fft2(h,N,N));
%{
subplot(2,2,4);
imshow(log(abs(H)),[]);
title("PSF spectrum");
%}
F=zeros(size(g));
R=35;

for u=1:size(g,2)
    for v=1:size(g,1)
        du= u - size(g,2)/2;
        dv= v - size(g,1)/2;
        if du^2 + dv^2 <=R^2
            F(v,u,:) = G(v,u,:)./H(v,u);
        end
    end
end

%figure;
%imshow(log(abs(F)),[]);

fRestored = real(ifft2(ifftshift(F)));
Inv_filtered = fRestored;
return