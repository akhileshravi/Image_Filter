function  g = imfilter_16110007( f , w, varargin)
%function g = try2(f, w, filtering_mode = 'corr', boundary_options = 0, size_options = 'same')

Defaults = {'corr', 0, 'same'};
Defaults(1:nargin-2) = varargin;

filtering_mode = cell2mat(Defaults(1));
boundary_options = cell2mat(Defaults(2));
size_options = cell2mat(Defaults(3));


if (filtering_mode == 'corr')
    w1 = w;
else
    w1 = zeros(size(w));
    wX = size(w,1);
    for i = 1:wX
        w1(i,:) = w(wX-i+1,end:-1:1);
    end
end


[fx, fy] = size(f);
f1 = createimage(f,w1,boundary_options);

I = f1;
for i = 1:fx
    for j = 1:fy
        I(i,j) = mult(f1,i,j,w1);
    end
end

s = sum(sum(I));
c = sum(sum(I==1));
binary_flag = 0;
if s == c
    binary_flag = 1;
end


if(size_options == 'same')
    g = I(1:fx,1:fy);
else
    g = I;
end

if binary_flag == 0
    g = uint8(g);
end

end
