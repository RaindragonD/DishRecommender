function [J, grad] = cofiCostFunc(params, X, R, num_users, num_dishes, num_features, lambda)

% Unfold the P and D matrices from params
P = reshape(params(1:num_users*num_features), num_users, num_features);
D = reshape(params(num_users*num_features+1:end), num_dishes, num_features);

J = 1/2*sum(sum(((P*D'-X).^2).*R));

P_grad = ((P*D'-X).*R)*D;
D_grad = ((P*D'-X).*R)'*P;

J = J+lambda/2*(sum(sum(P.^2))+sum(sum(D.^2)));
P_grad = P_grad + lambda*P;
D_grad = D_grad + lambda*D; 

grad = [P_grad(:); D_grad(:)];

end
