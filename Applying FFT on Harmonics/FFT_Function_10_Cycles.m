function rmsv=fftfun(sig2)
xfft=abs(fft(sig2));
rms1=((xfft(11))/length(xfft))*sqrt(2);
rms2=((xfft(31))/length(xfft))*sqrt(2);
rms3=((xfft(51))/length(xfft))*sqrt(2);
rms4=((xfft(71))/length(xfft))*sqrt(2);
rms5=((xfft(91))/length(xfft))*sqrt(2);
rms6=((xfft(111))/length(xfft))*sqrt(2);
rms7=((xfft(131))/length(xfft))*sqrt(2);
rms8=((xfft(151))/length(xfft))*sqrt(2);
rmsv=[rms1 rms2 rms3 rms4 rms5 rms6 rms7 rms8];
end