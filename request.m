% REQUEST %

function [out] = request(healthy_dishes,dd,ff,n,m,f,D)
requested_f = healthy_dishes;
requested_d = healthy_dishes;

request1 = [input('Any special requirements for features? ')];


%if size(request_feat) > 1;
	%for i = 2:size(request_feat)
	%	request_feat = request_feat + find(strcmp(ff,request1(i)));
	%end
%end

if request1 ~=0;
	request_feat = zeros(1,f);
	request_feat(1,request1) = 1;
	request_feat = repmat(request_feat,n,1); %n by f
	request_feat = request_feat .* D;
	request_feat = sum(request_feat,2)'; %1 by n
	ind = find(request_feat);
	b = randperm(length(ind));	
	requested_f = ones(m,n);
	requested_f (:,ind(b(1))) = 1000; %m x n
	requested_f = (requested_f .+ healthy_dishes);
end

request2 = [input('Any special requirements for dishes? ')];
%if size(request_dish) > 1;
	%for i = 2:size(request_dish)
	%	request_dish = request_dish + find(strcmp(ff,request2(i)));
	%end
%end

if request2 ~=0
	request_dish = zeros(1,n);
	request_dish(1,request2) = 1; 
	request_dish = 1000 * repmat(request_dish,m,1); %m x n
%	request_dish (request_dish == 0) = 1;
	requested_d = (request_dish .+ healthy_dishes);

end
out = (requested_f+requested_d);
out = (out-ones(m,n)*mean(mean(out)))/(max(max(out))-min(min(out)));

end