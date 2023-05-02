clear all; clear clc;

[x, y] = ode45(@vdp1,[0 5],[0; 3; -9; -8; 0]);
tl = tiledlayout(3,3);
nexttile
plot(x, y(:,1))
nexttile
plot(x, y(:,2))
nexttile
plot(x, y(:,3))
nexttile
plot(x, y(:,4))
nexttile
plot(x, y(:,5))

Fun=["y"; "Dy"; "D2y"; "D3y"; "D4y"];
Max_Fun = zeros(5,1);
Min_Fun = zeros(5,1);
for jj = 1:5
    Max_Fun(jj, 1) = max(y(:, jj));
    Min_Fun(jj, 1) = min(y(:, jj));
end
table(Fun, Max_Fun, Min_Fun)