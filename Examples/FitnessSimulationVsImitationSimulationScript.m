%%%%%%%%%%%%%%%%%%%%%% Currently Using the TourSimFitPvP and TourSimImiPvP which is player vs player implementation 
% Common parameters
T = 10;
B = [3 0; 5 1];  % CIPD matrix

%% Figure 1
Strategies = {'per_ddc', 'per_cd', 'soft_majo'};
POP0 = [20, 20, 10];
J = 90;
K = 1;
[POP_sim, ~, FIT_sim] = TourSimFitPvP(B, Strategies, POP0, T, J);
[POP_the, ~] = TourSimImiPvP(B, Strategies, POP0, K, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Fitness'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Imitation'); legend(Strategies); grid on;
sgtitle('Figure 1 (PvP): per\_cd vs per\_ddc vs soft\_majo');

% save('my_mc_results.mat', 'mc', 'PP', 'S', 'N', 'L');
% GrPlot('my_mc_results.mat');

%% Figure 2
Strategies = {'gradual', 'tit_for_tat', 'per_cd'};
POP0 = [20, 20, 20];
J = 10;

K = 1;
[POP_sim, ~, FIT_sim] = TourSimFitPvP(B, Strategies, POP0, T, J);
[POP_the, ~] = TourSimImiPvP(B, Strategies, POP0, K, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Fitness'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Imitation'); legend(Strategies); grid on;
sgtitle('Figure 2 (PvP): gradual vs tit\_for\_tat vs per\_cd');

%% Figure 3
Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [50, 100, 100];
J = 10;

K = 3;
[POP_sim, ~, FIT_sim] = TourSimFitPvP(B, Strategies, POP0, T, J);
[POP_the, ~] = TourSimImiPvP(B, Strategies, POP0, K, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Fitness'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Imitation'); legend(Strategies); grid on;
sgtitle('Figure 3 (PvP): per\_ccd vs per\_ddc vs soft\_majo (Initial: 450, 1000, 100)');

%% Figure 4
Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [90, 80, 70];
J = 10;

K = 10;
[POP_sim, ~, FIT_sim] = TourSimFitPvP(B, Strategies, POP0, T, J);
[POP_the, ~] = TourSimImiPvP(B, Strategies, POP0, K, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Fitness'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Imitation'); legend(Strategies); grid on;
sgtitle('Figure 4 (PvP): per\_ccd vs per\_ddc vs soft\_majo (Initial: 300, 200, 100)');

%% Figure 5
Strategies = {'per_ddc', 'per_cd', 'soft_majo'};
POP0 = [90, 80, 70];
J = 10;

K = 10;
[POP_sim, ~, FIT_sim] = TourSimFitPvP(B, Strategies, POP0, T, J);
[POP_the, ~] = TourSimImiPvP(B, Strategies, POP0, K, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Fitness'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Imitation'); legend(Strategies); grid on;
sgtitle('Figure 5 (PvP): per\_ddc vs per\_cd vs soft\_majo');

%% Figure 6
Strategies = {'soft_majo', 'per_ccccd', 'prober'};
POP0 = [30, 70, 30];
J = 100;

K = 10;
[POP_sim, ~, FIT_sim] = TourSimFitPvP(B, Strategies, POP0, T, J);
[POP_the, ~] = TourSimImiPvP(B, Strategies, POP0, K, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Fitness'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Imitation'); legend(Strategies); grid on;
sgtitle('Figure 6 (PvP): soft\_majo vs per\_ccccd vs prober');

%%%%%%%%%%%%%%%%%%%%%% Currently Using the TourSimFit and TourSimImi which is strategy vs strategy implementation 
% Common parameters
T = 10;
B = [3 0; 5 1];  % CIPD matrix

%% Figure 1
Strategies = {'per_ddc', 'per_cd', 'soft_majo'};
POP0 = [20, 20, 10];
J = 90;
K = 1;
[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);
[POP_the, ~] = TourSimImi(B, Strategies, POP0, K, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Fitness'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Imitation'); legend(Strategies); grid on;
sgtitle('Figure 1 (SvS): per\_cd vs per\_ddc vs soft\_majo');

GrPlot('Fig1_Imitation.m');

%% Figure 2
Strategies = {'gradual', 'tit_for_tat', 'per_cd'};
POP0 = [20, 20, 20];
J = 10;

K = 1;
[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);
[POP_the, ~] = TourSimImi(B, Strategies, POP0, K, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Fitness'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Imitation'); legend(Strategies); grid on;
sgtitle('Figure 2 (SvS): gradual vs tit\_for\_tat vs per\_cd');

%% Figure 3
Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [50, 100, 100];
J = 10;

K = 3;
[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);
[POP_the, ~] = TourSimImi(B, Strategies, POP0, K, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Fitness'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Imitation'); legend(Strategies); grid on;
sgtitle('Figure 3 (SvS): per\_ccd vs per\_ddc vs soft\_majo (Initial: 450, 1000, 100)');

%% Figure 4
Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [90, 80, 70];
J = 10;

K = 10;
[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);
[POP_the, ~] = TourSimImi(B, Strategies, POP0, K, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Fitness'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Imitation'); legend(Strategies); grid on;
sgtitle('Figure 4 (SvS): per\_ccd vs per\_ddc vs soft\_majo (Initial: 300, 200, 100)');

%% Figure 5
Strategies = {'per_ddc', 'per_cd', 'soft_majo'};
POP0 = [90, 80, 70];
J = 10;

K = 10;
[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);
[POP_the, ~] = TourSimImi(B, Strategies, POP0, K, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Fitness'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Imitation'); legend(Strategies); grid on;
sgtitle('Figure 5 (SvS): per\_ddc vs per\_cd vs soft\_majo');

%% Figure 6
Strategies = {'soft_majo', 'per_ccccd', 'prober'};
POP0 = [30, 70, 30];
J = 100;

K = 10;
[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);
[POP_the, ~] = TourSimImi(B, Strategies, POP0, K, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Fitness'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Imitation'); legend(Strategies); grid on;
sgtitle('Figure 6 (SvS): soft\_majo vs per\_ccccd vs prober');
