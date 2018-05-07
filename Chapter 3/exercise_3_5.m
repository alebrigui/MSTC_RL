clear
gamma=.9;
R=[-1;.6;.5;-.9];
P=[0.8 0.2;0.2 0.8;0.3 0.7;0.9 0.1];
pi1=[1 0 0 0;0 0 1 0];
pi2=[0 1 0 0;0 0 1 0];
pi3=[1 0 0 0;0 0 0 1];
pi4=[0 1 0 0;0 0 0 1];

v1=...
v2=...
v3=...
v4=...



% Part b)
% We know that policy 2 is optimal
A=zeros(2,1000);
for k =1:1000
    ...
    ...
    ...
    ...
end

plot([v_opt(1) v_opt(1)],[-10 v_opt(2)],'--b','LineWidth',2),hold
plot([-10 v_opt(1)],[v_opt(2) v_opt(2)],'--b','LineWidth',2),
plot(v_opt(1),v_opt(2),'b*','LineWidth',5)
plot(A(1,:),A(2,:),'.r')
hold off
axis([-10 6 -10 6]),grid
xlabel('Coordinate 1')
ylabel('Coordinate 2')




