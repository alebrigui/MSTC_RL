% Analysis cliff problem
clear all
cliff_set_up
N_steps_value_ite=500;
% Optimum value
v_opt=inv(eye(cliff.N_states)-cliff.gamma*cliff.pi_opt*cliff.P)*cliff.pi_opt*cliff.R;
q_opt=inv(eye(cliff.N_states*cliff.N_actions)-cliff.gamma*cliff.P*cliff.pi_opt)*cliff.R;
[path_opt] = optimum_path(cliff,q_opt)

% Value iteration
[v_vi q_vi] = value_iteration(cliff,N_steps_value_ite);
[v_opt(37:48)';v_opt(25:36)';v_opt(13:24)';v_opt(1:12)']
[v_vi(37:48)';v_vi(25:36)';v_vi(13:24)';v_vi(1:12)']
[path_vi] = optimum_path(cliff,q_vi)

% Policy iteration
[v_pi q_pi] = policy_improvement(cliff,N_steps_value_ite);
[v_opt(37:48)';v_opt(25:36)';v_opt(13:24)';v_opt(1:12)']
[v_pi(37:48,500)';v_pi(25:36,500)';v_pi(13:24,500)';v_pi(1:12,500)']
[path_pi] = optimum_path(cliff,q_pi)

% QL algorithm
cliff.alpha=.1;
[q_ql] = QL_cliff(cliff,N_steps_value_ite);
[path_ql] = optimum_path(cliff,q_ql(:,N_steps_value_ite))

% SARSA algorithm
cliff.alpha=.1;
[q_sarsa] = SARSA_cliff(cliff,N_steps_value_ite);
[path_sarsa] = optimum_path(cliff,q_sarsa(:,N_steps_value_ite))





