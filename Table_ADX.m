% Prepare inputs

hi = cell2mat(New_datahighbidx (2:end,:));
lo = cell2mat(New_datalowbidx (2:end,:));
cl = cell2mat(New_datax(2:end,:));

% Pre allocate output array
outputMatrix=zeros(size((New_datax),1)-1,3,76);

disp('calculating ADX Indicator.....')
for i = 1:76
 
    vout=zeros(size((New_datax),1)-1,3);
    vout =indicators([hi(:,i),lo(:,i),cl(:,i)],'adx',14);
    
outputMatrix(:,:,i)=vout;

    
end

Table_ADXcalc = num2cell(outputMatrix);
T_ADX =Table_ADXcalc(end,:,:);
T_ADX = reshape(T_ADX,[],size(New_datax,2))';

newcol= num2cell(zeros(76,1));

T_ADXres = [T_ADX, newcol];

T_ADX = [col_header_3', T_ADX, newcol];
col_head_ADX={'Pair','pdi','mdi','adx','adxr'};
T_ADX =[col_head_ADX; T_ADX];

% Join MACD Divergence Table to ADX Table

Momentum_table =[Alltable T_ADX];