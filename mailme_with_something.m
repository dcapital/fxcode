% sendmail('charlesglah@googlemail.com','Hello from MATLAB!', ...
%     'Thanks for using sendmail.',{'/users/myhomefolder/document/MATLAB/'openBid.xls'});, ...
  
    
%     'C:\yourFileSystem\message2.txt'});


mail_to = {'myfinance20@yahoo.com'};

mail_it = 'charlesglah@googlemail.com';
% 'charlesglah@googlemail.com';
password = 'melody1234';

setpref('Internet','SMTP_Server','smtp.gmail.com');

setpref('Internet','E_mail',mail_it);

setpref('Internet','SMTP_Username',mail_it);

setpref('Internet','SMTP_Password',password);

props = java.lang.System.getProperties;

props.setProperty('mail.smtp.auth','true');

props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');

props.setProperty('mail.smtp.socketFactory.port','465');

sendmail(mail_to,'PairAnalysis','Hello! Here are your signals',...
    {'/Users/myhomefolder/Documents/MATLAB/myM_D_Indicators_sorted.xlsx'});

% '/Users/myhomefolder/Documents/MATLAB/Portfolio with Target Return.xlsx'...
% '/Users/myhomefolder/Documents/MATLAB/Portfolio with Target Risk.xlsx'...
% '/Users/myhomefolder/Documents/MATLAB/Portfolio with Maximum Sharpe Ratio.xlsx'});
    %'/Users/myhomefolder/Documents/MATLAB/lowbid.xls','/Users/myhomefolder/Documents/MATLAB/highbid.xls'});
%%I've used the following variables:

       %%Gmail: smtp.gmail.com port=465
disp('Report sent.....')
        %% Hotmail: smtp.live.com port=465 and port=587

        %% Yahoo: smtp.mail.yahoo.com port=587