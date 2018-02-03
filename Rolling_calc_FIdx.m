 Aroll = cell2mat(Table_forceindex(2:end,:));  % create a matrix of data

 Nroll = 1;
 Broll = Aroll(Nroll+1:end,:);
 Croll = Aroll(1:end-Nroll,:);
 Droll = Broll - Croll;


 lastDroll = Droll(end,:);  % double
 qRoll = Table_forceindex(1,:);  % cell
 
 lastFIdxchg =vertcat(qRoll, num2cell(lastDroll))';
 
 col_headFIdx ={'Pair', 'FIdxChg'}

 Table_lastFIdxchg = vertcat(col_headFIdx, lastFIdxchg);