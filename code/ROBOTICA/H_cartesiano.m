function H=H_cartesiano()
syms  l1 l2 l3  d1 d2 d3 alpha1 alpha2 alpha3 real
disp('Parámetros Denavit-Hartenberg del robot cartesiano')
disp('[ l  alpha   d   q]')
dh=[0, -pi/2, d1, 0; 0, -pi/2, d2, 0; 0, 0, d3, 0];
%despliega tabla de parámetros DH
disp(dh)
%cálculo de las matrices de transformación homogénea de cada articulación
%H10=HR{z_0}{0}HT{z_0}{d1}HT{x_0}{0}HR{x_0}{-pi/2}
 H10=HRz(0)*HTz(d1)*HTx(0)*HRx(-pi/2);
%H21=HR{z_1}{0}HT{z_1}{d_2}HT{x_1}{0}HT{x_1}{-pi/2}
 H21=HRz(0)*HTz(d2)*HTx(0)*HRx(-pi/2); 
%H21_a=HR{z_1}{pi/2}^T H21
H21a=simplify((HRz(pi/2))'*H21);
%H32=HR{z_2}{0}HT{z_2}{d_3}HT{x_2}{0}HT{x_2}{0}
 H32=HRz(0)*HTz(d3)*HTx(0)*HRx(0);
%H30=H10 H21_a H32
 H30=simplify(H10*H21a*H32);
%matriz de rotación R30 y cinemática directa f_R(d_1,d_2,d_3)
[R30, cinemat_cartesiano, cero, c]=H_DH(H30);
%Forma la matriz de transformación homogénea del robot cartesiano
%H=[R30,  f_R(d_1,d_2,d_3); cero' , 1]
  H=[R30, cinemat_cartesiano;
    cero,  c];
end

