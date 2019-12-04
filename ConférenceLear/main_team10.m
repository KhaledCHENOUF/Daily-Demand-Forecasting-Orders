data=dlmread('Daily_Demand_Forecasting_Orders.csv');
X = data(:,5:7); % les demandes A, B et C
Y = data(:,13);  % le total des demandes
%Enregister la taille de output dans une varriable m
m=length(Y);
%Ajouter une colonne X0 itialisée a 1 dans le vecteur X(l'input) 
X = [ones(m, 1) X];
% initilaliser alpha et nombre d'itérations
alpha = 0.00001;
iteration = 1000;
% Initialiser le vecteur de theta
theta = zeros(4, 1);

% Appel de la fonction gradientDescent
[theta, Cost_history] = gradientDescent_team10(X, Y, theta, alpha, iteration);

%Ploter l'hypothèse H avec les données
figure(1);
plot(X(:,2)+X(:,3)+X(:,4), Y, 'r+', 'MarkerSize', 10); 
hold on;
H = hypothese_team10(X,theta);
plot ( X(:,2)+X(:,3)+X(:,4), H, '-');
legend('data','Hypothèse','location','northwest');
% L'axe des Y
ylabel('Total'); 
% L'axe des X
xlabel('Demandes(A+B+C)');
hold off;

%Ploter le cout
figure(2);
plot(1:100, Cost_history(1:100,1), '-b', 'LineWidth', 2);
legend('Cout J');
% L'axe des X
xlabel('Itérations');
% L'axe des Y
ylabel('Cost J');

%Test
orders=[1 80 80 80];
total = orders * theta ;
fprintf('La prevision des demandes A, B, et C est :%f\n', total);



