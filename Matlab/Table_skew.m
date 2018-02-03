%% Create table of currency skewness

inputMatrix=cell2mat((New_datax(2:end,:)));
% outputMatrix=zeros(500,size((ListInstruments),2));
outputMatrix=zeros(500,size((New_datax),2));

% for i = 1:size((ListInstruments),2)
for i = 1:size((New_datax),2)
   
    temp=zeros(500,1);
    temp = skewness(inputMatrix(:,i));
    outputMatrix(:,i)=temp;
end

 col_header_3 =New_datax(1,:);
 Table_skewness = [col_header_3;num2cell(outputMatrix)];
 
 col_header_14={'Pair','Skewness'};
 Table_skewness_last = [col_header_3;num2cell(outputMatrix(end,:))]';
 
 Table_skewness_all = [col_header_14; Table_skewness_last];