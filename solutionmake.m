%{

0 0 0
1 1 1
1 1 1

%}

function answer = solutionmake(color)

for i=1:3
if(color(i,:)==[0 0 0])
    answer(i) = 1;
    
end

if(color(i,:)==[1 1 1])
    answer(i) = 2;
end

end