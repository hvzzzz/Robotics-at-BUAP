
function J=JacobianoSCARA(l2,l3,q1,q2)
J=[ -l3*sin(q1 + q2) - l2*sin(q1), -l3*sin(q1 + q2),  0;
     l3*cos(q1 + q2) + l2*cos(q1),  l3*cos(q1 + q2),  0;
                              0,                0, -1];
end

 