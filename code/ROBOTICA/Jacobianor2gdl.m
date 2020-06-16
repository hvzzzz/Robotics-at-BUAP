function J=Jacobiano_r2gdl(l1,l2,q1,q2)

J =[ - l2*sin(q1 + q2) - l1*sin(q1), -l2*sin(q1 + q2);
       l2*cos(q1 + q2) + l1*cos(q1),  l2*cos(q1 + q2)];
end

 