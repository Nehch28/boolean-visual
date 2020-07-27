function main_circle()
x1=0;
y1=0.9;
x2=x1-(4*1);
y2=y1+1.7;
x3=x2;
y3=y2+(4.3*1);
x4=x1;
y4=y3+2.4;
x5=x4+(4*1);
y5=y3;
x6=x5;
y6=y2;
x7=x1;
y7=y1+4.2;


x = [x1 y1;x2 y2;x3 y3;x4 y4;x5 y5;x6 y6;x7 y7];
r = [2;2;2;2;2;2;2];
inner_circles = {@small_circle1,@small_circle2,@small_circle3};

viscircles(x(7,:),r(7,:),'Color','K');

for i=1:6
    viscircles(x(i,:),r(i,:),'Color','black')
    %{
    index = randperm(3,2);
    inner_circles{index(1)}(i,x);
    inner_circles{index(2)}(i,x);
    %}
end



end

function small_circle1(i,x)
colors = {'white','black'};
index = randperm(2,1);
pos = [(x(i,1))-0.5 x(i,2) 1 1]; 
rectangle('Position',pos,'Curvature',[1 1],'Facecolor',colors{index},'EdgeColor','black');
axis equal 
end

function small_circle2(i,x)
colors = {'white','black'};
index = randperm(2,1);
pos = [((x(i,1))-0.5)-1 x(i,2)-1 1 1]; 
rectangle('Position',pos,'Curvature',[1 1],'Facecolor',colors{index},'EdgeColor','black');
axis equal 
end

function small_circle3(i,x)
colors = {'white','black'};
index = randperm(2,1);
pos = [((x(i,1))-0.5)+1 x(i,2)-1 1 1]; 
rectangle('Position',pos,'Curvature',[1 1],'Facecolor',colors{index},'EdgeColor','black');
axis equal 
end



