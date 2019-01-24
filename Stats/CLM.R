## Demonstrating Central Limit Theorem
# Clear off stuff
options(warn=-1)
rm(list=ls())
graphics.off()
## Population size
population_size =as.numeric(10000)

# Distribution that you want
#p <- runif(population_size,min=-1,max = 1) # Uniform distribution
p <- rexp(population_size,rate=1)
# number of samples nsamp and no of times ntimes
#figure(1)

## Sample size range
nsamp = c(10,100,1000) # sample size
# How many times the give sample size is taken
ntimes = as.numeric(100) # How many times it is taken



# Setting the plot dimenstions
par(mfrow = c(length(nsamp)+1,1))

# Plotting Population distribution
hist(p,col ="black",main = "Population Distribution",prob=T)
# Looping through sample size range

for (samp in nsamp) {

  sample_space = replicate(ntimes,sample(p,samp,replace = TRUE))
  
  sample_means = colMeans(sample_space)

  hist(sample_means,prob=T,main = paste("Distribution of Sample Means","\t","Sample Size = ", samp),col="red",xlim = c(min(p), max(p)))
}

cat("\nYou should see gaussian (normal) distributions for sample means(Due to Central Limit theorem)\n")
cat("The spread in the gaussian reduces with sample size as expected\n")
cat("Try changing 2 things\n1.Type of population distribution (Currently Uniform)\n2.the number of times the sample size is taken(Currently 100)")

## End of Program

#hist(u)