I1 = imread('Google1.jpg');
wa = ones(3);
Ia = round( I1(:,:,1)/3 + I1(:,:,2)/3 + I1(:,:,3)/3 );
imwrite(Ia,'G1.jpg');
Iouta = try2(Ia, wa);
imwrite(Iouta,'G1out.jpg')

wb = zeros(100,100);
wb(100,100) = 1;
Ioutb = try2(Ia, wb);
imwrite(Ioutb,'G2out.jpg')

wc = wb*0.25;
Ioutc = try2(Ia, wc);
imwrite(Ioutc,'G3out.jpg')

I2 = imread('Google_small.jpg')
Ib = round( I2(:,:,1)/3 + I2(:,:,2)/3 + I2(:,:,3)/3);
imwrite(Ib,'G2.jpg')
Ioutd = try2(Ib, wb);
imwrite(Ioutd,'G4out.jpg')

we = zeros(20,20);
we(20,20) = 1
Ioute = try2(Ib, we);

Ic = zeros(30,30)
Ic (13:18, 13:18) = ones(6,6);
wf = zeros(5,5);
wf(5,5) = 1;
Ioutf = try2(Ic, wf);
Ioutf = try2(Ic, wf);
imshow(Ioutf)
imwrite(Ioutf,'G6.jpg')

Ioutg = try2(Ic, wf,'conv');
imwrite(Ioutg,'G7.jpg')


Iouth = try2(Ic, wf,'corr',128);
imwrite(Iouth,'G8.jpg')


Id = Ic*255;
Iouti = try2(Id, wf,'corr',128);
imwrite(Iouti,'G9.jpg')

Ioutj = try2(Id, wf,'corr',128,'full');
imshow(Ioutj)
imwrite(Ioutj,'G10.jpg')