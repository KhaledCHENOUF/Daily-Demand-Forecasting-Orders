function J = costfunction_team10(X, Y, theta)
m = length(Y);
J = 0;
J = (sum(power((X*theta - Y),2)))/(2*m);
end






