% To save users' meal history in the past few days %
function [meal_hist] = mealHist(lazy_dish,C,n,m)
%last, second last etc%
mh = zeros (4,n); 
mh = [C;mh];
mh = mh(1:4,:); 
fac = [0.01;0.33;0.5;0.9];
fac = repmat(fac,1,n);
mh = mh.*fac;  %meal_hist is 4 x n
mh (mh == 0) =1; 
mh = min(mh); %1 x n
mh = repmat(mh,m,1); %m by n
meal_hist = mh .* lazy_dish;
meal_hist = (meal_hist-ones(m,n)*mean(mean(meal_hist)))/(max(max(meal_hist))-min(min(meal_hist))); 
end