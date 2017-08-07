function  [beta, sigma, r]= sineFitter(t, data, f)

if(nargin!=3)
	usage("sineFitter(t,data,f)");
end

[beta,sigma, r] = ols(data, genSineSeed(t,f));
