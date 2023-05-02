    function y = commonSol(eq1)
       syms C1 C2 C3 C4 C5 x;
       y = C1.*exp(eq1(1)*x) + C2.*x.*exp(eq1(2)*x) + C3.*x.^2.*exp(eq1(3)*x) + C4.*x.^3.*exp(eq1(4)*x) + C5.*x.^4.*exp(eq1(5)*x); 
    end