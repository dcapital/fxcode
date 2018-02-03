%% Clear workspace
close all; clc; clear all;

%% Delete files

if exist ('myM_D_Indicators_sorted.xlsx')
delete ('myM_D_Indicators_sorted.xlsx')
end
if exist ('momentum_all.xls')
delete ('momentum_all.xls')
end
if exist ('Portfolio with Target Return.xlsx')
delete ('Portfolio with Target Return.xlsx')
end
if exist ('Portfolio with Target Risk.xlsx')
delete ('Portfolio with Target Risk.xlsx')
end
if exist ('Portfolio with Maximum Sharpe Ratio.xlsx')
delete ('Portfolio with Maximum Sharpe Ratio.xlsx')
end
if exist ('Coppock.xlsx')
delete ('Coppock.xlsx')
end
%% Login to OANDA API
tic
% API Live Account
account= '7975484';
token= 'e4f426366939cde4918847bf77f3b5c6-f11d0573a344edd0a806a6462e80da5c';
%token= 'a4ddcdce14c4b6c3316edd6e4b14829d-638cdf4bc5bf8b6d32c21f1cf6767603';
% token = 'e02a947ae4cd391126e8b7e9362be5bd-f2b564678b191095e7a26f15b752458f';
api = OandaAPI(token,'live',account) 
connected = false;
headers='';

% API account: '7237816'  
% token ='9dcfaa560886302ff4817957b337d8df-2521e79a49f5420fb12011f5a891f88f'


% Practice Account
% token ='b5505c11e2103cb49b4a58b7c05b3d7a-da97a0e5e43f307562cd88d4bf3b5e9b'; 
% another Live Account
% token ='f68349b93c6350f304923a27b83f34ea-5dc2c01746c8df162d4ea74b7eaa79d7';;
% another Account
% token ='b26dbcb9ad2f2d2e631a643ab48500a6-f0058b52d563951935b16725424a51db'; 
        
% Practice Account
% account= '7237816';
% token ='9dcfaa560886302ff4817957b337d8df-2521e79a49f5420fb12011f5a891f88f';
% api = OandaAPI(token,'practice',account)


% streaming = oandafunctions.OandaFunctions();
%% Pulling out the instrument entries, 

ListInstruments = api.GetInstruments();
%% Make List Instruments into a matrix 'dat'

dat = cell2mat(ListInstruments);
%% Prelocate a cell array 'p'
toc
p={1:124};
%% Assign list Instruments to cell array 'p'

p ={dat.instrument};
%% Extract history for List Instrments over 500 periods and assign to structure 's'

s=cellfun(@api.GetHistory,p);
%% Extract OHLCV data from s and assign to five structures 

ExtractPricesAndVolumes;
%% Create Asset list 
% Assign Instrument names to 'assetlist' and remove 'underscore'

assetlist =New_datax(1,:);
assetlist =regexprep(assetlist, '_','');
%% Indicators: Calculate MACD and Percentile rank of MACD
% Loop through Instruments and calculate the Moving Average Convergence Divergence for each instrument
% and store in a table. 
% Loop through Instruments and Calculate the Moving Average Convergence Divergence rolling period percentil rank
% for each Instrument and store in a table.

Table_Macd_new;
Table_macdRank;
%% Indicators: Calculate P&L and Percentile rank of P&L
% Loop through Instruments and calculate the cumulative profit and loss for each instrument
% and store in a table. 
% Loop through Instruments and calculate the cumulative profit and loss percentile rank
% for each Instrument and store in a table.

% Create Table: cumulative profit and loss for each Instrument.

inputMatrix_6=cell2mat((New_datax(2:end,:)));
outputMatrix_6=zeros(size((New_datax),1)-2,size((New_datax),2));

for i = 1:size((New_datax),2)
   
    temp=zeros(size((New_datax),1)-2,1);
    temp = cumgainloss(inputMatrix_6(:,i));
    outputMatrix_6(:,i)=temp;
end

col_header_3 =New_datax(1,:);
Table_PNL = [col_header_3;num2cell(outputMatrix_6)];

% Create Table: Ranking cumulative profit and loss for each Instrument.
 
inputMatrix_7=cell2mat((Table_PNL(2:end,:)));
outputMatrix_7=zeros(size((New_datax),1)-3,size((New_datax),2));

for i = 1:size((New_datax),2)
   
    temp_7=zeros(size((New_datax),1)-2,1);
    temp_7 = tiedrank(inputMatrix_7(2:end,i))/(length(inputMatrix_7));
    outputMatrix_7(:,i)=temp_7;
end

col_header_3 =New_datax(1,:);
Table_PNLrank = [col_header_3;num2cell(outputMatrix_7)];
 
last_pnlrank = Table_PNLrank(end,:);
last_tablepnlrank = [col_header_3;(last_pnlrank)]';
%% Indicators: Calculate RSI(20) and Percentile rank of RSI(20)
% Loop through Instruments and calculate the Relative Strength Index (RSI) for each instrument
% and store in a table. 

% Create Table: RSI
inputMatrix=cell2mat((New_datax(2:end,:)));
outputMatrix=zeros(size((New_datax),1)-1,size((New_datax),2));

for i = 1:size((New_datax),2)
   
    temp=zeros(size((New_datax),1),1);
    temp = rsindex(inputMatrix(:,i));
    outputMatrix(:,i)=temp;
end

 col_header_3 =New_datax(1,:);
 Table_rsi = [col_header_3;num2cell(outputMatrix)];

% Loop through Instruments and calculate the RSI percentile rank
% for each Instrument and store in a table.

Table_rsi_percentile_Rank;
%% Divergence Factor 1 and Divergence Factor 2

Algo_MACDRSI;
%% Indicators: Calculate rolling Skewness of each instrument

Table_skew;  
%% Indicators: Williams %R
Table_WillR
%% Indicators: Moving Averages

Table_5MA;
Table_10MA;
Table_20MA;
Table_50MA;
Table_100MA; % We also combine the last row of each MA table here and get TMAALL;
%% Indicators: Calculate Divergence factors MACD(20) - Price(20)
% Create Divergence Table, with RSI and WpctR 

Macd_Delta_T;

%% Indicators: Calculate ADX, D14+, D14-
% Create Momentum Table and ADX Table

Table_ADX

%% Indicators: MACD Delta and ADX

Macd_Delta_and_ADX_forecast;
%% Indicators: Calculate the Force Index

forceIndextest;
%% Indicators: Calculate the Force Index

Rolling_calc_FIdx;
%% Here we calculate the minimum and maximum price each period

minmaxrange_newstrat;
%% Indicators: Momentum and Divergence algorithmns

M_Indicators;
M_Indicators_Divergence_Rank;
%% Indicators: Here we calculate the Average True Range: a measure of volatility

avtruerange_ver2;
%% Sidebar Analysis: Returns array of top ten buys
% ANEWLIST =T(2:11,1)  %% i need to use cellfun to place this in the finpair function

pairs =T(2:4,1);
pairs =regexprep(pairs, '_','');
%% Sidebar Analysis: Derive locations array of top ten buys

%Modified_findpair(pairs); % add output paramter to this function
%anewList=num2cell(ans)'; % anewlist does not relfect index of instruments.
%check this

% Finds optimal portfolio based on top 15 positive divergence pairs

% CurrencyPort; %% THIS IS NOW FAILNG.  CODE TRING TO FIND INDEXED PAIRS
% NOT IN RANGE  ODD
%% Find the location of Instrument, return index and extract OHLC data

chartit;
%% Create RSI and MA dsiplay

% Analysis_Charts_2;
% PeakScript;
% Analysis_Charts_4V;
%% Find Overbought, Oversold, and Ranging Pairs, and assign to data structure

Ttruncate;
%% save price files
save D
save('pricefile.mat','New_datahighbidx','New_datalowbidx','New_datax','New_dataopenbidx','New_datavol')

save('pricefilewdate.mat','Table_New_datahighbidx','Table_New_datalowbidx','Table_New_datax','Table_New_dataopenbidx','Table_New_datavol')

%% Email output

mailme_with_something; 
%% create db
% clc
%mySQLiteWorkflowBuild;