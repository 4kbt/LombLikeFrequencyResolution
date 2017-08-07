more off

%Make some time
t = 10000.0*rand(100000,1);

%Frequency of signal injection
f0 = 20e-3;

%make a sinusoidal signal.
s = cos(2*pi*f0*t);


%Fitting:
freqStart = 19.6e-3;
freqEnd = 20.4e-3;
freqStep = 1e-6;
tic
100
r100   = sineScan(t(1:100)  ,s(1:100)  , freqStart, freqEnd, freqStep); toc;
1000
r1000  = sineScan(t(1:1000) ,s(1:1000) , freqStart, freqEnd, freqStep); toc;
10000
r10000 = sineScan(t(1:10000),s(1:10000), freqStart, freqEnd, freqStep); toc;
100000
r100000 = sineScan(t        ,s         , freqStart, freqEnd, freqStep); toc;


%Windowing function
'Windowed'
sWin = s.*sin(t*pi/10000);
rWindowed = sineScan(t, sWin, freqStart, freqEnd, freqStep); toc;

%Plot
semilogy( 
	r100(:,1)   ,sqrt(r100(:,2).^2    + r100(:,3).^2   ),';100 samples;'   , 'LineWidth', 3,
	r1000(:,1)  ,sqrt(r1000(:,2).^2   + r1000(:,3).^2  ),';1000 samples;'  , 'LineWidth', 3,
	r10000(:,1) ,sqrt(r10000(:,2).^2  + r10000(:,3).^2 ),';10000 samples;' , 'LineWidth', 3,
	r100000(:,1),sqrt(r100000(:,2).^2 + r100000(:,3).^2),';100000 samples;', 'LineWidth', 3);

title('Can you get better frequency resolution than 1/T?');
xlabel('frequency (Hz)');
ylabel('recovered amplitude (signal has amplitude 1)');
axis([19.6e-3 20.4e-3 1e-3 1]);

pause

%Windowing Demonstration Plot
semilogy(
	r100000(:,1),sqrt(r100000(:,2).^2 + r100000(:,3).^2),';100000 samples;', 'LineWidth', 3,
	rWindowed(:,1), sqrt(rWindowed(:,2).^2   + rWindowed(:,3).^2  ),';100000 samples, windowed;', 'LineWidth', 3  );
title('Windowing attenuates sidebands');                     
xlabel('frequency (Hz)');                                                       
ylabel('recovered amplitude (signal has amplitude 1)');                         
axis([19.6e-3 20.4e-3 1e-3 1]); 

pause

plot(t(1:1000), s(1:1000),'+;Thousand Samples;', t,s,'.;Million samples;')
title('randomly sampled cosine at 20 mHz, excerpt from 10,000 s')
xlabel('time (s)');
ylabel('signal, arbitrary units')
axis([0 500]);
 
