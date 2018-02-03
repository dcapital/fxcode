%% Delete strings from T and rename it Tshort
Tshort = T;
% cols2remove=[ 10 18 24 25 ];
% Tshort(:,cols2remove)=[];

%% Find indices to elements in identified columns of Tshort that satisfy are overbought and oversold

ind10 = cell2mat(Tshort(2:end,12)) < 29 & cell2mat(Tshort(2:end,2)) > 0.0 & cell2mat(Tshort(2:end,3)) > 0.0 & cell2mat(Tshort(2:end,4)) > 0 & cell2mat(Tshort(2:end,17)) > 25;
ind20 = cell2mat(Tshort(2:end,12)) > 70 & cell2mat(Tshort(2:end,2)) < 0.0 & cell2mat(Tshort(2:end,3)) < 0.0 & cell2mat(Tshort(2:end,4)) < 0 & cell2mat(Tshort(2:end,17)) > 25;
%% Find Ranging Pairs

ind30 = cell2mat(Tshort(2:end,12)) > 65 & cell2mat(Tshort(2:end,2)) > 0.0 & cell2mat(Tshort(2:end,3)) > 0.0 & cell2mat(Tshort(2:end,4)) > 0 & cell2mat(Tshort(2:end,17)) < 20 & cell2mat(Tshort(2:end,17)) > 95;
ind40 = cell2mat(Tshort(2:end,12)) < 35 & cell2mat(Tshort(2:end,2)) > 0.0 & cell2mat(Tshort(2:end,3)) > 0.0 & cell2mat(Tshort(2:end,4)) > 0 & cell2mat(Tshort(2:end,17)) < 20 & cell2mat(Tshort(2:end,17)) < 5;

% Use the logical indices to index into Tshort to return required sub-matrices
      A1 = Tshort([false;ind10],:);
      A2 = Tshort([false;ind20],:);
      A3 = vertcat(A1 ,A2);
      
      
%       tDate = datetime('now','TimeZone','Europe/London','Format','d-MMM-y HH:mm:ss Z')
      CurrencyTrending=[A3(:,1)']
      
% Use the logical indices to index into Tshort to return required sub-matrices for Ranging Pairs      
      A4 = Tshort([false;ind30],:);
      A5 = Tshort([false;ind40],:);
      A6 = vertcat(A4 ,A5);
      
      CurrencyRanging=A6(:,1)'
      
      
      
      