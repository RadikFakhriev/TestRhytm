function dydx = vdp1(x,y)
%     dydt = [y(2); (1-y(1)^2)*y(2)-y(1)];
    dydx = zeros(5, 1);
    dydx(1) = y(2);
    dydx(2) = y(3);
    dydx(3) = y(4);
    dydx(4) = y(5);
    dydx(5) = -15*y(5) - 90*y(4) - 270*y(3) - 405*y(2) - 243*y(1);
end