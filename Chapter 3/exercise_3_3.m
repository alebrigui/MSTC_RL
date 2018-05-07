gamma=.9;
R=[-1;.6;.5;-.9];
P=[0.8 0.2;0.2 0.8;0.3 0.7;0.9 0.1];
pi1=[1 2 0 0;0 0 1 0];
pi2=[0 1 0 0;0 0 1 0];
pi3=[1 0 0 0;0 0 0 1];
pi4=[0 1 0 0;0 0 0 1];


v1=(eye(2)-gamma*(pi1*P))\pi1*R
v2=(eye(2)-gamma*(pi2*P))\(pi2*R)
v3=(eye(2)-gamma*(pi3*P))\(pi3*R)
v4=(eye(2)-gamma*(pi4*P))\(pi4*R)
q1=(eye(4)-gamma*(P*pi1))\R
q2=(eye(4)-gamma*(P*pi2))\R
q3=(eye(4)-gamma*(P*pi3))\R
q4=(eye(4)-gamma*(P*pi4))\R
