%% %R = (Highest High - Close)/(Highest High - Lowest Low) * -100
% Lowest Low = lowest low for the look-back period
% Highest High = highest high for the look-back period
% %R is multiplied by -100 correct the inversion and move the decimal.
% As with the Stochastic Oscillator, Williams %R reflects the level of 
% the close relative to the high-low range over a given period of time.
% Assume that the highest high equals 110, the lowest low equals 100 and 
% the close equals 108. The high-low range is 10 (110 - 100), which is 
% the denominator in the %R formula. The highest high less the close 
% equals 2 (110 - 108), which is the numerator 0.2 divided by 10 
% equals 0.20. Multiply this number by -100 to get -20 for %R. 
% If the close was 103, Williams %R would be -70 (((110-103)/10) x -100).
% Williams %R moves between 0 and -100, which makes -50 the midpoint
% A Williams %R cross above -50 signals that prices are trading 
% in the upper half of their high-low range for the given look-back period.
% Conversely, a cross below -50 means prices are trading in the 
% bottom half of the given look-back period. 
% As a bound oscillator, Williams %R makes it easy to identify overbought 
% and oversold levels. The oscillator ranges from 0 to -100. 
% Williams %R will always fluctuate within this range. 
% Traditional settings use -20 as the overbought threshold and -80 as 
% the oversold threshold
%% Create Input Matrix

inputMatrix=cell2mat((New_datax(2:end,:)));

% Pre allocate Output Matrix

outputMatrix_wpctr=zeros(size((New_datax),1)-1,size((New_datax),2));
disp('calculating Williams per cent R.....')

for i = 1:size((New_datax),2)
   
    willP =[cell2mat(New_datahighbidx(2:end,i)), cell2mat(New_datalowbidx(2:end,i)), cell2mat(New_datax(2:end,i))];
  
    temp=zeros(size((New_datax),1)-1,1);
    temp = willpctr(willP);
    outputMatrix_wpctr(:,i)=temp;
end

 col_header_3 =New_datax(1,:);
 Table_willR = [col_header_3;num2cell(outputMatrix_wpctr)];
 
xlwrite('will%R.xls',Table_willR);
 