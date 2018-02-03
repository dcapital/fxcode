%% We calculate the moving averge

%% Create Input Matrix

inputMatrix=cell2mat((New_datax(2:end,:)));

% Pre allocate Output Matrix

outputMatrix_100MA=zeros(size((New_datax),1)-1,76);
disp('calculating 50 period moving averages.....')

for i = 1:size((New_datax),2)
   

temp=zeros(size((New_datax),1)-1,76);
M =cell2mat(New_datax(2:end,i));

temp = movmean(M,100);
% M10_moving_average = movmean(M,5);
% M20_moving_average = movmean(M,5);
% M50_moving_average = movmean(M,5);
% M100_moving_average = movmean(M,5);
  
outputMatrix_100MA(:,i)=temp;
end
col_header_3 =New_datax(1,:);
Table_100MAcal = num2cell(outputMatrix_100MA);
T_100MA =[col_header_3 ;Table_100MAcal(end,1:end)]';

col_head_MA={'Pair','5MA','Pair','10MA','Pair','20MA','Pair','50MA', 'Pair','100MA'};
T_MAALL =[col_head_MA;T_5MA,T_10MA,T_20MA,T_50MA,T_100MA];

cols2removeMA=[ 3 5 7 9];
T_MAALL(:,cols2removeMA)=[];

DecisionMA = repmat(cellstr('no action'), size(T_MAALL, 1)-1, 1); 

% DecisionMA(cell2mat(New_datax(2:end,1)) > cell2mat(T_MAALL(2:end,2)) = {'1'};DecisionMA(cell2mat(New_datax(2:end,1)) < cell2mat(T_MAALL(2:end,2))= {'-1'};
