function results = sineScan(t, data, startFreq, endFreq, freqStep)

	numFreqs = ceil( (endFreq-startFreq)/freqStep);

	%allocate memory for speed
	results = zeros(numFreqs,4);
	%initialize counter
	ctr = 1;

	for f = startFreq:freqStep:endFreq

		%Do the fit
		beta = sineFitter(t,data, f);

		%Store the results
		results(ctr,:) = [f transpose(beta)];
		ctr++;
	end

end

