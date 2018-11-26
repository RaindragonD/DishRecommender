function [useridlist] = test()
fid2 = fopen('useridlist.txt');
n = 3;  % Total number of users
useridList = cell(m, 1);
for i = 1:m
    line = fgets(fid2);
    [id, userID] = strtok(line, ' ');
    % Actual Word
    useridList{i} = strtrim(userID);
end
fclose(fid2);
for j = 1:3
	fprintf(useridList(j));
end
end