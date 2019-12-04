dataSet = load('data.txt');
X=dataSet(:,1:3);
Y=dataSet(:,4);


% données pour l'entrainement de notre modele (70% de l'ensemble des données)
X_Training = X(1:171540,:);
Y_Training = Y(1:171540,:);

% données pour le test de notre modele SVM (30 %de l'ensemble des données)
X_test = X(171541:end,:);
y_test = Y(171541:end,:);

% Partie d'entrainement de notre Système 
m = fitcsvm(X_Training, Y_Training, 'KernelFunction', 'rbf'); % Karnel gaussian
%m = fitcsvm(X_Training, Y_Training, 'KernelFunction', 'polynomial'); % Karnel polynomial
%m = fitcsvm(X_Training, Y_Training); % Le kernel est linear par defaut

% prediction
y_predi = predict(m,X_test);

%Nous allons tester le poucentage des reponses justes
p = mean(double(y_predi == y_test))*100;
