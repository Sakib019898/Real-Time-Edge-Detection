function [ I3 ] = edgeDetectMean( I )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
se= [ 1 1 1;
      1 1 1;
      1 1 1;
      ];

  SE=strel('diamond',2);
  I=imclose(I,SE);
[row, col]=size(I);

I2=double(I);
I3=I;

for i= 2:row-1
    for j= 2:col-1
        s=double(I(i,j));
        se= [abs(I2(i-1,j-1)-s) abs(I2(i-1,j)-s) abs(I2(i-1,j+1)-s);
              abs(I2(i,j-1)-s)  abs(I2(i,j)-s) abs(I2(i,j+1)-s);
              abs(I2(i+1,j-1)-s) abs(I2(i+1,j)-s) abs(I2(i+1,j+1)-s)
              ];  
          sum=0;
          for k=1:3
              for l=1:3
                  sum=sum+se(k,l);
              end
          end
         
          mean=sum/6;
          
          I3(i,j)=mean;
          
    end
end
SE1=strel('diamond',1);
  
I3=imdilate(I3,SE1);
end

