%% Create MACD for all currency pairs

inputMatrix=cell2mat((New_datax(2:end,:)));
% outputMatrix=zeros(500,size((ListInstruments),2));
outputMatrix=zeros(size((New_datax),1)-1,size((New_datax),2));

% for i = 1:size((ListInstruments),2)
for i = 1:size((New_datax),2)
   
    temp=zeros(size((New_datax),1)-1,1);
    temp = macd(inputMatrix(:,i));
    outputMatrix(:,i)=temp;
end

 col_header_3 =New_datax(1,:);
 Table_MACD = [col_header_3;num2cell(outputMatrix)];
 

 