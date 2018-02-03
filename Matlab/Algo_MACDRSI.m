%% Divergence Factor 1
% MACD Rank + (100 - Relative Strength Index Rank) - Profit and loss Rank

% Perform the following mathematical operation at each iteration:
%
% $$ Divergence Factor 1 = (MACD Rank + (100 - RSI Rank)) - Profit and loss Rank

% $$ Relative Strength Index (RSI) - 100

last_tableRSIrank_all_minus_100 =0.1-(cell2mat(last_tableRSIrank(1:end,2)));

% $$ Divergence Factor MTH 1 = (MACD Rank + (100 - RSI Rank))

Divergence_factor_mth_1 = (cell2mat(last_tablemacdrank(:,2))+(last_tableRSIrank_all_minus_100(:,1)))./2;
Divergence_factor_mth_1 = num2cell(Divergence_factor_mth_1);

%% Divergence Factor 2
% [MACD minus RSI Divergence] minus Profit and loss Ranked

% Perform the following mathematical operation at each iteration:
%
% $$ Divegence Factor 2 P/L(Scaled) = [(MACD Rank + (100 - RSI Rank)) - Profit and loss Rank)] - Profit and loss Rank

Divergence_factor_pnl_scaled = cell2mat(Divergence_factor_mth_1)- (cell2mat(last_pnlrank'));
%% Create Table of Divergence Factor 2.

col_8 ={'Pair', 'PnLDivergence'};
Table_Divergence_factor_pnl_scaled = [col_header_3' num2cell(Divergence_factor_pnl_scaled)];
Table_Divergence_factor_pnl_scaled_all =[col_8;Table_Divergence_factor_pnl_scaled];
%% Create Table of Divergence Factor 1, Divergence Factor 2 and Percentile Ranks
% Create table header

col_9 ={'Pair', 'MACD_pct', 'RSI_pct', 'MACD_RSI_Divergence','pnl_pct','MACD_RSI_Divergence_scaled'};

Divergence_factor_table_pnl_scaled = [col_header_3' last_tablemacdrank(:,2) last_tableRSIrank(:,2) Divergence_factor_mth_1 last_pnlrank' num2cell(Divergence_factor_pnl_scaled)];
Monthly1_Divergence_Factor =[col_9;Divergence_factor_table_pnl_scaled];
