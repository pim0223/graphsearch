gm.search <- function(obs, graph.init, forward, backward, scoreType){
  
  ## gm.search learns an undirected graphical model from data
  
  # input:
  # obs        : table of observed counts
  # graph.init : initial graph from which the search process starts
  # forward    : boolean indicating whether adding edges is allowed
  # backward   : boolean indicating whether removing edges is allowed
  # scoreType  : "aic" if AIC-scoring is wanted, "bic" if BIC-scoring is wanted
  
  # output:
  # list with components:
  #   $ model : a list containing the cliques of the final model
  #   $ score : the AIC or BIC score of the model
  #   $ trace : data frame providing trace of search process
  #   $ call  : the call to the function that produced the result
  
  
  # find cliques
  cliques  <- find.cliques(c(), 1:ncol(obs), c(), graph.init, list())
  maxScore <- 0
  if(scoreType == "aic"){
    
  }
  else if(scoreType == "bic"){
    
  }
  else{
    print("ONZIN.")
  }
  
  
  # send cliques (margins) to loglin
  # use loglin to find model
  # use hill climbing to find local maximum
  
  
}