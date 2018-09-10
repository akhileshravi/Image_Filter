function val = mult(f1,x,y,w1)
[w1x, w1y] = size(w1);
temp = f1(x:x+w1x-1, y:y+w1y-1);
val = sum(sum(temp.*w1));
end