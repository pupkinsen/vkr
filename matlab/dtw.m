function [Dist, p, q] = dtw( siga, sigb )
%DTW Dynamic time warp
% %   Detailed explanation goes here
%     S1 = abs(spectrogram(siga,512,384,512,sr));
%     S2 = abs(spectrogram(sigb,512,384,512,sr));
S1=siga';
S2=sigb';
    ES1 = sqrt(sum(S1.^2))+1e-12;
    ES2 = sqrt(sum(S2.^2))+1e-12;
    M = (S1'*S2)./(ES1'*ES2);
    M=1-M;
          
    [r,c] = size(M);


    D = zeros(r+1, c+1);
    D(1,:) = NaN;
    D(:,1) = NaN;
    D(1,1) = 0;
    D(2:(r+1), 2:(c+1)) = M;


    phi = zeros(r,c);
   

    for i = 1:r; 
      for j = 1:c;
          if (abs(i-j*r/c)<r/4)
            [dmax, tb] = min([2*D(i, j), D(i, j+1), D(i+1, j)]);
          elseif (i>j)
              dmax=D(i,j+1);
              tb=2;
          else
              dmax=D(i+1,j);
              tb=3;
          end
        D(i+1,j+1) = D(i+1,j+1)+dmax;
        phi(i,j) = tb;
      end
    end


    i = r; 
    j = c;
    p = i;
    q = j;
    while i > 0 && j > 0
      tb = phi(i,j);
      if (i==1)
          j=j-1;
      elseif (j==1)
          i=i-1;
      else
          if (tb == 1)
            i = i-1;
            j = j-1;
          elseif (tb == 2)
            i = i-1;
          elseif (tb == 3)
            j = j-1;
          else    
            error;
          end
      end
      p = [i,p];
      q = [j,q];
    end


    D = D(2:(r+1),2:(c+1));
    Dist=D(end,end)/length(p);
    
end

