% We know that the second policy is the optimal
gamma=.9;
R=[-1;.6;.5;-.9];
P=[0.8 0.2;0.2 0.8;0.3 0.7;0.9 0.1];
pi2=[0 1 0 0;0 0 1 0];
v_opt=inv(eye(2)-gamma*pi2*P)*pi2*R;
q_opt=inv(eye(4)-gamma*P*pi2)*R;

% Numerical solution

Ru=R([1;2]);Pu=[P(1,:);P(2,:)];
Rm=R([3;4]);Pm=[P(3,:);P(4,:)];
fun_v = @(v) v-[max(Ru+gamma*Pu*v);max(Rm+gamma*Pm*v)];
v0 = [0;0];
v = fsolve(fun_v,v0);
[v_opt v]

fun_q =...;
q0 = ...;
q = ...;
[q_opt q]




