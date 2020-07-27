%% Checks if the given answer is correct for the matrix
%INPUT:answer ([x y z]), ploti ([]6*3)
%OUTPUT:boolean

function solution = solution3(answer,ploti)

for i=1:length(ploti(:,1))
    flag = false;
if length(find(answer==ploti(i,:)))>=1
    flag = true;
end
f(i) = flag;
end

solution = false;
if f(:) == 1
    solution = true;
end
end
