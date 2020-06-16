function H=H_r3gdl()
syms  q1 q2 q3 beta1 beta2 beta3 l1 l2 l3  alpha1 alpha2 alpha3 real
disp('Parámetros Denavit-Hartenberg del robot planar vertical de 3 gdl')
disp('[ l  alpha d   q]')
dh=[l1, pi/2, l1+beta1, q1; l2, 0, beta2, q2; l3, 0, beta3, q3]; disp(dh)
%H10=HDH{0}{q_1}{l_1+beta_1}{0}{pi/2}
H10=simplify(HRz(q1)*HTz(l1+beta1)*HTx(0)*HRx(pi/2));
%H21=HDH{1}{q_2}{beta_2}{l_2}{0}
H21=simplify(HRz(q2)*HTz(beta2)*HTx(l2)*HRx(0));
%H32=HDH{2}{q_3}{beta_3}{l_3}{0}
H32=simplify(HRz(q3)*HTz(beta3)*HTx(l3)*HRx(0));
%H30=simplify(H10*H21*H32,3); %H30=H10 H21 H32
H30=simplify(vpa(H10*H21*H32,3)); %H30=H10 H21 H32
[R30, cinemat_r3gdl, cero, c]=H_DH(H30); %R30, f_R(q_1,q_2,q_3)
 H=[R30, cinemat_r3gdl;
      cero,  c];
end


