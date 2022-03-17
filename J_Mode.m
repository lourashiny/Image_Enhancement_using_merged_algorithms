function mode_filtered = J_Mode(g) 
img_restored=zeros(size(g,1)); %empty image matrix
g = padarray(g,[2 2],0,'both');
[r,c,h]=size(g);
for i=3:r-2
    for j=3:c-2
        for k=1:3
        %for first row
        mat1=[g(i-2,j-2,k),g(i-2,j-1,k),g(i-2,j,k),g(i-2,j+1,k),g(i-2,j+2,k)];
        mat1=mode(mat1(:));
        
        %for last column
        mat2=[g(i-2,j+2,k),g(i-1,j+2,k),g(i,j+2,k),g(i+1,j+2,k),g(i+2,j+2,k)];
        mat2=mode(mat2(:));

        %for last row
        mat3=[g(i+2,j-2,k),g(i+2,j-1,k),g(i+2,j,k),g(i+2,j+1,k),g(i+2,j+2,k)];
        mat3=mode(mat3(:));
        
        %mode of mat1,mat2,mat3
        m1=[mat1,mat2,mat3];
        m1=mode(m1(:));
        
        %for half of first column
        mat4=[g(i+2,j-2,k),g(i+1,j-2,k),g(i,j-2,k)];
        mat4=mode(mat4(:));

        %for half of middle row
        mat5=[g(i,j-2,k),g(i,j-1,k),g(i,j,k)];
        mat5=mode(mat5(:));

        %mode of mat1,mat2,mat3,mat4,mat5
        m2= [m1,mat4,mat5];
        m2=mode(m2(:));
        
        img_restored(i-2,j-2,k)=m2;
        end
    end
end 
mode_filtered=img_restored;
return