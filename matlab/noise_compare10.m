function [err distlist]= noise_compare10(suffix,Dict,ns)
err=zeros(24,1);
distlist=[];
c=0;
%for c=0:23

for count=0:9
    [s, sr] = wavread(strcat('sound\',num2str(count),'\',num2str(count),'_',suffix,'.wav'));
    s=awgn(s,ns);
    % tone=.4.*sin(300.*(1:3200));
    % sound(tone,8000);
    % disp('Start speaking.')
    % s=wavrecord(1.5*sr,sr);
    % disp('End of Recording.');

    s=truncword(s);
    %sound(s,sr);
    %s=awgn(s,20,'measured'); % шум


    hashKeys = Dict.keys;
    i=1;
    while hashKeys.hasMoreElements

            key=hashKeys.nextElement;
            wordslist(i)=key;
            mfcc_s=mfcc(s);
            mfcc_e=Dict.get(key);
           distancelist(i)=dtw(mfcc_s(:,2:18),mfcc_e(:,2:18)); 
    %        refword=Dict.get(key);
    %        distancelist(i)=dtw3(kannumfcc(24,s',sr),kannumfcc(24,refword,sr));
            i=i+1;
    end


    [m, k] = min(distancelist);
   % disp(10-k);
    if (10-k)~=count
        err(c+1)=err(c+1)+1;
       % disp(['number: ', num2str(10-k)]);
       
 %        disp(strcat('ошибка распознавания: ',num2str(count),', распознана как: ', num2str(10-k)));
%         figure(count+1)
%             bar(9:-1:0,distancelist);
%     set(gca,'XLim',[-1 10]);
%     title(strcat('DTW distance:  ',num2str(count)));
%     xlabel('number');
%     ylabel('distance');
    end
end
 err(1)=sum(err);
 err(2:end)=[];
    %distlist=[distlist; count fliplr(distancelist)];
%end
% disp(strcat('ошибок: ', num2str(10*err),'%'));
%sound(Dict.get(num2str(10-k)),sr)