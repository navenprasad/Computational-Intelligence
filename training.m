function r = training

% Reading data, A -> inputs, B' -> output
fileID = fopen('dermatology_in.txt','r');
formatSpec = '%34f';
sizeA = [34 Inf];
A = fscanf(fileID,formatSpec,sizeA)
fclose(fileID);

fileID = fopen('dermatology_out.txt','r');
formatSpec = '%f';
sizeB = [1 Inf]
B = fscanf(fileID,formatSpec,sizeB)
fclose(fileID);

input = A';
expected = B';
lr = 0.1;


numNode1 = 34;
numNode2 = 10;
numNode3 = 1;

w1 = rand(numNode1, numNode2);
w2 = rand(numNode2, numNode3);
row =1;

% loop starts here
% rng('shuffle')
% row = randi(569);;
while row < 359
%output calculation
y1 = input(row,:);
y2 = sigmoid(y1*w1);
y3 = sigmoid(y2*w2);

%error calculation
error = expected(row,:) - y3;
d2 = (y3 .* (1 - y3))'*error;
d1 = (y2 .* (1 - y2))'.*d2.*w2;

%learning
w2 = w2 + lr * y2'*d2';
w1 = w1 + lr * y1'*d1';
disp(w2);
disp(w1);

row = row + 1;
end






r = error, w1, w2;
