%% Divergence Factor 3: MACD(20)Delta - Price(20) Delta 
% Loop through data structure and upon each iteration calculate 
% 20 day MACD change, and 20 day Price change for each instrument.
% Calculate the divergence between the MACD change and the Price change.

% Prepare data

format long
xyz_name = New_datax(1,:);
xyz = cell2mat(New_datax(2:end,:));

% Upon each iteration calculate the 20 days MACD and the 20 day Price
% change for each instrument. Calcula the divergence between the 20 day MACD and
% the 20 day Price change.

counter = 1;

for i = 1:size(New_datax,2);

    MACD_Delta =macd((xyz(:,i)));

    MACD_Delta_uu(counter)= MACD_Delta(end);

    RSI_u = rsindex((xyz(:,i)),20);

    RSI_uu(counter)=RSI_u(end);

    Prc=xyz(:,i);

    Prc_uu(counter)=Prc(end);

    Prc_chg(counter) = (Prc(end)-Prc(end-19))./Prc(end-19);

    MACD_Delta_chg(counter) = MACD_Delta(end)-MACD_Delta(end-19);
    counter = counter + 1;

    MACD_delta_chg_scaled = MACD_Delta_chg./Prc_uu;

    Divergence_Macd_Prc = MACD_delta_chg_scaled - Prc_chg;

    Divergence_Macd_Prc_rank = (tiedrank(Divergence_Macd_Prc)-1) / (length(Divergence_Macd_Prc)-1);
end


% 20 period MACD change
MACD_Delta_chg;
% Relative Strength Index
RSI_uu;
% 20 period Price change
Prc_chg ;

MACD_Delta_uu;
Prc_uu;

format long

output_table2=[xyz_name ; num2cell(Prc_uu); num2cell(MACD_Delta_uu); num2cell(MACD_Delta_chg); num2cell(Prc_chg); num2cell(Divergence_Macd_Prc);num2cell(Divergence_Macd_Prc_rank);num2cell(RSI_uu);num2cell(outputMatrix_wpctr(end,1:end));];

col_header2={'Pair','Price', 'Macd_Delta','MACD20_chg','Prc20_chg','Divergence','Divergence_Rank','RSI','WpctR'};

Alltable = [col_header2; output_table2'];



