%% Figure 11 a = 3
T = 100;
a = 3;
B = [a 1;
     4 2];

Strategies = {'per_ddc', 'per_ccd', 'soft_majo'};
POP0 = [15, 30, 45];
J = 90;
K = 1;
POP_the = TourTheImi(B, Strategies, POP0, K, T, J);
[POP_sim, ~] = TourSimImi(B, Strategies, POP0, K, T, J);

% Theoretical (Markovian Analysis
N = sum(POP0);
states = enumerate_states(N, length(Strategies));
mc.P = POP_the;
S = states;
PP = get_stationary_colors(POP_the); 
L = size(states, 1);
save('my_P.mat', 'mc', 'S', 'N', 'PP', 'L');

figure('Position', [100, 100, 2400, 1000]);
GrPlot('my_P.mat');

% Simulation
subplot(1,2,2)
plot(POP_sim, 'LineWidth', 2); title('Simulation'); legend(Strategies); grid on;
sgtitle('Figure 11 a = 3 (Initial Pop: [15, 30, 45]): per\_ccd vs per\_ddc vs soft\_majo');

%% Figure 11 a = 3.4
T = 100;
a = 3.4;
B = [a 1;
     4 2];

Strategies = {'per_ddc', 'per_ccd', 'soft_majo'};
POP0 = [15, 30, 45];
J = 90;
K = 1;
POP_the = TourTheImi(B, Strategies, POP0, K, T, J);
[POP_sim, ~] = TourSimImi(B, Strategies, POP0, K, T, J);

% Theoretical (Markovian Analysis
N = sum(POP0);
states = enumerate_states(N, length(Strategies));
mc.P = POP_the;
S = states;
PP = get_stationary_colors(POP_the); 
L = size(states, 1);
save('my_P.mat', 'mc', 'S', 'N', 'PP', 'L');

figure('Position', [100, 100, 2400, 1000]);
GrPlot('my_P.mat');

% Simulation
subplot(1,2,2)
plot(POP_sim, 'LineWidth', 2); title('Simulation'); legend(Strategies); grid on;
sgtitle('Figure 11 a = 3.4 (Initial Pop: [15, 30, 45]): per\_ccd vs per\_ddc vs soft\_majo');

%% Figure 11 a = 3.8
T = 100;
a = 3.8;
B = [a 1;
     4 2];

Strategies = {'per_ddc', 'per_ccd', 'soft_majo'};
POP0 = [15, 30, 45];
J = 90;
K = 1;
POP_the = TourTheImi(B, Strategies, POP0, K, T, J);
[POP_sim, ~] = TourSimImi(B, Strategies, POP0, K, T, J);

% Theoretical (Markovian Analysis
N = sum(POP0);
states = enumerate_states(N, length(Strategies));
mc.P = POP_the;
S = states;
PP = get_stationary_colors(POP_the); 
L = size(states, 1);
save('my_P.mat', 'mc', 'S', 'N', 'PP', 'L');

figure('Position', [100, 100, 2400, 1000]);
GrPlot('my_P.mat');

% Simulation
subplot(1,2,2)
plot(POP_sim, 'LineWidth', 2); title('Simulation'); legend(Strategies); grid on;
sgtitle('Figure 11 a = 3.8 (Initial Pop: [15, 30, 45]): per\_ccd vs per\_ddc vs soft\_majo');