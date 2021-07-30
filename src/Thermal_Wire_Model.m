clear all;
close all;

load("170424-Data.mat"
%------------- 25mm^2 ------------------%
R_e_25 = 0.734/1000; %ohm/m - lapp 
D_25 = .0072; %m
eps = 0.091; %epsilon - teflon
% T_surr = 310; % k 
h = 5; %W/m^2
T_infi = 310; %k
% I_loop = 30; % current
sigma = 5.67*10^-8; %Boltzmann constant
rho = 8933; %kg/m^3
c = 385; %J/kg*k


T=T_surr(1,1);
i_25=1;
I_loop = 1;
T_Amb_Loop = 1;
for t=1:5281
I_loop = I(t);
T_Amb_Loop = T_surr(t);
T = (I_loop.^2.*R_e_25-pi.*D_25.*h.*(T-T_Amb_Loop)-pi.*D_25.*eps.*sigma.*(T.^4-T_Amb_Loop.^4))./(rho.*c.*pi.*(D_25.^2)./4)+T;
i_25(t)=T;
end


%---------------------------------------%
%------------- 20mm^2 ------------------%
R_e_20 = 0.96/1000; %ohm/m - lapp 
D_20 = .0069; %m

T=T_surr(1,1);
i_20=1;
I_loop = 1;
T_Amb_Loop = 1;
for t=1:5281
I_loop = I(t); 
T_Amb_Loop = T_surr(t);
T = (I_loop.^2.*R_e_20-pi.*D_20.*h.*(T-T_Amb_Loop)-pi.*D_20.*eps.*sigma.*(T.^4-T_Amb_Loop.^4))./(rho.*c.*pi.*(D_20.^2)./4)+T;
i_20(t)=T;
end


%---------------------------------------%
%------------- 16mm^2 ------------------%
R_e_16 = 1.16/1000; %ohm/m - lapp 
D_16 = .0058; %m



T=T_surr(1,1);
i_16=1;
I_loop = 1;
T_Amb_Loop = 1;
for t=1:5281
I_loop = I(t); 
T_Amb_Loop = T_surr(t);
T = (I_loop.^2.*R_e_16-pi.*D_16.*h.*(T-T_Amb_Loop)-pi.*D_16.*eps.*sigma.*(T.^4-T_Amb_Loop.^4))./(rho.*c.*pi.*(D_16.^2)./4)+T;
i_16(t)=T;
end


hold on
plot(i_25)
plot(i_20)
plot(i_16)
plot(Limit)
plot(T_surr)
plot(I)