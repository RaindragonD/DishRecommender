
function [out] = special(res,C)
%------------------------------------------------------------%
load('weights.mat');
X = res;
n = 16;
m = 4;
f = 49;

% input dishList
fid = fopen('dish_ids.txt');
k = 16;  % Total number of dishes
dd = cell(k, 1);
for i = 1:k
    line = fgets(fid);
    [~, dishName] = strtok(line, ' ');
    dd{i} = strtrim(dishName);
end
fclose(fid);

fid = fopen('featureNames.txt');
k = 49;  % Total number of dishes
ff = cell(k, 1);
for i = 1:k
    line = fgets(fid);
    [~, featureName] = strtok(line, ' ');
    ff{i} = strtrim(featureName);
end
fclose(fid);

FS = [0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,0,0,0,0,1,0,0,1,0,0,1,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0];

%------------------------------------------------------------%
% save input choices %

%C = [0,1,0,0,1,0,0,0,0,0,1,1,0,0,1,0;
%    0,0,0,0,0,0,0,0,1,1,0,0,1,1,0,0;
%    1,0,0,1,0,0,1,1,0,0,1,1,0,0,0,0;
%    0,0,0,1,0,1,0,0,1,0,0,1,0,0,0,1];

%------------------------------------------------------------%
lazy_dish = lazy(m,n,X,FS);
meal_hist = mealHist(lazy_dish,C,n,m);
healthy_dishes = healthyMode(meal_hist,D,n,m,f);
out = request(healthy_dishes,dd,ff,n,m,f,D);

end