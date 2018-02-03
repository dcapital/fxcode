
%% Extract all instrument names into a cell array.
%  The 'instruments' variable will be the same type as b.
% load s
instruments = vertcat({s.instrument});

%% Relevant instruments and assing to structure 'b'.

b= {'AUD_CAD','AUD_CHF','AUD_HKD','AUD_JPY','AUD_NZD','AUD_SGD','AUD_USD','BCO_USD','CAD_CHF','CAD_HKD','CAD_JPY',...
 'CAD_SGD','CHF_HKD','CHF_JPY','CHF_ZAR','EUR_AUD','EUR_CAD','EUR_CHF','EUR_CZK','EUR_DKK','EUR_GBP','EUR_HKD',...
 'EUR_HUF','EUR_JPY','EUR_NOK','EUR_NZD','EUR_PLN','EUR_SEK','EUR_SGD','EUR_TRY','EUR_USD','EUR_ZAR','GBP_AUD',...
 'GBP_CAD','GBP_CHF','GBP_HKD','GBP_JPY','GBP_NZD','GBP_PLN','GBP_SGD','GBP_USD','GBP_ZAR','HKD_JPY','NZD_CAD',...
 'NZD_CHF','NZD_HKD','NZD_JPY','NZD_SGD','NZD_USD','SGD_CHF','SGD_HKD','SGD_JPY','TRY_JPY','USB02Y_USD',...
 'USB05Y_USD','USB10Y_USD','USB30Y_USD','USD_CAD','USD_CHF','USD_CNH','USD_CZK','USD_DKK','USD_HKD','USD_HUF',...
 'USD_INR','USD_JPY','USD_MXN','USD_NOK','USD_PLN','USD_SAR','USD_SEK','USD_SGD','USD_THB','USD_TRY','USD_ZAR',...
 'ZAR_JPY'};

%% Here we calculate the number of elements in b
countb = size(b,2)

%% Here we assign b to 'col_head_ccy'
col_head_ccy = b;
col_time ={'DateTime'};
% b = {'AU200_AUD','CH20_CHF','CORN_USD','DE10YB_EUR','DE30_EUR','EU50_EUR','FR40_EUR',...
%     'HK33_HKD','JP225_USD','NAS100_USD','NATGAS_USD','NL25_EUR','SG30_SGD','SOYBN_USD',...
%     'SPX500_USD','SUGAR_USD','UK100_GBP','UK10YB_GBP','US2000_USD','US30_USD','USB02Y_USD',...
%     'USB05Y_USD','USB10Y_USD','USB30Y_USD','WHEAT_USD','WTICO_USD','XAG_EUR','XAG_GBP','XAG_HKD','XAG_JPY',...
%     'XAG_NZD','XAG_AUD','XAG_CAD','XAG_SGD',...
%     'XAG_USD','XAU_AUD','XAU_CAD','XAU_CHF','XAU_EUR','XAU_GBP','XAU_HKD','XAU_JPY',...
%     'XAU_NZD','XAU_SGD','XAU_USD','XAU_XAG','XCU_USD','XPD_USD','XPT_USD'};% here I am identifying a header, as it is the header of a column I wish to delete



%% We extract only relevant instruments from the overall structure so we find 
% location of the header in 'b'
[~, loc] = ismember(b,instruments);  

% Assign the instruments that we need to 'snew'
snew = s(loc); 

%% Extract all candles. We end up with 76 cells, each containing 1x500 cell array.
data = arrayfun(@(x)x.candles, snew, 'UniformOutput', false);

%% Now convert this into a X x 500 matrix of cells.
data = vertcat(data{:});

%% We can now extract all relevant fields using cellfun. 
New_dataopenbidx = (cellfun(@(x)x.openBid, data))';
New_datax = (cellfun(@(x)x.closeBid, data))';
New_datalowbidx = (cellfun(@(x)x.lowBid, data))';
New_datahighbidx = (cellfun(@(x)x.highBid, data))';
New_datavol = (cellfun(@(x)x.volume, data))';
%%
New_datatime = cellfun(@(x)x.time, data, 'Uniform', 0)';
%% Assign Header row
New_dataopenbidx=vertcat(col_head_ccy,num2cell(New_dataopenbidx));
New_datax=vertcat(col_head_ccy,num2cell(New_datax));
New_datalowbidx=vertcat(col_head_ccy,num2cell(New_datalowbidx));
New_datahighbidx=vertcat(col_head_ccy,num2cell(New_datahighbidx));
New_datavol=vertcat(col_head_ccy,num2cell(New_datavol));
New_datatime=vertcat(col_time,New_datatime(1:end,1));

%%
Table_New_dataopenbidx = horzcat(New_datatime,New_dataopenbidx);
Table_New_datax = horzcat(New_datatime,New_datax);
Table_New_datalowbidx = horzcat(New_datatime,New_datalowbidx);
Table_New_datahighbidx = horzcat(New_datatime,New_datahighbidx);
Table_New_datavol = horzcat(New_datatime,New_datavol);



