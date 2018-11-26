
function checkCostFunction(lambda)

% Set lambda
if ~exist('lambda', 'var') || isempty(lambda)
    lambda = 0;
end

%% Create small problem
P_t = rand(4, 3);
D_t = rand(5, 3);

% Zap out most entries
Y = P_t * D_t';
Y(rand(size(Y)) > 0.5) = 0;
R = zeros(size(Y));
R(Y ~= 0) = 1;

%% Run Gradient Checking
X = randn(size(P_t));
Theta = randn(size(D_t));
num_dishes = size(Y, 2);
num_users = size(Y, 1);
num_features = size(D_t, 2);

numgrad = computeNumericalGradient(@(t) cofiCostFunc(t, Y, R, num_users, num_dishes, ...
                                num_features, lambda), [X(:); Theta(:)]);

[cost, grad] = cofiCostFunc([X(:); Theta(:)],  Y, R, num_users, num_dishes, num_features, lambda);

disp([numgrad grad]);
fprintf(['Compare']);

end