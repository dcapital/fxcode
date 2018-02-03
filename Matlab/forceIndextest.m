%% Calcuate table of Force Index for each currency
 
inputMatrix_forcecl=cell2mat((New_datax(2:end,:)));
inputMatrix_forcevol=cell2mat((New_datavol(2:end,:)));

outputMatrix_forceindex=zeros(size((New_datax),1)-2,size(New_datavol,2));
%% create matric of force index

for i = 1:size(New_datavol,2);
    
        period = 13;
        observ = size((New_datax),1)-1;
        
        cl = cell2mat(New_datax(2:end,i));
        vo = cell2mat(New_datavol(2:end,i));
       

       
        temp=zeros(1,size(New_datavol,2));
        temp = [(cl(2:observ)-cl(1:observ-1)).*vo(2:observ)];
        outputMatrix_forceindex(:,i)=tsmovavg(temp(1:end,:),'e',14,1);

 
end
        
col_header_3 =New_datax(1,:);

Table_forceindex = [col_header_3;num2cell(outputMatrix_forceindex)];

%% create force index table

FIdx_change =diff(outputMatrix_forceindex);

Table_FIdx_change =[col_header_3;num2cell(FIdx_change)];
%% write to xls
% xlwrite('Table_FIdx.xls',Table_forceindex); 

% xlwrite('Table_FIdx_change.xls',Table_FIdx_change);
%% pLot graphs
%figure
%subplot(2,1,1);
%plot(cell2mat(Table_forceindex(end-90:end,2)),':r');
%title('Graph of Force Index');
%legend('AUD/NZD')
%subplot(2,1,2);
%plot(cell2mat(New_datax(end-90:end,2)));
% title(cell2mat(New_datax(1,2)));
%title('Graph of Price');
%legend('AUD/NZD')

%  tsmovavg(temp,'e',14,1)
% figure
% plot(cell2mat(Table_forceindex(end-90:end,2)));