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

Please visit [https://github.com/Medhat86/Ghat](https://cran.r-project.org/web/packages/Ghat/Ghat.pdf) for documentation and examples.

## Citation

- In case you want / have to cite my package, please use `citation('Ghat')` (https://cran.r-project.org/web/packages/Ghat/index.html) for citation information. 

- Since core functionality of package depends on the [Ghat-Method](https://cran.r-project.org/package=ggplot2), consider citing this refernce as well: "Tim Beissinger, Jochen Kruppa, David Cavero, Ngoc-Thuy Ha, Malena Erbe, Henner Simianer, A Simple Test Identifies Selection on Complex Traits, Genetics, Volume 209, Issue 1, 1 May 2018, Pages 321–333, https://doi.org/10.1534/genetics.118.300857"
