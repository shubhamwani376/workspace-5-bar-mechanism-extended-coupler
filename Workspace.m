clear()
theta1 = linspace(0,2*pi(),51);
theta2 = linspace(0,2*pi(),51);
l1=150;
l2=40.3;
l3=172;
l4=40;
l5= 113.37;
d=35;
x1=0;
y1=0;
workspace= zeros(51,51,4);
for i=1:51
    for j=1:51
        x2= l1* cos(theta1(1,i));
        y2= l1* sin(theta1(1,i));
        x4= l4 * cos(theta2(1,j))+ d;
        y4= l4 * sin(theta2(1,j));
        [x3,y3] = circcirc(x2,y2,l2,x4,y4,l3);
        if (~isnan(x3(1))) && (~isnan(y3(1)))
            for k=1:2
                ang = atan((y3(k)-y2)/(x3(k)-x2));
                x5= x3 + 113.37*cos(ang);
                y5= y3 + 113.37*sin(ang);
            workspace(i,j,:) = [x5(1),y5(1),x5(2),y5(2)];
            end
        end 
    end
    j=1;
end
i=1;
figure
hold on;
for i=1:51
    for j=1:51
        plot(workspace(i,j,1),workspace(i,j,2),'b.');
        plot(workspace(i,j,3),workspace(i,j,4),'b.');
    end
end
title('Workspace of Given Leg Mechanism')
xlabel('X(mm)')
ylabel('Y(mm)')
plot (0,0,'ro','LineWidth',4)
plot (35,0,'ro','LineWidth',4)
hold off;
