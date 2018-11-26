function [rec] = cofi (X, R, P, D)

%  X is a mxn matrix, containing m users' ratings on n dishes
%  R is a mxn matrix, where R(i,j) = 1 if and only if user i gave a rating to dish j
[num_users,num_dishes]= size(X);

%  Normalize Ratings
[Xnorm, Xmean] = normalizeRatings(X, R);

%  P is a m*f matrix; D is a n*f matrix  
num_features = size(P,2);
% for P, feature 41-49 are set; for D, feature 11-49 are set
initial_parameters = [P(:) ; D(:)];
initial_parameters = initial_parameters+randn(size(initial_parameters));

% Set Initial Parameters (Theta, X)
%P = randn(num_users, num_features);
%D = randn(num_dishes, num_features);

% Evaluate cost function
%J = cofiCostFunc([P(:) ; D(:)], X, R, num_users, num_dishes, num_features, 1.5);
%checkCostFunction(1.5);

% train data
options = optimset('GradObj', 'on', 'MaxIter', 5000);
lambda = 0;
res = fmincg (@(t)(cofiCostFunc(t, Xnorm, R, num_users, num_dishes, num_features, lambda)), ...
                    initial_parameters, options);

% Unfold the returned theta back into U and Wn 
P_train = reshape(res(1:num_users*num_features), num_users, num_features);
D_train = reshape(res(num_users*num_features+1:end),num_dishes,num_features);

P = [P_train(:,1:40) P(:,41:49)];
D = [D_train(:,1:10) D(:,11:49)];

P_test = P;
D_test = D;
% Make Recommendation
rec = P * D';
for i = 1:size(rec,1)
	rec(i,:) = rec(i,:) + Xmean;
end
end
