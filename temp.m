clear all; clear clc;
syms y5i y4i y3i y2i y1i h;

syms k1i_1 k1i_2 k1i_3 k1i_4;
disp('Получим выражение для K1i, которое можно использовать также для K2i, K3i, K4i');
K1i_1 = y2i;
k1i_2 = y2i + k1i_1*h/2;
k1i_3 = y2i + k1i_2*h/2;
k1i_4 = y2i + k1i_3*h;


K1i_2 = simplify(subs(k1i_2, k1i_1, K1i_1));
K1i_3 = simplify(subs(k1i_3, k1i_2, K1i_2));
K1i_4 = simplify(subs(k1i_4, k1i_3, K1i_3));

% disp(K1i_3);
% disp(K1i_4);

K1i = (K1i_1 + 2*K1i_2 + 2*K1i_3 + K1i_4)/6;
K1i = simplify(K1i);
disp(K1i);

disp('Получим выражение для K5i');
syms k5i_1 k5i_2 k5i_3 k5i_4;

K5i_1 = -15*y5i - 90*y4i - 270*y3i - 405*y2i - 243*y1i;
k5i_2 = -15*(y5i + (h*k5i_1)/2) - 90*(y4i + (h*k5i_1)/2) ...
- 270*(y3i + h*k5i_1/2) - 405*(y2i + h*k5i_1/2) - 243*(y1i + h*k5i_1/2); 

k5i_3 = -15*(y5i + h*k5i_2/2) - 90*(y4i + h*k5i_2/2) - 270*(y3i + h*k5i_2/2) ...
- 405*(y2i + h*k5i_2/2) - 243*(y1i + h*k5i_2/2);

k5i_4 = -15*(y5i + h*k5i_3/2) - 90*(y4i + h*k5i_3/2) - 270*(y3i + h*k5i_3/2) ...
- 405*(y2i + h*k5i_3/2) - 243*(y1i + h*k5i_3/2);

K5i_2 = subs(k5i_2, k5i_1, K5i_1);
% disp(K5i_2)
K5i_3 = subs(k5i_3, { k5i_2 k5i_1 }, { K5i_2 K5i_1 });
K5i_4 = subs(k5i_4, { k5i_3 k5i_2 k5i_1 }, { K5i_3 K5i_2 K5i_1} );
% disp(K5i_4)
% % 
K5i = (K5i_1 + 2*K5i_2 + 2*K5i_3 + K5i_4)/6;
K5i = simplify(K5i);
disp(K5i)