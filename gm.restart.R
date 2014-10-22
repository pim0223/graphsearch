gm.restart <- function(nstart, prob, seed, obs, forward, backward, score){
  
  ## gm.restart runs gm.search for different (random) starting models
  
  # input:
  # nstart     : number of starts to be performed
  # prob       : edge probability
  # seed       : seed provided by user
  # remaining input arguments for gm.search
  
  # output:
  # list with components:
  #   $ model : a list containing the cliques of the final model
  #   $ score : the AIC or BIC score of the model
  #   $ trace : data frame providing trace of search process
  #   $ call  : the call to the function that produced the result
  
  
  # Initialise
  library(Matrix)
  bestResult <- c(0,0,0,0)
    
  # Run gm.search for different random graphs
  for(istart in 1:nstart){
    graph.init  <- random.graph(obs, prob, seed)
    result      <- gm.search(obs, graph.init, forward, backward, score)
    if(result[2] > bestResult[2]){
      bestResult <- result
    }
  }
}

random.graph = function(obs, prob, seed){
  numberEdges <- ncol(obs)
  set.seed(seed)
  graph <- forceSymmetric(matrix(runif(numberEdges^2),numberEdges,numberEdges) < prob)
  return(graph)
}