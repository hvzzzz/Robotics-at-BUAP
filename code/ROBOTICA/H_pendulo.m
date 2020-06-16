function H=H_pendulo()
syms l1  q1 beta1 real
disp('Parámetros Denavit-Hartenberg del péndulo')
disp('[ l  alpha d   q]'); dh=[l1, 0, beta1, q1]; 
disp(dh)
%H10=HDH{0}{q_1}{beta_1}{l_1}{0}
H10=HRz(q1)*HTz(beta1)*HTx(l1)*HRx(0);
[R10, cinemat_pendulo, cero, c]=H_DH(H10);
 H=[R10, cinemat_pendulo; 
    cero,  c];
end

 
