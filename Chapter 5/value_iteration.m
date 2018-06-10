function [v, q]=value_iteration(problem,N_steps)

gamma = problem.gamma;
N_states = problem.N_states;
N_actions = problem.N_actions;
P = problem.P;
R = problem.R;

% Value iteration
v=zeros(N_states,N_steps);
q=zeros(N_states*N_actions,N_steps);
q(:,1)=R;
for k=1:N_steps-1
    for kk=1:N_states
        v(kk,k+1)=max(R(1+(kk-1)*(N_actions):kk*(N_actions))+gamma*...
            P(1+(kk-1)*(N_actions):kk*(N_actions),:)*v(:,k));
    end
    q(:,k+1)=R+P*gamma*v(:,k+1);
end
