multiDimComp <- function(A, B){
#Comparison of multidimensional samples
source('permTestBoot.R')
source('mmdStatsMulti.R')
source('permTestBR.R')
source('statsBR.R')

#################################################################################################################
#Description: 
#Compares two samples, A and B, "R" permutation tests are run and a p-value is computed along with the decision 
#accept or reject
#################################################################################################################


#################################################################################################################
#                               !!!   Parameter set up for tests    !!!
samples<-50
  
  R<-999
  
  #cut off for p value
  alpha<-.05
  #################################################################################################################
  

  #p-value each iteration for various statistics when mean was varied

  
  


      
#       #Get data for simple stat
#       data<-permTestBR(A,B,R,stat=simpleStat)
#       mu_p_data_simp <- (data>=data[1])
      
      #Get data for near neighbor stat
      data<-permTestBR(A,B,R,stat=nNeighbor,k=3)
      p_data_nn <- mean(data>=data[1])
      
      #Get data for edist stat
      data<-permTestBR(A,B,R,stat=edist)
      p_data_edist <- mean(data>=data[1])
      
      #Get data for MMD Radial stat
      #data<-permTestBR(A,B,R,stat=kernelStat)
      #mu_p_data_mmd[j]<-mean(data>=data[1])
      
#       #Hotel stat
#       data<-permTestBR(A,B,R,stat=hotel,k=3)
#       p_data_hotel <- mean(data>=data[1])
      
      #Unbiased MMD
      p_data_uMMD <- uMMDDecision(A,B,R)
      
      #linear MMD
      data<-permTestBR(A,B,R,stat=lMMD)
      p_data_lMMD <- mean(data>=data[1])
#       results <- mu_p_data_nn
      
      results <- c(p_data_nn, p_data_edist, p_data_uMMD, p_data_lMMD)
      results <- as.numeric(results <= alpha)
      print(results)

  
#   #example of what ouput will look like
#   df<-data.frame(steps_mu,percent_mu_ks,percent_mu_simp,percent_mu_nn, percent_mu_mmd)
#   ggplot(data=df,aes(steps_mu,y=value,color=variable)) + 
#     geom_line(aes(y = percent_mu_ks, col = "percent_mu_ks")) + 
#     geom_line(aes(y = percent_mu_simp, col = "percent_mu_simp")) +
#     geom_line(aes(y = percent_mu_nn, col = "percent_mu_nn")) +
#     geom_line(aes( y = percent_mu_edist,col = "percent_mu_edist")) +
#     #geom_line(aes( y = percent_mu_mmd,col = "percent_mu_mmd")) +
#     ggtitle("50 variables")

}


