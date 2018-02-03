%% We calculate the moving averge

%% Create Input Matrix

inputMatrix=cell2mat((New_datax(2:end,:)));

% Pre allocate Output Matrix

outputMatrix_50MA=zeros(size((New_datax),1)-1,76);
disp('calculating 50 period moving averages.....')

for i = 1:size((New_datax),2)
   

temp=zeros(size((New_datax),1)-1,76);
M =cell2mat(New_datax(2:end,i));

temp = movmean(M,50);
% M10_moving_average = movmean(M,5);
% M20_moving_average = movmean(M,5);
% M50_moving_average = movmean(M,5);
% M100_moving_average = movmean(M,5);
  
outputMatrix_50MA(:,i)=temp;
end

col_header_3 =New_datax(1,:);
Table_50MAcal = num2cell(outputMatrix_50MA);
T_50MA =[col_header_3 ;Table_50MAcal(end,1:end)]';




 