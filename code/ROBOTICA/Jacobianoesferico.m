
function J=Jacobianoesferico(beta2,q1,q2,d3)
J= [-beta2*cos(q1) - d3*sin(q1)*sin(q2), d3*cos(q1)*cos(q2), cos(q1)*sin(q2);
      d3*cos(q1)*sin(q2) - beta2*sin(q1), d3*cos(q2)*sin(q1), sin(q1)*sin(q2);
      0,        -d3*sin(q2),         cos(q2)];
end
