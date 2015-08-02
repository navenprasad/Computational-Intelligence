function r = sigmoid(array)
matrix = [];
for idx = 1:numel(array)
    x = array(idx)
    

element = 1/(1+exp(-x))

matrix = cat(1, matrix, element);

end
r = matrix'