% Recycling robot
alpha=.3;
beta=.6;
gamma=.9;
r_s=1;
r_w=.1;

R_h=[r_w;r_s];
R_l=[r_w-3;beta*r_s-3*(1-beta);0];
P_l=[1 0;beta 1-beta;0 1];
P_h=[0 1;1-alpha alpha];

fun = @(v) v-[max(R_l+gamma*P_l*v);max(R_h+gamma*P_h*v)];
v0 = [0;0];
v = fsolve(fun,v0)
