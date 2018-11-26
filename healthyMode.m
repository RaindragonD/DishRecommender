% MODE %
function [healthy_dishes] = healthyMode(meal_hist,D,n,m,f)
health = input('Healthy Mode? '); %1 or 0 
healthFac = zeros(1,f);
healthFac (41:49)= 1 ; %healthFac is 1 x f
if health == 1;
	healthFac = repmat(healthFac,n,1); %n x f
	healthy = healthFac .* D; %n x f same as D
    healthy = (10*sum(healthy,2))'; %1 x n 
    healthy = repmat(healthy,m,1); %m x n
    healthy_dishes = healthy .+ meal_hist;
    healthy_dishes = (healthy_dishes-ones(m,n)*mean(mean(healthy_dishes)))/(max(max(meal_hist))-min(min(meal_hist))); 
end
if health == 0;
    healthy_dishes = meal_hist;
end
end