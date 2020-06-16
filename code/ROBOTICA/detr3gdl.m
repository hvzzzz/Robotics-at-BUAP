
function  det= detr3gdl(beta2,l2,beta3,l3,q1,q2,q3) 
det=-cos(q2)*sin(q3)*l2^2*l3 -sin(q2)*l2*l3^2*cos(q3)^2 -cos(q2)*sin(q3)*l2*l3^2*cos(q3) + sin(q2)*l2*l3^2;
end
