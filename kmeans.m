load("WineData.mat")
[cluster, center] = my_k_Means(3,X);
result1 = zeros(1,3);
result2 = zeros(1,3);
for i=1:3
    result1(i) = sum(cluster == i);
    result2(i) = sum(I == i);
end
disp(result1)
disp(result2)
%my_k_Means function clusters data into k clusters.
%Input: k: number of clusters, P: mxn matrix of data points
%Output: cluster: 1xn array with values corresponding to the cluster the
%point lies in,
% center: mxk matrix with values corresponding the centroids of k clusters
function [cluster, center] = my_k_Means(k, P)

dim = size(P,1); %num rows
numPoints = size(P,2); %num cols

%choose random k data points representing indices from the given matrix
randIdx = randperm(numPoints, k);
center = P(:, randIdx);
cluster = zeros(1, numPoints);
diffQ = 1;
iteration = 0;

while diffQ >= 0.05
    %assign each point to nearest cluster
    for idxX = 1:numPoints
        dis = zeros(1,k);
        for idxC = 1:k
            dis(idxC) = norm(P(:,idxX)-center(:,idxC));
        end
        [~, clusterP] = min(dis);
        cluster(idxX) = clusterP;
    end
    center = zeros(dim,k);
    disp(cluster)
    %recompute the center of each cluster
    for idxC = 1:k
        center(:,idxC) = mean(P(:, cluster==idxC),2);
    end
    %compute the overall tightness
    tightness = zeros(1,k);
    Q = 0;
    for idxC = 1:k
        tightness(idxC) = norm(P(:, cluster==idxC)- center(idxC));
        Q = Q+tightness(idxC);
    end
    if iteration ~= 0
        diffQ = abs(Q_old - Q)/Q_old;
    end
    Q_old = Q;
    iteration = iteration + 1;
end
end


        
    



