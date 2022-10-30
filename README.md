# Ghat <img src="https://github.com/Medhat86/Ghat/blob/master/1649142570895.jpg" align="right" alt="" width="120" />


Functions are provided for quantifying evolution and selection on complex traits.
The package implements effective handling and analysis algorithms scaled for
genome-wide data and calculates a composite statistic, denoted Ghat, which is used
to test for selection on a trait. The package provides a number of simple examples
for handling and analysing the genome data and visualising the output and results.
Beissinger et al., (2018) <doi:10.1534/genetics.118.300857>

## Installation

### Latest development build

To install the latest development snapshot (see latest changes below), type the following commands into the R console:

```r
library(devtools)
devtools::install_github("Medhat86/Ghat")
```

### Official, stable release

To install the latest stable release from CRAN, type the following command into the R console:

```r
install.packages("Ghat")
```

## Documentation and examples

#Example-2 Both SNP effects and change in allele frequency are known
Quantifying evolution and selection on complex traits
Description
G-hat: R function to estimate G-hat from allele frequency and effect size data.

Usage
Ghat(effects = effects, change = change, method = "scale",
  perms = 1000, plot = "Both", blockSize = 1000, num_eff = NULL)
Arguments
effects	
Vector of allele effects.

change	
Vector of changes in allele frequency (could be positive, negative or zero).

method	
"vanilla" (assumes complete linkage equilibrium between markers), "trim" (excludes markers to approximate linkage equilibrium some of the extreme values) or "scale" (scales results to reflect underlying levels of linkage LD)

perms	
Number of permutations to run.

plot	
"Ghat", "Cor", or "Both", Should a plot of the Ghat or correlation test be returned?

blockSize	
How large should blocks for trimming be? Only required if method = "trim".

num_eff	
The effective number of independent markers, to be used only in conjunction with the “scale” method, above (see “ld_decay” function or use help (?ld_decay).

Value
Ghat Ghat-value

Cor Correlation between alleles frequencies and their effects

p.val two-sided P-value of Evidence of selection

plot relationship between estimated allelic effects at individual SNPs and the change in allele frequency over generations

Examples
Run examples

#Example-1 Both SNP effects and change in allele frequency are known
maize		<- Maize_wqs[[1]]
result.adf	<- Ghat(effects =maize[,1], change=maize[,2], method="scale",
                     perms=1000, plot="Ghat", num_eff=54.74819)
mtext(paste("WQS ADF test for selection, pval = ", round(result.adf$p.val,4)))
message (c(result.adf$Ghat , result.adf$Cor , result.adf$p.va))



#Example-2 Both SNP effects and change in allele frequency are known
##################################################################
## step 1: #run rrBLUP and estimating allels effects            ##
##################################################################

library(Ghat)
library(parallel)
library(rrBLUP)
phe                 <- Maize_wqs[[2]]
map                 <- Maize_wqs[[3]]
gen                 <- Maize_wqs[[4]]
phe                 <-phe[which(is.na(phe[,2])==FALSE),]
gen                 <-gen[which(is.na(phe[,2])==FALSE),]
result              <- mixed.solve(phe[,2],
                                   Z= as.matrix(gen[,2:ncol(gen)]),
                                   X= model.matrix(phe[,2]~phe[,3]),
                                   K=NULL, SE=FALSE, return.Hinv=FALSE,
                                   method="ML")
                                   
##################################################################
## step 2: is to calculate the allele frequency at Cycle 1 and 3##
##################################################################
CycleIndicator      <- as.numeric(unlist(strsplit(gen$X,
                       split="_C")) [seq(2,2*nrow(gen),2)])
Cycle1              <- gen[which(CycleIndicator == 1),]
Cycle3              <- gen[which(CycleIndicator == 3),]
CycleList           <- list(Cycle1,Cycle3)
frequencies         <- matrix(nrow=ncol(gen)-1,ncol=2)
for(i in 1:2){
  frequencies[,i]   <- colMeans(CycleList[[i]][,-1],na.rm=TRUE)/2
}
frequencies         <- as.data.frame(frequencies)
names(frequencies)  <- c("Cycle1","Cycle3")
change<-frequencies$Cycle3-frequencies$Cycle1

################################################################
## step 3: Calculate LD Decay                                   ##
################################################################
ld                  <- ld_decay (gen=gen, map=map,
                                 max_win_snp=2000, max.chr=10,
                                 cores=1, max_r2=0.03)

##################################################################
## step 4: Calculate Ghat                                       ##
##################################################################
Ghat.adf    <- Ghat(effects=result$u, change=change, method = "scale",
                    perms=1000,plot="Ghat", num_eff = 54.74819)

message (paste("Ghat=" , Ghat.adf$Ghat,
            "Cor="  , Ghat.adf$Cor ,
            "P-val=", Ghat.adf$p.va, sep = " "))

## Citation

In case you want / have to cite my package, please use `citation('sjPlot')` for citation information. Since core functionality of package depends on the [ggplot-package](https://cran.r-project.org/package=ggplot2), consider citing this package as well.

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1308157.svg)](https://doi.org/10.5281/zenodo.1308157)

