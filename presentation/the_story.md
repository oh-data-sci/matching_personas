the story to tell
===
# introduction
my solution to your tech test challenge is simple, quick and incomplete due to time. it addresses the point

# a proposal
- look for robust sub populations (segments) within the set of sitters, using their profile data, application success rate, and reviews.
    + clustering is easy, labelling is hard
- similarly establish segmentation on homeowner listings and pet descriptions. 
- next, build a graph with two types of nodes, and fully connect them with weighted vertices:
    - nodes:
        - m sitter clusters  (faces)
        - n listing clusters (places)
    - vertices:
        - m*n sitter cluster --> listing cluster with the % of the sitter cluster that has housesat at a listing in the listing cluster.
- when it comes to suggest a listing to a sitter:
    + we first establish the right cluster for the sitter.
    + we then select a listing cluster based on the weights from the sitter's cluster. 
    + we then use compatibility filtering based on sitter's profile and listing features.
    + we randomise the remaining, compatible listings (new places on each refresh of the page).
    + this avoids the 'cold-start' problem: the difficulty of knowing what listings a sitter like when they are new and have no experience of listings.
- when it comes to suggesting a sitter for a listing, it works much the same way:
    + we first establish the right cluster for the listing.
    + we then select a sitter cluster based on the weights from the listing's cluster.
    + we then use compatibility filtering based on the listing features and the sitter's profile.
    + we randomise the remaining, compatible sitters (new faces on each refresh of the page). 
    + this avoids the 'cold-start' problem: the difficulty of knowing what listings a sitter like when they are new and have no experience of listings.

# execution

- exploration and data prep: minimize memory footprint
- feature engineering for efficiency and concreteness.
- mixed feature types: numeric, categorical, boolean, ---> kmedoid algorithm, as per [this study](https://www.nature.com/articles/s41598-021-83340-8)
- silhuette score optimising to decide the number of clusters, an improvement over the elbow method.
- sitters in 5 clusters: 
    + well seperable (from PCA dimension reduced plot)
    + majority of the work is determining what the clusters are, in terms of features
    + measures of feature importance: 
- listings in n clusters

## challenges:
- data is very lopsided, every feature has a strongly dominant value
    - not much information content
- inconsistency in data (application counts)
- out of 70,861 listings only 17,124 had associated user id.... and they are booleans/
- field order variable

- fields missing:
    + listings: suitable_for_home_working
- learned too late to apply:
    + listings have a quality measure
- off u-shaped curve on completed timestamp

# results:
- sitters fall into 5 - 6 seperable clusters
    + methods for identifying
- listings fall into n separable clusters
- 
- cluster 0 is split. some observations are tightly compact in the lower left and in a mixed cluster on the mid left, local 
- cluster 1 is itselft split into three subclusters but they all seem pure.
- cluster 2 is the only fully isolated and pure cluster
- cluster 3 and cluster 2 are mixed up with some of cluster 0



# in conclusion
i hope to have demonstrated:

- attention to detail 
- familiarity with data exploration methods and data handling
- ability to do clustering,
    + choosing an algorithm
    + preparing data
    + interpreting vague results
- have some knowledge of the persona's of interest to trusted housesitters.