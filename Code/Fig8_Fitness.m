%% Figure 8
T = 1000;
B = [3 0; 5 1];  % CIPD matrix

Strategies = {'per_cd', 'per_ddc', 'soft_majo'};
POP0 = [100, 100, 159];
POP1 = [100, 100, 160];
J = 120;

[POP_sim, ~, FIT_sim] = TourTheFit(B, Strategies, POP0, T, J);
J = 25;
[POP_the, ~, FIT_the] = TourTheFit(B, Strategies, POP1, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Theoretical_per_ddc_244'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Theoretical_per_ddc_245'); legend(Strategies); grid on;
sgtitle('Figure 8: soft\_majo159 vs soft\_majo160');

%% Figure 8 Simulated
Strategies = {'per_cd', 'per_ddc', 'soft_majo'};
POP0 = [100, 100, 159];
POP1 = [100, 100, 160];
J = 120;

[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);
J = 25;
[POP_the, ~, FIT_the] = TourSimFit(B, Strategies, POP1, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Simulated_per_ddc_244'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Simulated_per_ddc_245'); legend(Strategies); grid on;
sgtitle('Figure 8 Simulated: soft\_majo159 vs soft\_majo160');