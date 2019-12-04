
%% ================ Partie 1: Chargement des donn�es ================

Input=dlmread('Daily_Demand_Forecasting_Orders.csv');
X = Input(:,5:7)'; % les demandes A, B et C
Y = Input(:,13)';  % le total des demandes(target=A+B+C)
 

%% ================ Partie 2: Creation de r�seau================

% creation de reseaux de neurone avec une couche cach� qui contient un noeud la fonction d'activation : pureline 
net=newff(X,Y,1,{'purelin'}); 
% 70% donn�es de train 
net.divideParam.trainRatio=0.7; 
% 15% donn�es d'entrainement
net.divideParam.testRatio=0.15; 
% 15 % don� de validation
net.divideParam.valRatio=0.15;
% learning rate 10%
net.trainParam.lr=0.1;          
% nombre d'iteration
net.trainParam.epochs=300;     
net=train(net,X,Y);

%% ================ Partie 3: Tester les valeur ================
% pour tester                                                              
net([100 100 100]') 
% les r�sultats
x=X';
y=Y';
a=[1:600]';
b=[1:600]';
c=[1:600]';
d=a(:,1)+b(:,1)+c(:,1);
%donn�es r�elles 
plot(a(:,1)+b(:,1)+c(:,1),d(:,1),'o');
hold on ;
e=[[1:600] ; [1:600] ; [1:600]]; 
%sortie de reseau
plot(e(1,:)+e(2,:)+e(3,:),net(e),'x') 
legend('Donn�es r�elles','Donn�es de test','location','northwest');
view(net)
