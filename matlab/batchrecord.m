   for count=0:9
tone=.4.*sin(300.*(1:3200));
    sound(tone,8000);
    disp('Start speaking.')
    s=wavrecord(1.5*sr,16000);
    disp('End of Recording.');
    wavwrite(s,16000,strcat(num2str(count),'_4.wav'));
   end