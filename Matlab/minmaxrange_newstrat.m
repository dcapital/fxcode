%% Here we find the min min max range over 60 days, and locate the percentile rank of current price within that range
storehigh =zeros(1, size(New_datahighbidx,2));
storelow = zeros(1, size(New_datahighbidx,2));
store = zeros(1, size(New_datahighbidx,2)); % Preallocation
% for i = 1 : size((New_datax),2)

 for i = 1 : size((New_datahighbidx),2);
   

A = cell2mat(New_datahighbidx(end-18:end,i));
Alow = cell2mat(New_datalowbidx(end-18:end,i));

[maxVal maxInd] = max(A); % find the max value and max Index in B
[minVal minInd] = min(Alow);  % find the min value and min Index in B 


Rng = abs(maxVal)-abs(minVal);

% where is the last price in the range of minumimn to maximum
Pnow =cell2mat(New_datax(end-18:end,i));
whereInRng = ((Pnow(end,1)-abs(minVal))./Rng)*100;  

store(i) = whereInRng;
storelow(i) = minVal;
storehigh(i) = maxVal;
end

colheadminmax = New_datax(1,:);

col_head_minmax={'Pair','MinMaxPosition','pdi','mdi','adx','adxr'};
%Table_minmax = ([colheadminmax ; num2cell(store)])';
col_head_minmax2={'Pair','MinMaxPosition','pdi','mdi','adx','adxr','Price','High_Price(14)' ,'Low_Price(14)','RSI'};

Table_minmax = ([colheadminmax;  num2cell(store); T_ADXres'])';

Table_minmax_all=[col_head_minmax;Table_minmax];
Table_minmax2 = horzcat(Table_minmax, New_datax(end,:)',num2cell(storehigh)', num2cell(storelow)', Table_rsi(end,:)');
Table_minmax2_all =[col_head_minmax2;Table_minmax2];

xlwrite('myminmaxrng',Table_minmax2_all); 
