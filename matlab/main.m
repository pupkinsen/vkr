clc
clear
close all
%Creating dictionary hashtable
Dict = java.util.Hashtable;

[s_e1_3, sr] = wavread('sound\1\1_3.wav');
s_e1_3=mfcc(truncword(s_e1_3));
Dict.put('1',s_e1_3);

[s_e2_3, sr] = wavread('sound\2\2_2.wav');
s_e2_3=mfcc(truncword(s_e2_3));
Dict.put('2',s_e2_3);

[s_e3_3, sr] = wavread('sound\3\3_3.wav');
s_e3_3=mfcc(truncword(s_e3_3));
Dict.put('3',s_e3_3);

[s_e4_3, sr] = wavread('sound\4\4_3.wav');
s_e4_3=mfcc(truncword(s_e4_3));
Dict.put('4',s_e4_3);

[s_e5_3, sr] = wavread('sound\5\5_2.wav');
s_e5_3=mfcc(truncword(s_e5_3));
Dict.put('5',s_e5_3);

[s_e6_3, sr] = wavread('sound\6\6_3.wav');
s_e6_3=mfcc(truncword(s_e6_3));
Dict.put('6',s_e6_3);

[s_e7_3, sr] = wavread('sound\7\7_3.wav');
s_e7_3=mfcc(truncword(s_e7_3));
Dict.put('7',s_e7_3);

[s_e8_3, sr] = wavread('sound\8\8_3.wav');
s_e8_3=mfcc(truncword(s_e8_3));
Dict.put('8',s_e8_3);

[s_e9_3, sr] = wavread('sound\9\9_3.wav');
s_e9_3=mfcc(truncword(s_e9_3));
Dict.put('9',s_e9_3);

[s_e0_3, sr] = wavread('sound\0\0_2.wav');
s_e0_3=mfcc(truncword(s_e0_3));
Dict.put('0',s_e0_3);



%%%%%%%%%%%%%%%%%%%%
% err=0;
% for count=0:9
%     [s, sr] = wavread(strcat(num2str(count),'_5.wav'));
%     
%     % tone=.4.*sin(300.*(1:3200));
%     % sound(tone,8000);
%     % disp('Start speaking.')
%     % s=wavrecord(1.5*sr,sr);
%     % disp('End of Recording.');
% 
err=0;
distances=[];
for i=2:11
[er dlist]=compare10(num2str(i),Dict);
if er~=0
    disp(i);
 end
err=err+ er;
distances=[distances; dlist];
end




