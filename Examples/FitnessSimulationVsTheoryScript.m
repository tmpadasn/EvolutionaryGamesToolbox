%%%%%%%%%%%%%%%%%%%%%% Currently Using the TourSimFitPvP which is player vs player implementation
% Common parameters
T = 10;
B = [3 0; 5 1];  % CIPD matrix

%% Figure 1
Strategies = {'per_ddc', 'per_cd', 'soft_majo'};
POP0 = [20, 20, 20];
J = 90;

[POP_sim, ~, FIT_sim] = TourSimFitPvP(B, Strategies, POP0, T, J);
[POP_the, ~, FIT_the] = TourTheFit(B, Strategies, POP0, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Simulated'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Theoretical'); legend(Strategies); grid on;
sgtitle('Figure 1 (PvP): per\_cd vs per\_ddc vs soft\_majo');

%% Figure 2
Strategies = {'gradual', 'tit_for_tat', 'per_cd'};
POP0 = [20, 20, 20];
J = 10;

[POP_sim, ~, FIT_sim] = TourSimFitPvP(B, Strategies, POP0, T, J);
[POP_the, ~, FIT_the] = TourTheFit(B, Strategies, POP0, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Simulated'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Theoretical'); legend(Strategies); grid on;
sgtitle('Figure 2 (PvP): gradual vs tit\_for\_tat vs per\_cd');

%% Figure 3
Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [45, 50, 50];
J = 450;

[POP_sim, ~, FIT_sim] = TourSimFitPvP(B, Strategies, POP0, T, J);
[POP_the, ~, FIT_the] = TourTheFit(B, Strategies, POP0, T, J);

figure;
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Simulated'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Theoretical'); legend(Strategies); grid on;
sgtitle('Figure 3 (PvP): per\_ccd vs per\_ddc vs soft\_majo (Initial: 450, 1000, 100)');