function out = mfcc(sig,nfilt,wlen,woverlap) % MFCC calculation
% sig = input signal
% nfilt = number of coefficients
% wlen = window width
% woverlap = window increment
%
%

if nargin <4
    woverlap=128;
    if nargin <3
        nfilt=24;
        if nargin <2
            wlen=256;
        end
    end
end

bank=melbankm(nfilt,wlen,16000,0,0.5,'m'); 
bank=full(bank); 
bank=bank/max(bank(:)); 
 
dctcoef=zeros(nfilt/2,nfilt);

for k=1:(nfilt/2)
  n=0:nfilt-1; 
  dctcoef(k,:)=cos((2*n+1)*k*pi/(2*nfilt)); 
end 
 
 
w = 1 + 6 * sin(pi * (1:nfilt/2) ./ (nfilt/2)); 
w = w/max(w); 
 

xx=double(sig); 
xx=filter([1 -0.9375],1,xx); 
 

xx=enframe(xx,wlen,woverlap); 
 
m=zeros(size(xx,1),size(dctcoef,1));

for i=1:size(xx,1) 
  y = xx(i,:); 
  s = y' .* hamming(wlen); 
  t = abs(fft(s)); 
  t = t.^2; 
  c1=dctcoef * (log(bank * t(1:(wlen/2+1)))); 
  c2 = c1.*w'; 
  m(i,:)=c2'; 
end 
 

dtm = zeros(size(m)); 
for i=3:size(m,1)-2 
  dtm(i,:) = -2*m(i-2,:) - m(i-1,:) + m(i+1,:) + 2*m(i+2,:); 
end 
dtm = dtm / 3; 
 
 
out = [m dtm]; 

out = out(3:size(m,1)-2,:); 