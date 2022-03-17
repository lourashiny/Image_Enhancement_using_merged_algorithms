function Mean_Square_Error_3D= MSE3D(ReferenceImage3D, TransformedImage3D)

% Takes two images (3D) and returns Mean Square Error 
% Be aware Matrix dimensions must agree

% written by Amir Pasha Mahmoudzadeh
% University of California, San Francisco
% Biomedical Imaging Lab


%{
ReferenceImage3D = double(ReferenceImage3D);
TransformedImage3D=double(TransformedImage3D);
%}


[R,C,H] = size(ReferenceImage3D);
Error= (TransformedImage3D - ReferenceImage3D).^2;
Mean_Square_Error_3D = sum(Error(:))/(R*C*H);

end

