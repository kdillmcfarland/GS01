pairwise.permdisp <- function(x, y, factors, sim.method, name)
{require(vegan)
 require(tidyverse)
 # Vectors to hold results
 p.value = c()
 
  for(factor in 1:length(factors)){
      #Subset data to unlabeled OTU table and arrange
      x.subset = x %>% 
        arrange(Sample) %>% 
        select(starts_with('Otu'))
      y.subset = y %>% 
        arrange(Sample) %>% 
        select(factors[factor])
      
      #Calculate beta distances
      dist.mat = vegdist(x.subset, method=sim.method) 
      
      if(factors[factor] == "Random"){
      #Run PERMDSIP only on subset data
      perm = permutest(betadisper(dist.mat, get(factors[factor], y.subset)), permutations=1000)
      #Pull out p-values into list
      p.value = c(perm$tab$`Pr(>F)`[1])
      #Print results to a table
      results = data.frame(
        pval = p.value,
        label = factors[factor])
      
      write.table(results, file=paste(name,'permdisp.txt',sep="_"), append=TRUE, sep="\t", col.names = FALSE,  row.names=FALSE)  
    }
    
    else{
      #Run PERMDSIP and Tukey on subset data
      perm = permutest(betadisper(dist.mat, get(factors[factor], y.subset)), permutations=1000)
      tukey = TukeyHSD(betadisper(dist.mat, get(factors[factor], y.subset)))
      #Pull out R-squared and p-values into list
      p.value = c(perm$tab$`Pr(>F)`[1], tukey$group[,4])
      #Print results to a table
      results = data.frame(
              pval = p.value,
              label = c(factors[factor], labels(tukey$group[,4])))
    
    write.table(results, file=paste(name,'permdisp.txt',sep="_"), append=TRUE, sep="\t", col.names = FALSE,  row.names=FALSE)
    }}

  #After 1 variable in factors, read in results table. This will be added to the the append=TRUE option with the next factor's loop
  y=read.table(paste(name,'permdisp.txt',sep="_"), header=FALSE, sep="\t", fill = TRUE)
  #Remove the file
  file.remove(paste(name,'permdisp.txt',sep = "_"))
  #Relabel columns
  colnames(y) = c("pval", "label")
  #Write final results file
  write.table(y, file=paste(name,'permdisp.txt', sep="_"), row.names=FALSE, sep="\t")
}

#How to use
#pairwise.permdisp(OTU, meta, c("variable1", "variable2"), "bray", "filename")