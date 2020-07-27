


function middle_circle_keyboard()
global c1;
global c2;
global c3;

setGlobalcolor1([1 1 1]);
setGlobalcolor2([1 1 1]);
setGlobalcolor3([1 1 1]);



x1=0;
y1=0.9;
x7=x1;
y7=y1+4.2;

x =[x7 y7];

inner_circles = {@small_circle1,@small_circle2,@small_circle3};

   c1 = inner_circles{1}(x);
   c2 = inner_circles{2}(x);
   c3 = inner_circles{3}(x);

    


function c1 = small_circle1(x)
pos = [(x(1))-0.5 x(2) 1 1]; 
c1 = rectangle('Position',pos,'Curvature',[1 1],'Facecolor','white','EdgeColor','K','ButtonDownFcn' , @ circle_callback1);
axis equal 
end

function c2 = small_circle2(x)
pos = [((x(1))-0.5)-1 x(2)-1 1 1]; 
c2 = rectangle('Position',pos,'Curvature',[1 1],'Facecolor','white','EdgeColor','K','ButtonDownFcn',@ circle_callback2);
axis equal 
end

function c3 = small_circle3(x)
pos = [((x(1))-0.5)+1 x(2)-1 1 1]; 
c3 = rectangle('Position',pos,'Curvature',[1 1],'Facecolor',[1 1 1],'EdgeColor',[0 0 0],'ButtonDownFcn',@circle_callback3);
axis equal 
end

end

function colorc1(rect)
if(rect.FaceColor == [0 0 0])
    rect.FaceColor = 'W';
   
else
    rect.FaceColor = 'K';
    
end
setGlobalcolor3(rect.FaceColor);
end

function colorc2(rect)
if(rect.FaceColor == [0 0 0])
    rect.FaceColor = 'W';
   
else
    rect.FaceColor = 'K';
    
end
setGlobalcolor3(rect.FaceColor);
end

function colorc3(rect)
if(rect.FaceColor == [0 0 0])
    rect.FaceColor = 'W';
   
else
    rect.FaceColor = 'K';
    
end
setGlobalcolor3(rect.FaceColor);

end