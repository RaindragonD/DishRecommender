function [] = makeRecommendation(predictions,ID)

% predictions is a num_users*num_dishes matrix

% input dish list
fid = fopen('dish_ids.txt');
n = 16;  % Total number of dishes
dishList = cell(n, 1);
for i = 1:n
    line = fgets(fid);
    [~, dishName] = strtok(line, ' ');
    dishList{i} = strtrim(dishName);
end
fclose(fid);

% input user list
fid2 = fopen('user_ids.txt');
m = 4;  % Total number of users
useridList = cell(m, 1);
for j = 1:m
    line = fgets(fid2);
    [~, userID] = strtok(line, ' ');
    useridList{j} = strtrim(userID);
end
fclose(fid2);

pre = zeros(1,16);
for i = 1:size(ID,1)
	pre = pre+predictions(ID(i),:);
end

[r,ix] = sort(pre, 'descend');
fprintf('\nRecommended dish for you:\n');
for p=1:size(ID,1)
    q = ix(p);
    fprintf(dishList{q});
    fprintf('\n');
end