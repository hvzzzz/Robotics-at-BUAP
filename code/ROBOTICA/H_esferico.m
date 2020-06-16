function  H=H_esferico()
syms  q1 q2 q3 beta1 beta2 l1 l2 l3  d1 d2 d3 alpha1 alpha2 alpha3 real
disp('Parámetros Denavit-Hartenberg del robot Esférico'); disp('[ l  alpha d   q]')
dh=[0, -pi/2, l1+beta1, q1; 0, pi/2, beta2, q2; 0, 0, d3, 0]; disp(dh)
%H10=HDH{0}{q_1}{l_1+\beta_1}{0}{pi/{2} 
H10=HRz(q1)*HTz(l1+beta1)*HTx(0)*HRx(-pi/2);
%H21=\HDH{1}{q_2}{\beta_2}{0}{pi/2}
 H21=HRz(q2)*HTz(beta2)*HTx(0)*HRx(pi/2);

H32=HRz(0)*HTz(d3)*HTx(0)*HRx(0); %H32=HDH{2}{0}{d_3}{0}{0} 
H30=simplify(H10*H21*H32); %H30=H10 H21 H32
[R30, cinemat_esferico, cero, c]=H_DH(H30);
 H=[R30, cinemat_esferico; cero,  c];
 end
 