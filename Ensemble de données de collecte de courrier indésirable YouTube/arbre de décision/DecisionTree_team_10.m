%chargement des données 
skindata = load('data.txt');
%separation des attribut(cible / non cible)
X=skindata(:,[1,2,3]);
Y=skindata(:,4);
% Au lieu de 1 et 2 comme classes, nous définissons les classes comme 0 et 1 0-> skin
% 1-> non
 Y(Y==1) = 0;
  Y(Y==2) = 1;
  %construction de l'arbre
skin_arbre= fitctree(X,Y);
%affichage  
view(skin_arbre,'mode','graph');
%test
load('test.txt');
p=predict(skin_arbre,test);

