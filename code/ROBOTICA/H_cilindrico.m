function H=H_cilindrico()
syms  q1 d2 d3 beta1 l1 alpha1 alpha2 alpha3 real
disp('Parámetros Denavit-Hartenberg del robot cilíndrico'); 
disp('[ l  alpha d   q]'); 
dh=[0, 0, l1+beta1, q1; 0, -pi/2, d2, 0; 0, 0, d3, 0]; 
disp(dh)
%H10=HDH{0}{q_1}{l_1+\beta_1}{0}{0}
H10=HRz(q1)*HTz(l1+beta1)*HTx(0)*HRx(0);
%H21=HDH{1}{0}{d_2}{0}{pi/2}
H21=HRz(0)*HTz(d2)*HTx(0)*HRx(-pi/2);
%H32=HDH{2}{0}{d_3}{0}{0}
H32=HRz(0)*HTz(d3)*HTx(0)*HRx(0);
H30=simplify(H10*H21*H32); %H30=H10H21H32
[R30, cinemat_cilindrico, cero, c]=H_DH(H30);
 H=[R30, cinemat_cilindrico;
 cero,  c];
end




