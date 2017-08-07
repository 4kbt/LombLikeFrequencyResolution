more off

t = 10000*rand(10000,1);

f0 = 20e-3;

s = cos(2*pi*f0*t);

s = s.*sin(t*pi/10000);

results = zeros(1e6+1,4);
ctr = 1;

for f = 0:1e-6:1

	if( mod(100 * f ,2) == 1)
		f
	end

	beta = sineFitter(t,s, f);

	results(ctr,:) = [f transpose(beta)];
	ctr++;
end
