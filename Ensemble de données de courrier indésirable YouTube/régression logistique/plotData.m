
% PLOTDATA Trace les points de données X et y dans une nouvelle figure
% PLOTDATA (x, y) trace les points de données avec + pour les exemples positifs
% et o pour les exemples négatifs. 
                  %********** la fonction *************%

function plotData(X,Y)
% Creation d'une nouvelle figure 
figure; hold on;
% trouver les indices positif et négatif de l'exemple
p = find(Y==1);
n = find(Y==0);
% Ploter l'exemple

plot(X(p, [1]),X(p, [2,3]) ,'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(n, [1]),X(n, [2,3]) ,'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
hold off;

end
