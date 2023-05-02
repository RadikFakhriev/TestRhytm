clear all; clear clc;
x0 = 0;
xK = 5;

disp('Найдём решение характеристического уравнения');
syms lambda;
f1 = lambda.^5 + 15*lambda.^4 + 90*lambda.^3 + 270*lambda.^2 + 405*lambda + 243;
eq1 = solve(f1, lambda);
% disp(eq1)

if all(eq1 == eq1(1))
    disp('Характеристическое уравнение имеет кратные корни');
    disp('Соответственно, общее решение имеет вид:');
    syms C1 C2 C3 C4 C5 x;
    fcommon = commonSol(eq1);
    fb1 = subs(fcommon, x, 0);
    fb2 = subs(diff(fcommon, x), 0);
    fb3 = subs(diff(fcommon, x, 2), 0);
    fb4 = subs(diff(fcommon, x, 3), 0);
    fb5 = subs(diff(fcommon, x, 4), 0);
    
    T1 = solve(fb1, C1);
    eqT2 = subs(fb2 - 3, C1, T1);
    T2 = solve(eqT2, C2);
    eqT3 = subs(fb3 + 9, { C1 C2 }, { T1 T2 });
    T3 = solve(eqT3, C3);
    eqT4 = subs(fb4 + 8, { C1 C2 C3 }, { T1 T2 T3 });
    T4 = solve(eqT4, C4);
    eqT5 = subs(fb5, { C1 C2 C3 C4 }, { T1 T2 T3 T4 });
    T5 = solve(eqT5, C5);
    FC = subs(fcommon, { C1 C2 C3 C4 C5 }, { T1 T2 T3 T4 T5 });
    disp(FC);

    h = 0.00001; % шаг дискретизации
    xRange = x0:h:xK;
    yRes = zeros(5, length(xRange));
	disp('Изначальное уравнение 5-го порядка можно свести к системе ДУ:')
    for i = 1:(size(xRange, 2)-1)
        xi = xRange(i);
        if (i == 1)
            yRes(1,1) = 0;
            yRes(2,1) = 3;
            yRes(3,1) = -9;
            yRes(4,1) = -8;
            yRes(5,1) = 0;
        end
%         Данные выражения получены в отдельном файле temp.m
        yRes(1, i+1) = yRes(1, i) + h*(yRes(2, i)*(h^3 + 4*h^2 + 12*h + 24))/24;
        yRes(2, i+1) = yRes(2, i) + h*(yRes(3,i)*(h^3 + 4*h^2 + 12*h + 24))/24;
        yRes(3, i+1) = yRes(3, i) + h*(yRes(4,i)*(h^3 + 4*h^2 + 12*h + 24))/24;
        yRes(4, i+1) = yRes(4, i) + h*(yRes(5,i)*(h^3 + 4*h^2 + 12*h + 24))/24;
        yRes(5, i+1) = yRes(5, i) + h*(3*(356866389*h^3 - 2093058*h^2 + 6820*h - 16)*(81*yRes(1, i) + 135*yRes(2, i) + 90*yRes(3, i) + 30*yRes(4, i) + 5*yRes(5, i)))/16;
    end
    
    tl = tiledlayout(3,3);
    nexttile
    plot(xRange, yRes(1,:))
    nexttile
    plot(xRange, yRes(2,:))
    nexttile
    plot(xRange, yRes(3,:))
    nexttile
    plot(xRange, yRes(4,:))
    nexttile
    plot(xRange, yRes(5,:))
    
    disp([sprintf('В директории "Проверка" реализовано решение ДУ с помощью решателя ode45\n'), ...
        sprintf('Полученные результаты в программе, реализующей метод Рунге-Кутта 4-го порядка\n'), ...
        sprintf('и во встроенном решателе демонстрируют идентичный результат.\n'), ...
        sprintf('Такой вывод можно сделать визуально из характера поведения графиков, выдаваемых двумя программами,\n'), ...
        sprintf('а также из таблиц min/max для решений ДУ\n')]);
    
    Fun=["y"; "Dy"; "D2y"; "D3y"; "D4y"];
    Max_Fun = zeros(5,1);
    Min_Fun = zeros(5,1);
    for jj = 1:5
        Max_Fun(jj, 1) = max(yRes(jj,:));
        Min_Fun(jj, 1) = min(yRes(jj,:));
    end
    table(Fun, Max_Fun, Min_Fun)
else
    disp('Решение для такого ДУ не предусмотрено');
end


