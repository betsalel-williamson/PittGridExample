# Function to install package on local machine
InstallPackage <- function(pkgname) {
   pkgstr <- .packages(all.available = TRUE, lib.loc = NULL)
   if( length(grep(tolower(pkgname),tolower(pkgstr), fixed = TRUE)) == 0 ) {
      options("repos"="http://cran.us.r-project.org");
      install.packages(pkgname, dependencies = TRUE);
   }
}

# example of including the package to run a loop in parallel
InstallPackage("doParallel")
require("doParallel")

cl <- makeCluster(detectCores(), type='PSOCK')
registerDoParallel(cl)

# example of reading in command line arguments
##First read in the arguments listed at the command line
args=(commandArgs(TRUE))

## First check to see if arguments are passed.
## Then cycle through each element of the list and evaluate the expressions.
if(length(args)==0){
    print("No arguments supplied.")
    ##supply default values
    clusterId = 0
    processId = 0
}else{
    for(i in 1:length(args)){
         eval(parse(text=args[[i]]))
    }
}
print(paste0("Processing job ",clusterId,".",processId," for with ", getDoParWorkers(), " workers."))

# example from the doParallel documentation
x <- iris[which(iris[,5] != "setosa"), c(1,5)]
trials <- 10000

system.time({
  r <- foreach(icount(trials), .combine=cbind) %dopar% {
  ind <- sample(100, 100, replace=TRUE)
  result1 <- glm(x[ind,2]~x[ind,1], family=binomial(logit))
  coefficients(result1)
    }
})[3]

system.time({
  r <- foreach(icount(trials), .combine=cbind) %do% {
  ind <- sample(100, 100, replace=TRUE)
  result1 <- glm(x[ind,2]~x[ind,1], family=binomial(logit))
  coefficients(result1)
    }
})[3]

# turn parallel processing off and run sequentially again
registerDoSEQ()