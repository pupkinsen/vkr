function err = compare2(s,Dict)
   
    s=truncword(s);

    hashKeys = Dict.keys;
    i=1;
    while hashKeys.hasMoreElements

            key=hashKeys.nextElement;
            wordslist(i)=key;
            mfcc_s=mfcc(s);
            mfcc_e=Dict.get(key);
           distancelist(i)=dtw(mfcc_s(:,1:end),mfcc_e(:,1:end)); 
            i=i+1;
    end


    [m, k] = min(distancelist);
    disp(10-k);

%         figure(count+1)
             bar(9:-1:0,distancelist);
     set(gca,'XLim',[-1 10]);
     title('');
     xlabel('Слово');
     ylabel('Расстояние');
        
end
% disp(strcat('ошибок: ', num2str(10*err),'%'));
%sound(Dict.get(num2str(10-k)),sr)