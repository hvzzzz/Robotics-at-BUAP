function J=Jacobianocilindrico(q1,d3)
J=[ -d3*cos(q1), 0, -sin(q1);
   -d3*sin(q1), 0,      cos(q1);
               0, 1,            0];
end
