%------------------------------------------------------------%
% FRIDGE? %
% obtain fridge stock%
function [lazy_dish] = lazy(m,n,X,FS)
lazyFac = ((FS * 1.5) + 0.5);%1xf
lazyFac = sum(repmat(lazyFac,n,1),2); 
lazyFac = repmat(lazyFac',m,1) ;
lazy_dish = lazyFac .* X;

lazy_dish = (lazy_dish-ones(m,n)*mean(mean(lazy_dish)))/(max(max(lazy_dish))-min(min(lazy_dish))); %X back to -1~1
end
