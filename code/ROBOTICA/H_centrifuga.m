function H=H_centrifuga()
syms l1 l2 q1 beta1 phi real
disp('Parámetros Denavit-Hartenberg de la centrífuga')
disp('[ l  alpha d   q]'); dh=[l2*cos(phi), 0, l1+l2*sin(phi)+beta1, q1]; 
disp(dh)
%H10=HDH{0}{q_1}{beta_1}{l_1}{0}
H10=HRz(q1)*HTz(l1+l2*sin(phi)+beta1)*HTx(l2*cos(phi))*HRx(0);
[R10, cinemat_pendulo, cero, c]=H_DH(H10);
 H=[R10, cinemat_pendulo; 
    cero,  c];
end

 
