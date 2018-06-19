img = imread('PgaNb.png');

try
greyimg = rgb2gray(img);
catch
greyimg = img;
end

[dimx,dimy] = size(greyimg);

freq = imhist(greyimg);

totalpx = dimx*dimy;


%newfreq = zeros(256,1);



%---------------------------------finding min grey level

maxgreylevel = 0;

for i = 1:1:256

  if freq(i) ~= 0
   maxgreylevel = i;
  
  end

end


%------------------------------------

%---------------------------------finding max grey level
mingreylevel = 255;

for i = 256:-1:1

  if freq(i) ~= 0
   mingreylevel = i;
  
  end

end


%------------------------------------

%--------------------------slope
slope = 255/((maxgreylevel-1)-(mingreylevel-1));
%--------------------------

%----------------------------------Difficult
tempr = greyimg;
for i=1:1:dimx
 for z = 1:1:dimy
   greyimg(i,z) = (greyimg(i,z)-(mingreylevel-1))*slope;
 end
	
end


%----------------------------------end

figure, imshow(tempr);
figure, imshow(greyimg);

