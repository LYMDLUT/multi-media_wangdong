function wt = blackman_nuttall_function(N,t)
%%blackman nuttall º¯Êý£º·¶Î§ -(N-1)/2~(N-1)/2
a0 = 0.3635819;
a1 = 0.4891775;
a2 = 0.1365995;
a3 = 0.0106411;
wt = a0 -...
  	   	a1*cos(2*pi*(t+(N-1)/2)/(N-1)) +...
     	a2*cos(4*pi*(t+(N-1)/2)/(N-1)) -...
     	a3*cos(6*pi*(t+(N-1)/2)/(N-1));
