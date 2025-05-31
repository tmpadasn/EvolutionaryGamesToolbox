% Common parameters
T = 1000;
B = [3 0; 5 1];  % CIPD matrix

%% Figure 1
Strategies = {'per_ddc', 'per_cd', 'soft_majo'};
POP0 = [100, 100, 100];
J = 90;

[POP_sim, ~, FIT_sim] = TourSimFit(B, Strategies, POP0, T, J);
[POP_the, ~, FIT_the] = TourTheFit(B, Strategies, POP0, T, J);

figure('Position', [100, 100, 2400, 1000]);
subplot(1,2,1);
plot(POP_sim, 'LineWidth', 2); title('Simulated'); legend(Strategies); grid on;
subplot(1,2,2);
plot(POP_the, 'LineWidth', 2); title('Theoretical'); legend(Strategies); grid on;
sgtitle('Figure 1: per\_cd vs per\_ddc vs soft\_majo');
