%% Clear chart_data
clear chart_data
%% here I assign the first row of the input data to a variable 'a'

assetlist =New_datax(1,1:end);  %% asset list
% assetlist =regexprep(assetlist, '_','' );
% here I am identifying columns I wish to delete by header name
b = {'AUD_USD'};

%%
 
% b= {'AUD_CAD','AUD_CHF','AUD_HKD','AUD_JPY','AUD_NZD','AUD_SGD','AUD_USD','BCO_USD','CAD_CHF','CAD_HKD','CAD_JPY',...
%  'CAD_SGD','CHF_HKD','CHF_JPY','CHF_ZAR','EUR_AUD','EUR_CAD','EUR_CHF','EUR_CZK','EUR_DKK','EUR_GBP','EUR_HKD',...
%  'EUR_HUF','EUR_JPY','EUR_NOK','EUR_NZD','EUR_PLN','EUR_SEK','EUR_SGD','EUR_TRY','EUR_USD','EUR_ZAR','GBP_AUD',...
%  'GBP_CAD','GBP_CHF','GBP_HKD','GBP_JPY','GBP_NZD','GBP_PLN','GBP_SGD','GBP_USD','GBP_ZAR','HKD_JPY','NZD_CAD',...
%  'NZD_CHF','NZD_HKD','NZD_JPY','NZD_SGD','NZD_USD','SGD_CHF','SGD_HKD','SGD_JPY','TRY_JPY','USB02Y_USD',...
%  'USB05Y_USD','USB10Y_USD','USB30Y_USD','USD_CAD','USD_CHF','USD_CNH','USD_CZK','USD_DKK','USD_HKD','USD_HUF',...
%  'USD_INR','USD_JPY','USD_MXN','USD_NOK','USD_PLN','USD_SAR','USD_SEK','USD_SGD','USD_THB','USD_TRY','USD_ZAR',...
%  'ZAR_JPY'};

% b = {'AU200_AUD','CH20_CHF','CORN_USD','DE10YB_EUR','DE30_EUR','EU50_EUR','FR40_EUR',...
%     'HK33_HKD','JP225_USD','NAS100_USD','NATGAS_USD','NL25_EUR','SG30_SGD','SOYBN_USD',...
%     'SPX500_USD','SUGAR_USD','UK100_GBP','UK10YB_GBP','US2000_USD','US30_USD','USB02Y_USD',...
%     'USB05Y_USD','USB10Y_USD','USB30Y_USD','WHEAT_USD','WTICO_USD','XAG_EUR','XAG_GBP','XAG_HKD','XAG_JPY',...
%     'XAG_NZD','XAG_AUD','XAG_CAD','XAG_SGD','XAG_USD','XAU_AUD','XAU_CAD','XAU_CHF',...
%     'XAU_EUR','XAU_GBP','XAU_HKD','XAU_JPY','XAU_NZD','XAU_SGD','XAU_USD','XAU_XAG','XCU_USD','XPD_USD','XPT_USD','XAG_CHF'};

% here I count the number of columns

[tf,loc] = ismember(b,assetlist);  % here I finding the location of the header in the cell array a
tf = find(tf);
[~,idx] = unique(loc(tf), 'first');
c = tf(idx);  % here I am creating a matrix c wich contain the index of the header I want to delete
%%
openPrice = cell2mat(New_dataopenbidx(2:end,loc));

highPrice = cell2mat(New_datahighbidx(2:end,loc));

lowPrice = cell2mat(New_datalowbidx(2:end,loc));

vol_data = cell2mat(New_datavol(2:end,loc));

closePrice = cell2mat(New_datax(2:end,loc));

% chart_data = [openPrice, highPrice, lowPrice, closePrice, vol_data]
chart_data = [openPrice, highPrice, lowPrice, closePrice, vol_data];

chart_data_calcDMI = [highPrice, lowPrice, closePrice];

loc





