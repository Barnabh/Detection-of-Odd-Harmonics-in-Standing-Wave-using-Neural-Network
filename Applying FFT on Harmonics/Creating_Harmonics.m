clear all
close all
clc
fs=1600; ts=1/fs;
f1=50;
k=0; tf=1; f=50;c=10;snr=50;
for t=0:ts:tf-ts;
    
  if t<.1
        v=sqrt(2)*[1*sin(2*pi*f*t+152/180*pi)+.2*sin(2*pi*3*f*t+35/180*pi)+.2*sin(2*pi*5*f*t)+.1*sin(2*pi*7*f*t)+.1*sin(2*pi*9*f*t+152/180*pi)+.1*sin(2*pi*11*f*t+35/180*pi)+.1*sin(2*pi*13*f*t)+.1*sin(2*pi*15*f*t)];
        v=awgn(v,snr);
        v1=sqrt(2)*1*sin(2*pi*50*t+152/180*pi);
        v2=sqrt(2)*.2*sin(2*pi*3*50*t+35/180*pi);
        v3=sqrt(2)*.2*sin(2*pi*5*50*t);
        v4=sqrt(2)*.1*sin(2*pi*7*50*t);
        v5=sqrt(2)*.1*sin(2*pi*9*50*t+152/180*pi);
        v6=sqrt(2)*.1*sin(2*pi*11*50*t+35/180*pi);
        v7=sqrt(2)*.1*sin(2*pi*13*50*t);
        v8=sqrt(2)*.1*sin(2*pi*15*50*t);
    else
        v=sqrt(2)*[1*sin(2*pi*f*t+152/180*pi)+.2*sin(2*pi*3*f*t+35/180*pi)+.2*sin(2*pi*5*f*t)+.1*sin(2*pi*7*f*t)+.1*sin(2*pi*9*f*t+152/180*pi)+.1*sin(2*pi*11*f*t+35/180*pi)+.1*sin(2*pi*13*f*t)+.1*sin(2*pi*15*f*t)];
        v=awgn(v,snr);
        v1=sqrt(2)*1*sin(2*pi*50*t+152/180*pi);
        v2=sqrt(2)*.2*sin(2*pi*3*50*t+35/180*pi);
        v3=sqrt(2)*.2*sin(2*pi*5*50*t);
        v4=sqrt(2)*.1*sin(2*pi*7*50*t);
        v5=sqrt(2)*.1*sin(2*pi*9*50*t+152/180*pi);
        v6=sqrt(2)*.1*sin(2*pi*11*50*t+35/180*pi);
        v7=sqrt(2)*.1*sin(2*pi*13*50*t);
        v8=sqrt(2)*.1*sin(2*pi*15*50*t);
   end
    k=k+1;
    x(k)=v;
    x1(k)=v1;
    x2(k)=v2;
    x3(k)=v3;
    x4(k)=v4;
    x5(k)=v5;
    x6(k)=v6;
    x7(k)=v7;
    x8(k)=v8;
end
tw=0.2;
for i=1:(tf/tw)
 xw=x(((fs/f1)*c)*(i-1)+1:i*((fs/f1)*c));
 rmsvlu=fftfun10(xw);
 rmsfin(i,:)=rmsvlu;
end
for i=1:(tf/tw)
v1trrms(i)=rms(x1(fs*tw*(i-1)+1:fs*tw*i));
v2trrms(i)=rms(x2(fs*tw*(i-1)+1:fs*tw*i));
v3trrms(i)=rms(x3(fs*tw*(i-1)+1:fs*tw*i));
v4trrms(i)=rms(x4(fs*tw*(i-1)+1:fs*tw*i));
v5trrms(i)=rms(x5(fs*tw*(i-1)+1:fs*tw*i));
v6trrms(i)=rms(x6(fs*tw*(i-1)+1:fs*tw*i));
v7trrms(i)=rms(x7(fs*tw*(i-1)+1:fs*tw*i));
v8trrms(i)=rms(x8(fs*tw*(i-1)+1:fs*tw*i));
vtr_rms(i,:)=[v1trrms(i) v2trrms(i) v3trrms(i) v4trrms(i) v5trrms(i) v6trrms(i) v7trrms(i) v8trrms(i)];
end
for j=1:size(vtr_rms,2)
    per_rms_err(:,j)=abs(vtr_rms(:,j)-rmsfin(:,j))*100;
end

for j=1:size(vtr_rms,2)
    mean_err(j)= mean(per_rms_err(:,j));
    max_err(j)= max(per_rms_err(:,j));
    sd_err(j)= std(per_rms_err(:,j));
end



