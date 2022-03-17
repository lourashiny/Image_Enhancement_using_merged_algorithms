function Mean_filtered=J_Mean(g)

img_restored=zeros(size(g,1)); %empty image matrix
g = padarray(g,[2 2],0,'both');
[r,c,h]=size(g);
for i=3:r-2
    for j=3:c-2
        for k=1:3
        %for first row
        mat1=[g(i-2,j-2,k),g(i-2,j-1,k),g(i-2,j,k),g(i-2,j+1,k),g(i-2,j+2,k)];
        mat1=sum(mat1)/5;
        
        %for last column
        mat2=[g(i-2,j+2,k),g(i-1,j+2,k),g(i,j+2,k),g(i+1,j+2,k),g(i+2,j+2,k)];
        mat2=sum(mat2)/5;

        %for last row
        mat3=[g(i+2,j-2,k),g(i+2,j-1,k),g(i+2,j,k),g(i+2,j+1,k),g(i+2,j+2,k)];
        mat3=sum(mat3)/5;
        
        %mode of mat1,mat2,mat3
        m1=[mat1,mat2,mat3];
        m1=sum(m1)/3;
        
        %for half of first column
        mat4=[g(i+2,j-2,k),g(i+1,j-2,k),g(i,j-2,k)];
        mat4=sum(mat4)/3;

        %for half of middle row
        mat5=[g(i,j-2,k),g(i,j-1,k),g(i,j,k)];
        mat5=sum(mat5)/3;

        %mode of mat1,mat2,mat3,mat4,mat5
        m2= [m1,mat4,mat5];
        m2=sum(m2)/3;
        
        img_restored(i-2,j-2,k)=m2;
        end
    end
end
Mean_filtered=img_restored;
return