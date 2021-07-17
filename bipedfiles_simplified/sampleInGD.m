function sample = sampleInGD(N)
%SAMPLEINGD Summary of this function goes here
%   Detailed explanation goes here
sample1 = sampleInD(N);
sample = g(sample1);
end

