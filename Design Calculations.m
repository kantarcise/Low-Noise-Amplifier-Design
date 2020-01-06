% All the values are selected for a specific design. Adjust accordingly, if you are going to use the script as a foundation.
% All credit goes to: Mert Karakurt.

% 2.4 GHz,1 dB Noise Figure & Maximum Gain LNA
s = [0.776*exp(1i*-87.8*pi/180), 0.067*exp(1i*32.4*pi/180);
4.825*exp(1i*89.8*pi/180), 0.446*exp(1i*-68.4*pi/180)];


% S Parameters
delta = abs(s(1,1)*s(2,2) - s(1,2)*s(2,1));
K = (1-(abs(s(1,1)))^2 - (abs(s(2,2)))^2 + (abs(delta)^2)) / (2*(abs(s(1,2)))^2*(abs(s(2,1)))^2);


% Stability Conditions
U = abs(s(1,1)*s(1,2)*s(2,1)*s(2,2))/((1-(abs(s(1,1))^2))*(1-(abs(s(2,2))^2)));
below_limited = 1/((1+U)^2);
above_limited = 1/((1-U)^2);


% Gain Error
r_opt = 0.5*exp(1i*54.1*pi/180);
Rn = 8;
Z0 = 50;
Fmin_db = 0.3;
Fmin = 10^(Fmin_db/10);
F_db = 0.6;
F = 10^(F_db/10);
N = ((F-Fmin)/(4*Rn/Z0))*abs(1+r_opt)^2;
Cf = r_opt/(N+1);
Rf = sqrt(N*(N+1-(abs(r_opt)^2)))/(N+1);


% Noise Parameters
Gl_max=1/(1-abs(s(2,2)^2)); Gl_dB=10*log10(Gl_max);
Gs_max = 1/(1-(abs(s(1,1))^2));
Gs_db = 0.9:0.2:1;


% Gain Equations
for m=1:length(Gs_db)
%Gs_db = 0.9 dB
Gs = 10^(Gs_db(m)/10);
gs = Gs/Gs_max;
Cs = (gs*conj(s(1,1)))/(1-((1-gs)*(abs(s(1,1))^2)));
Rs = (sqrt(1-gs)*(1-(abs(s(1,1))^2)))/(1-((1-gs)*(abs(s(1,1))^2)));
smith
smith_circles(Cf, Rf, 'b')
smith_circles(Cs, Rs, 'r')
end
