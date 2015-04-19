***************GRAPH PLOTS*********
************************************

library(igraph)

# Function to plot graphs in R
graph.data.frame(d, directed=TRUE, vertices=NULL)
get.data.frame(x, what=c("edges", "vertices", "both"))
-------------------------------------USAGE---------------------------------------------------------------------
&d-A data frame containing a symbolic edge list in the first two columns. Additional columns are considered as edge attributes. Since version 0.7 this argument is coerced to a data frame with as.data.frame.
&directed	-Logical scalar, whether or not to create a directed graph.
&vertices	-A data frame with vertex metadata, or NULL. See details below. Since version 0.7 this argument is coerced to a data frame with as.data.frame, if not NULL.
&x	-An igraph object.
&what	-Character constant, whether to return info about vertices, edges, or both. The default is ‘edges’.
---------------------------------------------------------------------------------------------------------------
#Plotting the edges and vertices from Facebook data and CREATING A NETWORK
g = graph.data.frame(edges, FALSE, users)
plot(g,vertex.size=5,vertex.label=NA)

#To check the users with 10 or more friends
table(degree(g)) or table(degree(g) >= 10)

#To visually draw attention to these nodes, we will change the size of the vertices so the vertices with high degrees are larger. 
To do this, we will change the "size" attribute of the vertices of our graph to be an increasing function of their degrees:
V(g)$size = degree(g)/2+2

#Now that we have specified the vertex size of each vertex, we will no longer use the vertex.size parameter when we plot our graph:
plot(g, vertex.label=NA)

#Coloring the Vertices
V(g)$color = "black"
V(g)$color[V(g)$gender == "A"] = "red"
V(g)$color[V(g)$gender == "B"] = "gray"
