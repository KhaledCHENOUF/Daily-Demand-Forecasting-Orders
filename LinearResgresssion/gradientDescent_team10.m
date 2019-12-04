function [theta, Cost_history] = gradientDescent_team10(X, Y, theta, alpha, iteration)
m = length(Y); 
Cost_history = zeros(iteration, 1);
for iter = 1:iteration
    H = hypothese_team10(X,theta);
    t1 = theta(1) - alpha * (1/m) * sum (H-Y);
    t2 = theta(2) - (alpha * (1 / m) * sum((H - Y) .* X(:, 2)));
    t3 = theta(3) - (alpha * (1 / m) * sum((H - Y) .* X(:, 3)));
    t4 = theta(4) - (alpha * (1 / m) * sum((H - Y) .* X(:, 4)));
      theta(1) = t1;
      theta(2) = t2;
      theta(3) = t3;
      theta(4) = t4;
     Cost_history(iter) = costfunction_team10(X,Y, theta);
end
end
