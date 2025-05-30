%% Figure 12
Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [450, 1000, 100];
T = 1000;
J = 450;
B = [3 0; 5 1];  % CIPD matrix
[POP_sim, ~, FIT_sim] = TourTheFit(B, Strategies, POP0, T, J);
J = 160;
POP0 = [450 100 1000] / 10;
[POP_the, ~, FIT_the] = TourTheFit(B, Strategies, POP0, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Normal Population'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Populations divided by 10'); legend(Strategies); grid on;
sgtitle('Figure 12: Normal Population vs Populations divided by 10');

%% Figure 12 Simulated
Strategies = {'per_ccd', 'per_ddc', 'soft_majo'};
POP0 = [450, 1000, 100];
T = 1000;
J = 450;
B = [3 0; 5 1];  % CIPD matrix
[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);
J = 160;
POP0 = [450 100 1000] / 10;
[POP_the, ~, FIT_the] = TourSimFit(B, Strategies, POP0, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Normal Population'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Populations divided by 10'); legend(Strategies); grid on;
sgtitle('Figure 12 Simulated: Normal Population vs Populations divided by 10');
