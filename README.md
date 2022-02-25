# clustering-kmeans-kmedoids
k-means and k-medoids are methods to partition data into k clusters. 

k-means attempts to minimize the total squared error, while k-medoids attempts to minimize the total of dissimilarities between points in a cluster and the cluster’s center. k-means uses the mean of a
cluster as its center, while k-medoids use one of the data points to be a center.

The WineData.m is the data of wines derived from the same area of Italy but originating from three different cultivars. The attributes,
corresponding to the rows of the data matrix X are concentrations/levels of substances in the
wine. Based on these attributes, we will you the algorithm to cluster the wines into three
cultivars. And in the end, we will compare the result with the true annotation of cultivar of each
wine in given vector I included the data file.
