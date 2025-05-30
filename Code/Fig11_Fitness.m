%% Figure 11
Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [300, 200, 100];
T = 1000;
J = 1000;
B = [3 0; 5 1];  % CIPD matrix
[POP_sim, ~, FIT_sim] = TourTheFit(B, Strategies, POP0, T, J);
[POP_the, ~, FIT_the] = TourTheFitForFig11(B, Strategies, POP0, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Rounded Population'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Real Population'); legend(Strategies); grid on;
sgtitle('Figure 11: Rounded Population vs Real Population');

%% Figure 11 Simulated
Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [300, 200, 100];
T = 1000;
J = 1000;
B = [3 0; 5 1];  % CIPD matrix
[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);
[POP_the, ~, FIT_the] = TourSimFitForFig11(B, Strategies, POP0, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Rounded Population'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Real Population'); legend(Strategies); grid on;
sgtitle('Figure 11 Simulated: Rounded Population vs Real Population');
