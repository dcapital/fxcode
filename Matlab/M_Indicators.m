%% This script outputs a momenetum table and an output table with average across all pairs
% I need to figure out how to find the ranks of the average and align them with the pair name
%%  Inputs to M_PNL10 and M_PNL30
Table_PNL10;
Table_PNL30;


disp('calculating momentum indicators.....')

M_MACD_CHANGE = (MACD_Delta_chg_fwd-MACD_Delta_uu)';
M_RSI_CHANGE = (RSI_uu_fwd-RSI_uu)';
M_SKEW = Table_skewness_last(:,2:end);
M_PNL10 = Table_PnL_10(:,2);
M_PNL30 = Table_PnL_30(:,2);

M_col_header={'Pair','MACDCHG', 'RSICHG','SKEW','PNL10','PNL30','Average'};
output_table_15_nolabel =[num2cell(M_MACD_CHANGE) num2cell(M_RSI_CHANGE) M_SKEW M_PNL10 M_PNL30];
output_table_15_average=mean(cell2mat(output_table_15_nolabel),2);
%% Create table of momentum indicators and average across pairs
output_table_15_all =[M_col_header;(xyz_name)' output_table_15_nolabel num2cell(output_table_15_average)];


%output_table_15 =cell2mat(output_table_15);



%% Divergence Factors
Monthly1 = Monthly1_Divergence_Factor(2:end,6); % from Table_rsi_percentile_Rank script
Monthly2 =(Monthly1_Divergence_Factor(2:end,4));
MACD_DAILY= Divergence_Macd_Prc';
%MISSING MACD MONHTLY AND OU 
M_col_header2={'Pair','Monthly1', 'Monthly2','MACD_Daily','Average'};
output_table_16_nolabel =[ Monthly1 Monthly2 num2cell(MACD_DAILY)];
output_table_16_average=mean(cell2mat(output_table_16_nolabel),2);

%% Create table of divergence indicators and average across pairs
output_table_16_all =[M_col_header2;(xyz_name)' output_table_16_nolabel num2cell(output_table_16_average)];
%% Combine tables
output_table_DMom = [output_table_16_all output_table_15_all];
%% Write Momentum and Divergence tables to excel

% xlwrite('myDMom.xls',output_table_DMom);

%B = zeros(size(M_MACD_CHANGE ));
%[~, ind] = sort(M_MACD_CHANGE (:));
%B(ind) = 1 : numel(B)

%%this does the same thing as code above
%[~,i]=sort(M_MACD_CHANGE);
%[~,xRanks]=sort(i);



