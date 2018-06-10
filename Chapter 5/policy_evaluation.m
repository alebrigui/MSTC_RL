function [v, q]=policy_evaluation(problem,N_steps)

% we get the variables from our problem 
gamma = problem.gamma;
N_states = problem.N_states;
N_actions = problem.N_actions;
P = problem.P;
R = problem.R;
pi_m = problem.pi_rp;

% Policy evaluation. V / Q functions
v=zeros(N_states,N_steps);
q=zeros(N_states*N_actions,N_steps);
for k=1:N_steps-1
    v(:,k+1)=pi_m*(R+gamma*P*v(:,k));
    q(:,k+1)=R+P*gamma*pi_m*q(:,k);
end
