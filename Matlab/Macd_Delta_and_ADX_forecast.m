%% Loop through columns of New_datax
%% Calculate MACD, 20 day MACD_Delta change, and 
%% Calculate 20 day Price change for each column
format long

% load New_datax
New_datax_fwd = New_datax;

New_datax_fwd(2:3,:) = []; % make row 2 and three empty


size(New_datax_fwd);


last = New_datax_fwd(end,:); % retrieves the last row
New_datax_fwd(end+1,:) = last; % appends the last row to the end of New_datax_fwd
New_datax_fwd(end+1,:) = last; % appends the last row to the end of New_datax_fwd

size(New_datax_fwd);


xyz_name = New_datax(1,:);
xyz_fwd = cell2mat(New_datax_fwd(2:end,:));
% ii=[2 97 41 6];
counter = 1;
% i = ii
for i = 1:size(New_datax,2);
MACD_Delta_fwd =macd((xyz_fwd(:,i)));

MACD_Delta_uu_fwd(counter)= MACD_Delta_fwd(end);

RSI_u_fwd = rsindex((xyz_fwd(:,i)),20);
% RSI_u_fwd =rsindex(xyz_fwd(:,i)-movavg(xyz_fwd(:,i),30,30),20);
RSI_uu_fwd(counter)=RSI_u_fwd(end);

Prc_fwd=xyz_fwd(:,i);

Prc_uu_fwd(counter)=Prc_fwd(end);

Prc_chg_fwd(counter) = (Prc_fwd(end)-Prc_fwd(end-19))./Prc_fwd(end-19);

MACD_Delta_chg_fwd(counter) = MACD_Delta_fwd(end)-MACD_Delta_fwd(end-19);
counter = counter + 1;

MACD_delta_chg_fwd_scaled = MACD_Delta_chg_fwd./Prc_uu_fwd;

Divergence_Macd_Prc_fwd = MACD_delta_chg_fwd_scaled - Prc_chg_fwd;

Divergence_Macd_Prc_rank_fwd = (tiedrank(Divergence_Macd_Prc_fwd)-1) / (length(Divergence_Macd_Prc_fwd)-1);

end



MACD_Delta_chg_fwd;
RSI_uu_fwd;
Prc_chg_fwd ;

MACD_Delta_uu_fwd;
Prc_uu_fwd;

format long


output_table_2=[xyz_name ;...
    num2cell(Prc_uu_fwd);... 
    num2cell(MACD_Delta_uu_fwd);...
    num2cell(MACD_Delta_chg_fwd);...
    num2cell(Prc_chg_fwd);...
    num2cell(Divergence_Macd_Prc_fwd);...
    num2cell(Divergence_Macd_Prc_rank_fwd);...
    num2cell(RSI_uu_fwd)];



col_header2={'Pair','Price', 'Macd_Delta_fwd','MACD20_chg_fwd','Prc20_chg_fwd','Divergence_fwd','Divergence_fwd_rank','RSI_fwd'};

%% Output Table
Alltable_fwd = [col_header2; output_table_2'];

%% Bring all talbes together into one

% Momentum_table_ALL =[Alltable output_table Alltable_fwd];

%% Make sure your in folder Model before running this part


%  xlwrite('myMACD_Prc_chg_Divergence.xls',Alltable); 
%  xlwrite('myADX.xls',output_table); 

Momentum_table_all =[Momentum_table Alltable_fwd last_tableRSIrank_all Monthly1_Divergence_Factor Table_skewness_all];
 
Monthly1_Divergence_Factor;
% xlwrite('myMomentum_fwd.xls',Alltable_fwd); 

% xlwrite('momentum_all.xls',Momentum_table_all); 



% sorts Momentum_table_all by Divergence and write table to .xls file
sorted_all = sortrows(Momentum_table_all(2:end,:),[-6 8]);
col_header_all =Momentum_table_all(1,:);
sorted_all_w_headers  = [col_header_all; sorted_all];
% xlwrite('momentum_allsorted.xls',sorted_all_w_headers); 

