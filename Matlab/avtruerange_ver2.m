% ATR is a unique volatility indicator that reflects the degree of interest or disinterest in a move.
% Strong moves, in either direction, are often accompanied by large ranges, or large True Ranges.
% Uninspiring moves can be accompanied by relatively narrow ranges.
% if the historic average true range contracts while prices are trending upwards,
% then this might indicate that market sentiment may turn.
% A bullish reversal with an increase in ATR would show strong buying pressure and reinforce the reversal.
% A bearish support break with an increase in ATR would show strong selling pressure and reinforce the support break.
% Input data for average true range
storeATR = zeros(size((New_datax),1)-1, size(New_datax,2)); % Preallocation
for i = 1:size(New_datax,2);
%CCY = 61;  % col of currency in New_datax
 
hi = cell2mat(New_datahighbidx(2:end,i));
lo = cell2mat(New_datalowbidx(2:end,i));
cl = cell2mat(New_datax(2:end,i));
observ=size(New_datax(2:end,i));
% Variable argument inpu
% if isempty(varargin)
%            period = 20;
%         else
%             period = varargin{1};
% end
 
%%%% True range       
 
% high - low
h_m_l = hi-lo;
 
% abs(high - close)
h_m_c = [0;abs(hi(2:observ)-cl(1:observ-1))];
 
 
% abs(low - close)
l_m_c = [0;abs(lo(2:observ)-cl(1:observ-1))];
% true range
tr = max([h_m_l,h_m_c,l_m_c],[],2);
emaper = 20;
atrmul = 2;
atrper = 10;
atr = tsmovavg(tr,'e',14,1);
atr = movavg(tr,12,26,'e');
% Format Output
vout = atr;

storeATR(:,i) = vout;
end
colheadminmax = New_datax(1,:);
Table_ATR = ([colheadminmax ; num2cell(storeATR)]);
%% Output to .xls

xlwrite('myATR',Table_ATR);
 
% figure
% subplot(2,1,1);
% plot (vout);
% title(cell2mat(New_datax(1,i)));
% subplot(2,1,2);
% plot(cell2mat(New_datax(2:end,i)));
% title(cell2mat(New_datax(1,i)));
%  
 