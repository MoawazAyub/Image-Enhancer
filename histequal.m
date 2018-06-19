img = imread('PgaNb.png');

try
greyimg = rgb2gray(img);
catch
greyimg = img;
end

[dimx,dimy] = size(greyimg);

freq = imhist(greyimg);

totalpx = dimx*dimy;

pdf     = zeros(256,1);
cdf     = zeros(256,1);
newfreq = zeros(256,1);
newfreq2 = zeros(256,1);

for i=1:1:256
    pdf(i) = freq(i)/totalpx;
	
end

cdf(1) = pdf(1);
for i=2:1:256
    cdf(i) = pdf(i)+cdf(i-1);
	
end

%---------------------------------changeable code

for i=1:1:256
    newfreq(i) = cdf(i) * 255;
	
end

for i=1:1:256
    newfreq2(i) = (cdf(i) - min(cdf)) * (255/(max(cdf)-min(cdf)));
	
end

%---------------------------------end
%greyimg(i,j) = newfreq(j + (i-1)*dimy) - 1;

%----------------------------------Difficult
tempr = greyimg;
for i=1:1:dimx
 for j = 1:1:dimy
   greyimg(i,j) = newfreq2(greyimg(i,j)+1);
 end
	
end


%----------------------------------end

figure, imshow(tempr);
figure, imshow(greyimg);