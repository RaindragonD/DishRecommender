 % SCRIPT ------- DISH RECOMMENDATION SYSTEM

 %  Load Pretiction Matric X and Verification Matrix R
 %  X is a mxn matrix, containing m users' ratings on n dishes
 %  R is a mxn matrix, where R(i,j) = 1 if and only if user i gave a rating to dish j
 load ('XMatrix.mat');

 %  Load feature matrices: P is a m*f matrix; D is a n*f matrix  
 load ('weights.mat');
 if size(P,2)~=size(D,2)
    fprintf('incorrect weights');
 end

 % train data
 res = cofi(X,R,P,D);
 C = zeros(4,16);
 % add special requirements
 res = special(res,C);

 % recommend dishes
	userID=[1;2;3];
 makeRecommendation(res,userID);
