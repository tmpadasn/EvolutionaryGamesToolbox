Overview
This document describes the available strategy functions in the toolbox for the Iterated Prisoner's Dilemma. Each strategy determines its next move (1 = Cooperate, 2 = Defect) based on the game history provided.

Each function has the form:
Move = strategy_name(History)
where History is an N x 2 matrix ([my_move, opponent_move] for each previous round).


1. all_c
Always Cooperate
Always returns 1 (cooperate), regardless of history.

2. all_d
Always Defect
Always returns 2 (defect), regardless of history.

3. gradual
Gradual
Cooperates by default. When the opponent defects, retaliates with a number of defections equal to the number of times the opponent has defected so far, then resumes cooperation with two cooperations.

4. per_ccccd
Periodic: C C C C D
Repeats the cycle: four cooperations, one defection (C, C, C, C, D, ...).

5. per_ccd
Periodic: C C D
Repeats the cycle: two cooperations, one defection (C, C, D, ...).

6. per_cd
Periodic: C D
Alternates: cooperate, defect, cooperate, defect, ...

7. per_ddc
Periodic: D D C
Repeats the cycle: two defections, one cooperation (D, D, C, ...).

8. prober
Prober
First defects, then cooperates twice. If the opponent cooperated on the 2nd and 3rd moves, defects forever. Otherwise, switches to Tit-for-Tat (copies the opponent’s previous move).

9. soft_majo
Soft Majority
Chooses to cooperate if the opponent has cooperated at least as often as they have defected; otherwise, defects.

10. tit_for_tat
Tit-for-Tat
Cooperates on the first move, then mimics the opponent’s previous move for all subsequent rounds.

===============> Usage Example <===============

% Example history: three rounds played
History = [1 2; 1 1; 2 2];
move = tit_for_tat(History); % Returns 2 (defect, because opponent defected last round)

