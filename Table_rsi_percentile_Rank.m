%% Create input Table_rsi  (use this one and not m file Table_rsiRank)

%% Create Table Ranking RSI

inputMatrix_3=cell2mat((Table_rsi(2:end,:)));
outputMatrix_3=zeros(size((New_datax),1)-2,size((New_datax),2));
for i = 1:size((New_datax),2)
   
    temp_3=zeros(size((New_datax),1)-1,1);
    temp_3 = tiedrank(inputMatrix_3(2:end,i))/(length(inputMatrix_3)-14);
    outputMatrix_3(:,i)=temp_3;
end

 col_header_3 =New_datax(1,:);
 Table_RSIrank = [col_header_3;num2cell(outputMatrix_3)];
%% This is the most recent RSI percentile rank

col_header5={'Pair','RSI percentile rank'};
last_RSIrank = Table_RSIrank(end,:);
last_tableRSIrank = [col_header_3;(last_RSIrank)]';
last_tableRSIrank_all =[col_header5;last_tableRSIrank];


%%







%% add this MACD pctrank and take element by element simple average, 
% then subtract PNL pct rank to calc monthly 1 divergence factor

% last_tableRSIrank_all_minus_100 =0.1-(cell2mat(last_tableRSIrank(1:end,2))); 
% 
% Divergence_factor_mth_1 = (cell2mat(last_tablemacdrank(:,2))+(last_tableRSIrank_all_minus_100(:,1)))./2;
% Divergence_factor_mth_1 = num2cell(Divergence_factor_mth_1);

%% MACD_RSI pct divergence minus pnl pct

% Divergence_factor_pnl_scaled = cell2mat(Divergence_factor_mth_1)- (cell2mat(last_pnlrank'));
%% Create table of PnL Divergence from ......

% col_8 ={'Pair', 'PnLDivergence'};
% Table_Divergence_factor_pnl_scaled = [col_header_3' num2cell(Divergence_factor_pnl_scaled)];
% Table_Divergence_factor_pnl_scaled_all =[col_8;Table_Divergence_factor_pnl_scaled];
%% Create table header

% col_9 ={'Pair', 'MACD_pct', 'RSI_pct', 'MACD_RSI_Divergence','pnl_pct','MACD_RSI_Divergence_scaled'};
%% Create final table

% Divergence_factor_table_pnl_scaled = [col_header_3' last_tablemacdrank(:,2) last_tableRSIrank(:,2) Divergence_factor_mth_1 last_pnlrank' num2cell(Divergence_factor_pnl_scaled)];
% Monthly1_Divergence_Factor =[col_9;Divergence_factor_table_pnl_scaled];
%% Write output to MS Excell
% xlwrite('monthly1Divergencefactor.xls',Monthly1_Divergence_Factor);
% xlwrite('Table_RSIrank.xls',Table_RSIrank);