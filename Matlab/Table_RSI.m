inputMatrix=cell2mat((New_datax(2:end,:)));
% outputMatrix=zeros(500,size((ListInstruments),2));
outputMatrix=zeros(500,size((New_datax),2));
% for i = 1:size((ListInstruments),2)
for i = 1:size((New_datax),2)
   
    temp=zeros(500,1);
    temp = rsindex(inputMatrix(:,i),20);
%     temp= rsindex(inputMatrix(:,i)-movavg(inputMatrix(:,i),30,30),20)
    outputMatrix(:,i)=temp;
end

 col_header_3 =New_datax(1,:);
 Table_rsi = [col_header_3;num2cell(outputMatrix)];