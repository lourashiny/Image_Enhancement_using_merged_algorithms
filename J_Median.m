function Med_filtered = J_Median(g)

img_restored=zeros(size(g,1));
g = padarray(g,[2 2],0,'both');
[r c h]=size(g);
for i=3:r-2
    for j=3:c-2
        for k=1:3
        %for first row
        mat1=[g(i-2,j-2,k),g(i-2,j-1,k),g(i-2,j,k),g(i-2,j+1,k),g(i-2,j+2,k)];
        mat1=sort(mat1);
        mat1=mat1(3);

        %for last column
        mat2=[g(i-2,j+2,k),g(i-1,j+2,k),g(i,j+2,k),g(i+1,j+2,k),g(i+2,j+2,k)];
        mat2=sort(mat2);
        mat2=mat2(3);

        %for last row
        mat3=[g(i+2,j-2,k),g(i+2,j-1,k),g(i+2,j,k),g(i+2,j+1,k),g(i+2,j+2,k)];
        mat3=sort(mat3);
        mat3=mat3(3);

        m1=[mat1,mat2,mat3];
        m1=sort(m1);
        m1=m1(2);

        %for half of first column
        mat4=[g(i+2,j-2,k),g(i+1,j-2,k),g(i,j-2,k)];
        mat4=sort(mat4);
        mat4=mat4(2);

        %for half of middle row
        mat5=[g(i,j-2,k),g(i,j-1,k),g(i,j,k)];
        mat5=sort(mat5);
        mat5=mat5(2);

        m2= [mat4,mat5,m1];
        m2=sort(m2);
        img_restored(i-2,j-2,k)=m2(2);
        end
    end
end
Med_filtered=img_restored;
return