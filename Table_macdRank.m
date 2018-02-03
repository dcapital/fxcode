%% Create table ranking MACD for all currencies

inputMatrix_2=cell2mat((Table_MACD(2:end,:)));
% outputMatrix_2=zeros(499,size((ListInstruments),2));
outputMatrix_2=zeros(size((New_datax),1)-2,size((New_datax),2));
% for i = 1:size((ListInstruments),2)
for i = 1:size((New_datax),2)
   
    temp_2=zeros(499,1);
    temp_2 = tiedrank(inputMatrix_2(2:end,i))/(length(inputMatrix_2)-26);
    outputMatrix_2(:,i)=temp_2;
end

 col_header_3 =New_datax(1,:);
 Table_MACDrank = [col_header_3;num2cell(outputMatrix_2)];
 

last_macdrank = Table_MACDrank (end,:);

last_tablemacdrank = [col_header_3;(last_macdrank)]';

col_header_5 = {'Pair','MACD_Rank'};

last_tablemacdrank_all = [col_header_5;  (last_tablemacdrank)];
