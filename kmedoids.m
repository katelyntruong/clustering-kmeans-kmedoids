load("WineData.mat")
[m n] = size(X);
Dist = zeros(n, n); %distance matrix
%updating the distance matrix
for i = 1 : n 
  for j = 1 : n
      Dist(i, j) = norm(X(:,i) - X(:,j));
  end     
end
[I_assign,I_bar] = my_k_medoids(3, Dist, 0.05);
result1 = zeros(1,3);
result2 = zeros(1,3);
for i=1:3
    result1(i) = sum(I_assign == i);
    result2(i) = sum(I == i);
end
disp(result1)
disp(result2)

%my_k_Medoids function clusters data into k clusters.
%Input: k: number of clusters, 
%       D: distance matrix of size pxp
%       tau: tolerance
%Output: I_assign: 1xn vector with values corresponding to the cluster the
%point lies in,
%       I_bar: index vector of length k, indicating the medoids

function [I_assign,I_bar] = my_k_medoids(k,D,tau)

%dim = size(P,1); %num rows
numPoints = size(D,2); %num cols

%choose random k data points representing indices from the given matrix
I_bar = randperm(numPoints, k);
D_bar = D(:, I_bar); %combine the 2 columns
[~, I_assign] = min(D_bar,[], 2); %get indices of min value in each row
diffQ = Inf;
iteration = 0;

while diffQ > tau && iteration < 20
    Q = 0;
    %update medoids and cluster
    for ell = 1:k
        I_ell = find(I_assign == ell); %indices of data of each cluster
        D_ell = D(I_ell, I_ell); %matrix of cluster
        [q, i] = min(sum(D_ell)); %index of the center with min tightness
        I_bar(ell) = i; %update the index of medoid
        Q = Q + q; %compute the overall tightness
    end
    
    if iteration ~= 0
        diffQ = abs(Q_old - Q)/Q_old;
    end
    Q_old = Q;
    iteration = iteration + 1;
end
end