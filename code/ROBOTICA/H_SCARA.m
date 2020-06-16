function H=H_SCARA()
syms  q1 q2 q3 beta1 beta2 l1 l2 l3  d1 d2 d3 alpha1 alpha2 alpha3 real
disp('Transformaci�n Homog�nea H30 del robot SCARA')
disp('Par�metros Denavit-Hartenberg del robot SCARA')
disp('[l  alpha d   q]')
%tabla de par�metros DH del robot SCARA
dh=[0, 0,l1+beta1, q1; l2, pi, beta2, q2; l3, 0, d3, 0];
%despliega par�metros DH del robot SCARA
disp(dh)
%c�lculo de las matrices de transformaci�n homog�nea de cada articulaci�n
%H10=HR{z_0}{q_1}HT{z_0}{l_1+\beta_1}HT{x}{l_2}HR{x}{0}
 H10=HRz(q1)*HTz(l1+beta1)*HTx(l2)*HRx(0);
%H21=HR{z_1}{q_2}HT{z_1}{beta_2}HT{x_1}{l_3}HR{x_1}{pi}
 H21=HRz(q2)*HTz(beta2)*HTx(l3)*HRx(pi); 
%H32=HR{z_2}{0}HT{z_2}{d_3}HT{x_2}{0}HR{x_2}{0}
H32=HRz(0)*HTz(d3)*HTx(0)*HRx(0);
%transformaci�n homog�nea del robot SCARA
%H30=H10 H21 H32
H30=simplify(H10*H21*H32);
%deducci�n de la matriz de rotaci�n R30
%as� como la cinem�tica directa cartesiana f_R(q_1,q_2,d_3) del robot SCARA
[R30, cinemat_scara, cero, c]=H_DH(H30);
%estructura de la matriz homog�nea
 H=[R30, cinemat_scara;
     cero,  c];
end
