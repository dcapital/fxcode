%% Create table of ranking of Divergence indicators for each currency
disp('calculating divergence rankings.....')
Inputmatrix_20 =[(xyz_name)' output_table_16_nolabel];
[Rankaverage] = Inputmatrix_20(:,1:end);
%disp('import from Excel sheet:')
for i=2: size(Rankaverage,2)
Rankaverage(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),Rankaverage)) = {''};
%disp('after adding rank column:');
[~,ind]=sort([Rankaverage{:,i}],'descend');
[~,ind2]=sort(ind);
Rankaverage_ind=[Rankaverage,num2cell(ind2')];
end
ind2=zeros(size(Rankaverage,1),size(Rankaverage,2)-1);
for i=2:size(Rankaverage,2)
[~,ind]=sort([Rankaverage{:,i}],'descend');
[~,ind2(:,i-1)]=sort(ind);
end
%mean_column=num2cell(mean(cell2mat(Rankaverage(:,2:end)),2));
mean_column2 =mean((ind2),2);
%put everything together
Outputmatrix_D=[Rankaverage,num2cell(ind2),num2cell(mean_column2)];
 
 
[~,ind]=sort([Outputmatrix_D{:,end}],'ascend');
[~,ind3]=sort(ind);
Outputmatrix_divergence_final=[Outputmatrix_D,num2cell(ind3')];

%% Run Momentum indicators rank script
M_Indicators_momentum_rank;

%% Write Indicator Tables to xls
Col_Indicators_DM ={'Pair','Monthly1', 'Monthly2','MACD_Daily','Monthly1Rank', 'Monthly2Rank','MACD_DailyRank','Average','DivergenceRank','Pair','MACDCHG', 'RSICHG','SKEW','PNL10','PNL30','MACDCHGRank', 'RSICHGRank','SKEWRank','PNL10Rank','PNL30Rank','Average','MomentumRank','RSI','WpctR','Price','pdi','mdi','adx','adxr'};

Outputmatrix_divergence_momentum_final =[Col_Indicators_DM;Outputmatrix_divergence_final Outputmatrix_momentum_final num2cell(RSI_uu') num2cell(outputMatrix_wpctr(end,1:end))' num2cell(Prc_uu') T_ADXres];


% xlwrite('myM_D_Indicators',Outputmatrix_divergence_momentum_final); 


% Create a new column called 'Decision'

% RSI_column = 23;
% place the string 'no action' in the entire column by default

% Decision = repmat(cellstr('no action'), size(Outputmatrix_divergence_momentum_final, 1), 1);

% place 'buy, 'sell' in the decsion column based on RSI criteria

% Decision(cell2mat( Outputmatrix_divergence_momentum_final(2:end,RSI_column)) < 20) = {'Buy'};
% Decision(cell2mat( Outputmatrix_divergence_momentum_final(2:end,RSI_column)) > 80) = {'Sell'};

% place the string 'action' in first row of the decison column

% Decision{1} = 'Action';
% Append decision column to cell array 'T' and call it T_NEW

Outputmatrix_divergence_momentum_final_NEW = [Outputmatrix_divergence_momentum_final Table_minmax2_all Table_lastFIdxchg T_MAALL];

%sortrows and keep headers

% Outputmatrix_divergence_momentum_final_NEW_SORT = sortrows(Outputmatrix_divergence_momentum_final_NEW(2:end,:),9);

sT=[Outputmatrix_divergence_momentum_final_NEW(1,:);sortrows(Outputmatrix_divergence_momentum_final_NEW(2:end,:),9)];
 
%remove 2nd column from cell array
sT_delcol = sT;
cols2remove=[ 11 12 13 14 15 16 17 18 19 20 21 32 33 34 35 36 39 40 41];
 
sT_delcol(:,cols2remove)=[];

T = sT_delcol;

% Create a new column called 'Decision'
RSI_column = 12;

Decision = repmat(cellstr('no action'), size(T, 1)-1, 1); 

Decision(cell2mat( T(2:end,RSI_column)) < 25) = {'1'}; Decision(cell2mat( T(2:end,RSI_column)) > 70) = {'-1'};

% Append it to cell array 'T'

 
Decision = vertcat('Long or Short', Decision);

T = [T Decision];


ADX_column = 17;

Decision = repmat(cellstr('no action'), size(T, 1)-1, 1); 

Decision(cell2mat( T(2:end,ADX_column)) < 20) = {'Ranging'}; Decision(cell2mat( T(2:end,ADX_column)) > 25) = {'Trending'};

% Append it to cell array 'T'

 
Decision = vertcat('trade type', Decision);

T = [T Decision];



%% Output to .xls

xlwrite('myM_D_Indicators_sorted',T); 
