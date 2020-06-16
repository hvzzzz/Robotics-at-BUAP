function J=Jacobianor3gdl(beta2,beta3,l2,l3,q1,q2,q3)
J=[ cos(q1)*(beta2 + beta3) - sin(q1)*(l3*cos(q2 + q3) + l2*cos(q2)), -cos(q1)*(l3*sin(q2 + q3) + l2*sin(q2)), -l3*sin(q2 + q3)*cos(q1);
    sin(q1)*(beta2 + beta3) + cos(q1)*(l3*cos(q2 + q3) + l2*cos(q2)), -sin(q1)*(l3*sin(q2 + q3) + l2*sin(q2)), -l3*sin(q2 + q3)*sin(q1);
    0,            l3*cos(q2 + q3) + l2*cos(q2),          l3*cos(q2 + q3)];
end
