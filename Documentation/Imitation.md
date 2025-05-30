Overview
This document describes the main functions implementing Imitation Dynamics in the toolbox.
Imitation Dynamics models how populations of strategies evolve by imitating the most successful strategies over generations in the Iterated Prisoner's Dilemma.

Each function here simulates different approaches to imitation-based evolution.

1. TourSimImi
Purpose:
Simulates the evolution of a population using imitation dynamics, where, in each generation, a fixed number of individuals from non-best strategies switch to the best strategy.

Usage:
	[POP, BST] = TourSimImi(B, Strategies, POP0, K, T, J)
Where
	B: Payoff matrix.
	Strategies: Cell array of strategy function handles.
	POP0: Initial population vector for each strategy.
	K: Number of individuals that change strategies per generation.
	T: Number of rounds per match between strategies.
	J: Number of generations to simulate.
Outputs
	POP: Matrix recording the population of each strategy at every generation.
	BST: Vector indicating the index of the best-performing strategy at each generation.
	
Description:
At each generation, all possible strategy-vs-strategy matchups are played to determine average fitness.
A fixed number K of individuals from non-best strategies randomly switch to randomly chosen best strategies for the next generation.

2. TourSimImiPvP
Purpose:
Simulates imitation dynamics at the player-versus-player (PvP) level, where every individual is represented explicitly and round-robin matches are played.

Usage:
	[POP, BST] = TourSimImiPvP(B, Strategies, POP0, K, T, J)
Where
	B: Payoff matrix.
	Strategies: Cell array of strategy function handles.
	POP0: Initial population vector for each strategy.
	K: Number of individuals that change strategies per generation.
	T: Number of rounds per match.
	J: Number of generations.
Outputs
	POP: Population of each strategy at every generation.
	BST: Index of the best-performing strategy at each generation.
	
Description:
Each player is assigned a strategy, and every pair plays a match. The players with the lowest-performing strategies are candidates to switch; a fixed number of them switch to best strategies, mimicking real player-level imitation.

3. TourTheImi
Purpose:
Simulates imitation dynamics using a transition matrix approach, focusing on the state evolution of strategy populations, and emphasizing transitions between best and worst strategies.

Usage:
	P = TourTheImi(B, Strategies, POP0, K, T, J)
Where
	B: Payoff matrix.
	Strategies: Cell array of strategy function handles.
	POP0: Initial population vector for each strategy.
	K: Number of individuals that change strategies per generation.
	T: Number of rounds per match.
	J: Number of generations.
Output
	P: The population matrix over generations (or, in other versions, a transition probability matrix).

Description:
For each generation, scores for all strategies are calculated based on their expected payoff against the current population.
A proportion of individuals from the two worst-performing strategies are selected to switch to one of the best-performing strategies. The new population distribution is updated accordingly.

################## For experiments, reference the specific function and script used to generate each figure in the report. ################

==========> Example Usage <======================
% Example: Run imitation dynamics with 3 strategies
B = [3 0; 5 1];            % Standard PD payoff matrix
Strategies = {@tit_for_tat, @all_d, @all_c};
POP0 = [10 10 10];         % Initial population: 10 of each
K = 3;                     % Three individuals switch per generation
T = 100;                   % 100 rounds per match
J = 50;                    % 50 generations

[POP, BST] = TourSimImi(B, Strategies, POP0, K, T, J);
