M = [0 0 0 0 0 0 0 0;
     1 1 1 1 1 1 1 0;
     0 0 0 1 1 1 1 0;
     0 0 0 1 1 1 1 0
     0 0 1 1 1 1 1 0
     0 0 0 1 1 1 1 0
     0 0 1 1 0 0 0 0
     0 0 0 0 0 0 0 0];
 
se = strel('diamond', 5);
x = imerode(M, se);
y = erosion(M, se.Neighborhood);
disp(isequal(x,y));
x = imdilate(M, se);
y = dilation(M, se.Neighborhood);
disp(isequal(x,y));

se = strel('diamond', 6);
x = imerode(M, se);
y = erosion(M, se.Neighborhood);
disp(isequal(x,y));
x = imdilate(M, se);
y = dilation(M, se.Neighborhood);
disp(isequal(x,y));

se = strel('disk', 5);
x = imerode(M, se);
y = erosion(M, se.Neighborhood);
disp(isequal(x,y));
x = imdilate(M, se);
y = dilation(M, se.Neighborhood);
disp(isequal(x,y));

se = strel('disk', 6);
x = imerode(M, se);
y = erosion(M, se.Neighborhood);
disp(isequal(x,y));
x = imdilate(M, se);
y = dilation(M, se.Neighborhood);
disp(isequal(x,y));

se = strel('line', 7, 0);
x = imerode(M, se);
y = erosion(M, se.Neighborhood);
disp(isequal(x,y));
x = imdilate(M, se);
y = dilation(M, se.Neighborhood);
disp(isequal(x,y));

se = strel('rectangle', [3 3]);
x = imerode(M, se);
y = erosion(M, se.Neighborhood);
disp(isequal(x,y));
x = imdilate(M, se);
y = dilation(M, se.Neighborhood);
disp(isequal(x,y));

se = strel('square', 1);
x = imerode(M, se);
y = erosion(M, se.Neighborhood);
disp(isequal(x,y));
x = imdilate(M, se);
y = dilation(M, se.Neighborhood);
disp(isequal(x,y));

se = strel('square', 5);
x = imerode(M, se);
y = erosion(M, se.Neighborhood);
disp(isequal(x,y));
x = imdilate(M, se);
y = dilation(M, se.Neighborhood);
disp(isequal(x,y));