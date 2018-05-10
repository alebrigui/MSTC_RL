% Grid world problem
set_up_grid_world
N_states=25;
N_actions=4;
N_steps=400;
% Value random policy
% We calculate the value of v_rp and q_rp with the bellman equations
v_rp=(eye(N_states)-gamma*pi_m*P)\pi_m*R;
q_rp=(eye(N_states*N_actions)-gamma*P*pi_m)\R;
[v_rp(1:5) v_rp(6:10) v_rp(11:15) v_rp(16:20) v_rp(21:25)]

%% Policy evaluation. V / Q functions
v_ini=zeros(N_states,1);
q_ini=zeros(N_states*N_actions,1);
[v_pe, q_pe]=policy_evaluation(gamma,N_states,N_actions,N_steps,P,R,pi_m,v_ini,q_ini);
figure(1),aux=repmat(v_rp,[1 N_steps])-v_pe;
plot(1:N_steps,10*log10(diag(aux'*aux)))
figure(2),aux=repmat(q_rp,[1 N_steps])-q_pe;
plot(1:N_steps,10*log10(diag(aux'*aux)))
      
%% Value iteration. Check with the figure
[v_vi, q_vi]=value_iteration(gamma,N_states,N_actions,N_steps,P,R,pi_m);
[v_vi(1:5,N_steps) v_vi(6:10,N_steps) v_vi(11:15,N_steps) v_vi(16:20,N_steps) v_vi(21:25,N_steps)]

%% Policy iteration. Start from uniform distribution
N_steps_pe=10;
N_steps_pi=50;
[v_pi, q_pi]=policy_iteration(gamma,N_states,N_actions,N_steps_pi,N_steps_pe,P,R,pi_m);
[v_pi(1:5,N_steps_pi) v_pi(6:10,N_steps_pi) v_pi(11:15,N_steps_pi) v_pi(16:20,N_steps_pi) v_pi(21:25,N_steps_pi)]

%% Comparison of rsults

figure(1),aux=repmat(q_vi(:,N_steps),[1 N_steps_pi])-q_pi;
plot(1:N_steps_pi,10*log10(diag(aux'*aux)))
xlabel('Steps')
ylabel('Policy iteration / Value Iteration')

figure(2)
aux=repmat(v_vi(:,N_steps),[1 N_steps_pi])-v_pi;
plot(1:N_steps_pi,10*log10(diag(aux'*aux)))
xlabel('Steps')
ylabel('Policy iteration / Value Iteration')

      
        
        
        
