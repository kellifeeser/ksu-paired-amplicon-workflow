---
title: "**KSU: Inter-kingdom Regressions**"
subtitle: "Running multiple regressions on distance matrices (MRM) comprised of 16S and ITS OTU tables - Does the composition of bacterial members of a community impact the presence or abundance of fungal members? Or vice versa"
author: "Kelli Feeser"
date: '2024-03-05'
output:
  bookdown::html_document2:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 3
    fig.caption: yes
    keep_md: yes
  html_notebook:
    code_folding: hide
    df_print: paged
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 3
    fig.caption: yes
  html_document: 
    code_folding: hide
    css: ../test.css
    fig_height: 4.5
    fig_width: 6
    number_sections: yes
    theme: cosmo
    toc: yes
    toc_depth: 2
editor_options:
  chunk_output_type: inline
---


\
\
\

### Background {.unlisted .unnumbered}

\

[Analyses on distance matrices]{.underline}

-   2 distance matrices: simple Mantel
    -   a test for association between two $n × n$ matrices whose entries are distances or similarities between all pair-wise combinations of $n$ objects.
    -   The objects may be plots, species, or any other type of sampling unit, and the pair-wise measures may reflect distance or similarity in terms of species abundance(s), environmental conditions, or geographic location (when the objects are plots); physiology, behavior, morphology, or phylogeny (when the objects are species); or any other uni- or multivariate space.\
-   3 matrices: partial Mantel
    -   Partial Mantel analysis is partial correlation analysis performed on distance matrices, each unfolded into a vector. The partial correlation between two distance matrices is computed while controlling for the effect of a third matrix. It is commonly used to obtain the variance partitioning in which variation in species data is partitioned into environmental and spatial components.
    -   However, distance and raw data matrices have very different properties, and distance matrix analysis should not be used for making inferences about raw data (applies to all).\
-   ≥ 2 matrices: **MRM**
    -   multiple regression on distance matrices (MRM)
    -   MRM entails a multiple regression of a response distance matrix, $D_Y$, on two or more environmental, spatial, or other explanatory distance matrices, each unfolded into a distance vector. The significance of an MRM model and its regression coefficients are tested by permuting $D_Y$ while holding the explanatory matrices constant. When $D_Y$ is an ordinary distance or similarity matrix, its rows and columns are permuted and the model $R^2$ and regression coefficients are calculated for each permutation to generate null distributions.
    -   MRM offers two advantages over traditional partial Mantel analysis:
        -   Polynomial, nonlinear, or nonparametric regression methods, such as generalized additive models (Yee and Mitchell 1991), can be used with MRM: Once the distance matrices have been unfolded into vectors, the calculations for fitting an MRM model are no different than those for multiple regression with raw data. The only computational difference lies in significance testing, which is performed by permuting the objects of the response distance matrix.
        -   Expanding the number of explanatory matrices allows each environmental variable to be represented by its own distance matrix. This provides an improved species--environment correlation (because the effects of important variables are not diluted by unimportant ones), and a convenient way to determine the statistical significance and relative importance of each environmental factor.

# Prep data {.unlisted .unnumbered .hidden}













\
\

------------------------------------------------------------------------

\
\


# Methods

## Input data

\
Bacterial and fungal OTU tables subset to only those with samples present from both kingdoms. I have added the generalist vs. specialist results from all grasses to the taxa slots in the objects.

-   n = 484 samples

-   22,661 bacterial OTUs (2,145 are 'Generalists')

-   6,626 fungal OTUs (896 are 'Generalists')

## Create distance matrices

➞ We are assessing the impact of fungal OTU abundance on bacterial composition, therefore using Bray-Curtis as a distance metric... also trying presence/absence via Sørensen.

-   Bacteria
    -   whole community
    -   generalists (from all grasses)
    -   whole community agglomerated to genus-level
-   Fungi
    -   whole community
    -   generalists (from all grasses)
    -   whole community agglomerated to genus-level

\







## Multiple regression models for distance matrices (MRM)

Main reference: [Lichstein 2007](https://people.clas.ufl.edu/jlichstein/files/Lichstein_2007_Plant_Ecol.pdf "Multiple regression on distance matrices: a multivariate spatial analysis tool")

Compared to multiple regressions, all variables in MRM are distance matrices and P-values are estimated by permutation test (9999 runs) to remove the effect of non-independence between cases on P-values (Legendre, Lapointe & Casgrain 1994).

MRM is an explicitly distance-based method somewhat similar to the (partial) Mantel test, except that MRM preserves the individual-nature of input distance matrices instead of a compound distance, i.e., each dependent variables is converted to a distance matrix separately ➞ be careful to state hypotheses and conclusions in terms of distances rather than raw data

| Test                                           | Formula    | Hypothesis                                     | Components                                                                                    |
|:------------------|:-----------------|:-----------------|------------------|
| Multiple regression on distance matrices (MRM) | $y$ \~ $X$ | Explanatory power of each member of $X$ on $y$ | $y$ is an individual distance matrix; $X$ represents one or more individual distance matrices |

**R package**

`ecodist 2.0.9`

**Description**

Multiple regression on distance matrices (MRM) using permutation tests of significance for regression coefficients and R-squared.

**Usage**

```         
MRM(formula = formula(data), data, nperm = 1000,
    method = "linear", mrank = FALSE)
```

**Arguments**

|           |                                                                                                                                                                                            |
|------------------------|------------------------------------------------|
| `formula` | formula describing the test to be conducted.                                                                                                                                               |
| `data`    | an optional dataframe containing the variables in the model as columns of dissimilarities. By default the variables are taken from the current environment.                                |
| `nperm`   | number of permutations to use. If set to 0, the permutation test will be omitted.                                                                                                          |
| `mrank`   | if this is set to FALSE (the default option), Pearson correlations will be used. If set to TRUE, the Spearman correlation (correlation ranked distances) will be used.                     |
| `method`  | if "linear", the default, uses multiple regression analysis. If "logistic", performs logistic regression with appropriate permutation testing. Note that this may be substantially slower. |

**Details**

Performs multiple regression on distance matrices following the methods outlined in Legendre et al. 1994. Specifically, the permutation test uses a pseudo-t test to assess significance, rather than using the regression coefficients directly.

**Value**

|             |                                                                                                                                       |
|------------------------|------------------------------------------------|
| `coef`      | A matrix with regression coefficients and associated p-values from the permutation test (using the pseudo-t of Legendre et al. 1994). |
| `r.squared` | Regression R-squared and associated p-value from the permutation test (linear only).                                                  |
| `F.test`    | F-statistic and p-value for overall F-test for lack of fit (linear only).                                                             |
| ~~`dev`~~   | ~~Residual deviance, degrees of freedom, and associated p-value (logistic only).~~                                                    |
\
\

## MRM model specifications and fitting

1.  **Model Specification**:

    -   Define our MRM model. In this case, it would involve specifying the bacterial distance matrix as the response variable and the fungal distance matrix as the predictor variable(s).

    -   We may include other covariates in the model if necessary, such as environmental variables or sample metadata.

2.  **Model Fitting**:

    -   Fit the MRM models using the `ecodist` package.

    -   Ensure that the model assumptions are met, such as linearity, independence, and normality of residuals.

3.  **Model Assessment**:

    -   Evaluate the significance of the fungal predictors on bacterial community composition using appropriate statistical tests, such as F-tests or permutation tests.

    -   Assess the goodness-of-fit of the model and check for any violations of assumptions.

4.  **Interpretation**:

    -   Interpret the coefficients associated with the fungal predictors to understand their impact on bacterial community composition.

    -   Consider the direction and magnitude of the coefficients to determine the strength and direction of the relationship between fungal abundance and bacterial composition.

5.  **Validation and Sensitivity Analysis**:

    -   Validate the results using cross-validation or other validation techniques to ensure the robustness of the findings.

    -   Conduct sensitivity analysis to assess the robustness of the results to potential outliers or influential data points.





\
\

------------------------------------------------------------------------

\
\


# Results

\
\

## Do fungal community dissimilarities influence bacterial community dissimilarities?

\

### Predictor: Fungi - whole community, abundance-weighted OTUs {.tabset}

\

#### Response: Bacteria - abundance-weighted {.tabset .tabset-pills .unnumbered}

##### Whole community (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Bac_bray_wholecommunity ~ Fun_bray_wholecommunity, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                         Bac_bray_wholecommunity  pval
## Int                                       0.622 1.000
## Fun_bray_wholecommunity                   0.107 0.001
## 
## $r.squared
##    R2  pval 
## 0.014 0.001 
## 
## $F.test
##        F   F.pval 
## 1678.516    0.001
```

\

##### Generalists (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Bac_bray_generalists ~ Fun_bray_wholecommunity, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                         Bac_bray_generalists  pval
## Int                                    0.569 1.000
## Fun_bray_wholecommunity                0.109 0.001
## 
## $r.squared
##    R2  pval 
## 0.016 0.001 
## 
## $F.test
##        F   F.pval 
## 1932.171    0.001
```

\

##### Whole community (Genus-level) {.unnumbered}

OTU table agglomerated to genus-level\
-   A: Yes, but barely


```r
round_mrm(MRM(Bac_bray_wholecommunity_genus ~ Fun_bray_wholecommunity, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                         Bac_bray_wholecommunity_genus  pval
## Int                                             0.485 1.000
## Fun_bray_wholecommunity                         0.104 0.001
## 
## $r.squared
##    R2  pval 
## 0.010 0.001 
## 
## $F.test
##        F   F.pval 
## 1161.389    0.001
```

\

#### Response: Bacteria - p/a (Sørensen) {.tabset .tabset-pills .unnumbered}

##### Whole community (OTUs) {.unnumbered}

-   A: Slightly more


```r
round_mrm(MRM(Bac_sor_wholecommunity$beta.sor ~ Fun_bray_wholecommunity, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                         Bac_sor_wholecommunity$beta.sor  pval
## Int                                               0.599 1.000
## Fun_bray_wholecommunity                           0.101 0.001
## 
## $r.squared
##    R2  pval 
## 0.020 0.001 
## 
## $F.test
##        F   F.pval 
## 2378.244    0.001
```

\

##### Generalists (OTUs) {.unnumbered}

-   A: Slightly more


```r
round_mrm(MRM(Bac_sor_generalists$beta.sor ~ Fun_bray_wholecommunity, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                         Bac_sor_generalists$beta.sor  pval
## Int                                            0.462 1.000
## Fun_bray_wholecommunity                        0.122 0.001
## 
## $r.squared
##    R2  pval 
## 0.024 0.001 
## 
## $F.test
##        F   F.pval 
## 2820.168    0.001
```

\

##### Whole community (Genus-level) {.unnumbered}

OTU table agglomerated to genus-level\
-   A: Yes, but barely


```r
round_mrm(MRM(Bac_sor_wholecommunity_genus$beta.sor ~ Fun_bray_wholecommunity, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                         Bac_sor_wholecommunity_genus$beta.sor  pval
## Int                                                     0.341 0.998
## Fun_bray_wholecommunity                                 0.046 0.003
## 
## $r.squared
##    R2  pval 
## 0.006 0.003 
## 
## $F.test
##       F  F.pval 
## 755.418   0.003
```

\
\

### Predictor: Fungi - whole community, p/a of OTUs (Sørensen) {.tabset}

\

#### Response: Bacteria - abundance-weighted {.tabset .tabset-pills .unnumbered}

##### Whole community (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Bac_bray_wholecommunity ~ Fun_sor_wholecommunity$beta.sor, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                                 Bac_bray_wholecommunity  pval
## Int                                               0.663 1.000
## Fun_sor_wholecommunity$beta.sor                   0.067 0.001
## 
## $r.squared
##    R2  pval 
## 0.008 0.001 
## 
## $F.test
##       F  F.pval 
## 900.327   0.001
```

\

##### Generalists (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Bac_bray_generalists ~ Fun_sor_wholecommunity$beta.sor, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                                 Bac_bray_generalists  pval
## Int                                            0.591 1.000
## Fun_sor_wholecommunity$beta.sor                0.091 0.001
## 
## $r.squared
##    R2  pval 
## 0.016 0.001 
## 
## $F.test
##        F   F.pval 
## 1849.683    0.001
```

\

##### Whole community (Genus-level) {.unnumbered}

OTU table agglomerated to genus-level\
-   A: Yes, but barely


```r
round_mrm(MRM(Bac_bray_wholecommunity_genus ~ Fun_sor_wholecommunity$beta.sor, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                                 Bac_bray_wholecommunity_genus  pval
## Int                                                     0.530 0.989
## Fun_sor_wholecommunity$beta.sor                         0.059 0.016
## 
## $r.squared
##    R2  pval 
## 0.004 0.016 
## 
## $F.test
##       F  F.pval 
## 503.496   0.016
```

\

#### Response: Bacteria - p/a (Sørensen) {.tabset .tabset-pills .unnumbered}

##### Whole community (OTUs) {.unnumbered}

-   A: Yes, barely


```r
round_mrm(MRM(Bac_sor_wholecommunity$beta.sor ~ Fun_sor_wholecommunity$beta.sor, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                                 Bac_sor_wholecommunity$beta.sor  pval
## Int                                                       0.629 1.000
## Fun_sor_wholecommunity$beta.sor                           0.074 0.001
## 
## $r.squared
##    R2  pval 
## 0.015 0.001 
## 
## $F.test
##        F   F.pval 
## 1727.772    0.001
```

\

##### Generalists (OTUs) {.unnumbered}

-   A: Slightly more


```r
round_mrm(MRM(Bac_sor_generalists$beta.sor ~ Fun_sor_wholecommunity$beta.sor, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                                 Bac_sor_generalists$beta.sor  pval
## Int                                                    0.494 1.000
## Fun_sor_wholecommunity$beta.sor                        0.093 0.001
## 
## $r.squared
##    R2  pval 
## 0.019 0.001 
## 
## $F.test
##        F   F.pval 
## 2227.378    0.001
```

\

##### Whole community (Genus-level) {.unnumbered}

OTU table agglomerated to genus-level\
-   A: Yes, but barely


```r
round_mrm(MRM(Bac_sor_wholecommunity_genus$beta.sor ~ Fun_sor_wholecommunity$beta.sor, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                                 Bac_sor_wholecommunity_genus$beta.sor  pval
## Int                                                             0.360 0.984
## Fun_sor_wholecommunity$beta.sor                                 0.027 0.025
## 
## $r.squared
##    R2  pval 
## 0.003 0.025 
## 
## $F.test
##       F  F.pval 
## 350.273   0.025
```

\
\

------------------------------------------------------------------------

\

### Predictor: Fungi - Generalists, abundance-weighted OTUs {.tabset}

\

#### Response: Bacteria - abundance-weighted {.tabset .tabset-pills .unnumbered}

##### Whole community (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Bac_bray_wholecommunity ~ Fun_bray_generalists, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                      Bac_bray_wholecommunity  pval
## Int                                    0.671 1.000
## Fun_bray_generalists                   0.058 0.001
## 
## $r.squared
##    R2  pval 
## 0.009 0.001 
## 
## $F.test
##        F   F.pval 
## 1114.180    0.001
```

\

##### Generalists (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Bac_bray_generalists ~ Fun_bray_generalists, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                      Bac_bray_generalists  pval
## Int                                 0.616 1.000
## Fun_bray_generalists                0.061 0.001
## 
## $r.squared
##    R2  pval 
## 0.012 0.001 
## 
## $F.test
##        F   F.pval 
## 1398.430    0.001
```

\

##### Whole community (Genus-level) {.unnumbered}

OTU table agglomerated to genus-level\
-   A: Yes, but barely


```r
round_mrm(MRM(Bac_bray_wholecommunity_genus ~ Fun_bray_generalists, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                      Bac_bray_wholecommunity_genus  pval
## Int                                          0.529 0.999
## Fun_bray_generalists                         0.061 0.002
## 
## $r.squared
##    R2  pval 
## 0.008 0.002 
## 
## $F.test
##       F  F.pval 
## 908.868   0.002
```


\
\

------------------------------------------------------------------------

\

### Predictor: Fungi - whole community, abundance-weighted genera {.tabset}
\
Fungal OTU table agglomerated to genus-level
\

#### Response: Bacteria - abundance-weighted {.tabset .tabset-pills .unnumbered}

##### Whole community (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Bac_bray_wholecommunity ~ Fun_bray_wholecommunity_genus, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                               Bac_bray_wholecommunity  pval
## Int                                             0.624 1.000
## Fun_bray_wholecommunity_genus                   0.117 0.001
## 
## $r.squared
##    R2  pval 
## 0.020 0.001 
## 
## $F.test
##        F   F.pval 
## 2369.690    0.001
```

\

##### Generalists (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Bac_bray_generalists ~ Fun_bray_wholecommunity_genus, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                               Bac_bray_generalists  pval
## Int                                          0.571 1.000
## Fun_bray_wholecommunity_genus                0.119 0.001
## 
## $r.squared
##    R2  pval 
## 0.023 0.001 
## 
## $F.test
##        F   F.pval 
## 2739.624    0.001
```

\

##### Whole community (Genus-level) {.unnumbered}

OTU table agglomerated to genus-level\
-   A: Yes, but barely


```r
round_mrm(MRM(Bac_bray_wholecommunity_genus ~ Fun_bray_wholecommunity_genus, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                               Bac_bray_wholecommunity_genus  pval
## Int                                                   0.487 1.000
## Fun_bray_wholecommunity_genus                         0.114 0.001
## 
## $r.squared
##    R2  pval 
## 0.014 0.001 
## 
## $F.test
##        F   F.pval 
## 1635.345    0.001
```


\
\


\
\

------------------------------------------------------------------------

------------------------------------------------------------------------

\
\



## Do bacterial community dissimilarities influence fungal community dissimilarities? 

\

### Predictor: Bacteria - whole community, abundance-weighted OTUs {.tabset}

\

#### Response: Fungi - abundance-weighted {.tabset .tabset-pills .unnumbered}

##### Whole community (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Fun_bray_wholecommunity ~ Bac_bray_wholecommunity, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                         Fun_bray_wholecommunity  pval
## Int                                       0.797 1.000
## Bac_bray_wholecommunity                   0.132 0.001
## 
## $r.squared
##    R2  pval 
## 0.014 0.001 
## 
## $F.test
##        F   F.pval 
## 1678.516    0.001
```

\

##### Generalists (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Fun_bray_generalists ~ Bac_bray_wholecommunity, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                         Fun_bray_generalists  pval
## Int                                    0.695 1.000
## Bac_bray_wholecommunity                0.163 0.001
## 
## $r.squared
##    R2  pval 
## 0.009 0.001 
## 
## $F.test
##        F   F.pval 
## 1114.180    0.001
```

\

##### Whole community (Genus-level) {.unnumbered}

OTU table agglomerated to genus-level\
-   A: Yes, but barely


```r
round_mrm(MRM(Fun_bray_wholecommunity_genus ~ Bac_bray_wholecommunity, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                         Fun_bray_wholecommunity_genus  pval
## Int                                             0.678 1.000
## Bac_bray_wholecommunity                         0.170 0.001
## 
## $r.squared
##    R2  pval 
## 0.020 0.001 
## 
## $F.test
##        F   F.pval 
## 2369.690    0.001
```

\
\

------------------------------------------------------------------------

\

### Predictor: Bacteria - Generalists, abundance-weighted OTUs {.tabset}

\

#### Response: Fungi - abundance-weighted {.tabset .tabset-pills .unnumbered}

##### Whole community (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Fun_bray_wholecommunity ~ Bac_bray_generalists, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                      Fun_bray_wholecommunity  pval
## Int                                    0.792 1.000
## Bac_bray_generalists                   0.150 0.001
## 
## $r.squared
##    R2  pval 
## 0.016 0.001 
## 
## $F.test
##        F   F.pval 
## 1932.171    0.001
```

\

##### Generalists (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Fun_bray_generalists ~ Bac_bray_generalists, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                      Fun_bray_generalists  pval
## Int                                 0.683 1.000
## Bac_bray_generalists                0.193 0.001
## 
## $r.squared
##    R2  pval 
## 0.012 0.001 
## 
## $F.test
##        F   F.pval 
## 1398.430    0.001
```

\

##### Whole community (Genus-level) {.unnumbered}

OTU table agglomerated to genus-level\
-   A: Yes, but barely


```r
round_mrm(MRM(Fun_bray_wholecommunity_genus ~ Bac_bray_generalists, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                      Fun_bray_wholecommunity_genus  pval
## Int                                          0.671 1.000
## Bac_bray_generalists                         0.193 0.001
## 
## $r.squared
##    R2  pval 
## 0.023 0.001 
## 
## $F.test
##        F   F.pval 
## 2739.624    0.001
```


\
\

------------------------------------------------------------------------

\

### Predictor: Bacteria - whole community, abundance-weighted genera {.tabset}
\
Bacterial OTU table agglomerated to genus-level
\

#### Response: Fungi - abundance-weighted {.tabset .tabset-pills .unnumbered}

##### Whole community (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Fun_bray_wholecommunity ~ Bac_bray_wholecommunity_genus, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                               Fun_bray_wholecommunity  pval
## Int                                             0.837 1.000
## Bac_bray_wholecommunity_genus                   0.094 0.001
## 
## $r.squared
##    R2  pval 
## 0.010 0.001 
## 
## $F.test
##        F   F.pval 
## 1161.389    0.001
```

\

##### Generalists (OTUs) {.unnumbered}

-   A: Yes, but barely


```r
round_mrm(MRM(Fun_bray_generalists ~ Bac_bray_wholecommunity_genus, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                               Fun_bray_generalists  pval
## Int                                          0.739 0.999
## Bac_bray_wholecommunity_genus                0.126 0.003
## 
## $r.squared
##    R2  pval 
## 0.008 0.003 
## 
## $F.test
##       F  F.pval 
## 908.868   0.003
```

\

##### Whole community (Genus-level) {.unnumbered}

OTU table agglomerated to genus-level\
-   A: Yes, but barely


```r
round_mrm(MRM(Fun_bray_wholecommunity_genus ~ Bac_bray_wholecommunity_genus, nperm = 1000, method = "linear"), digits = 3)
```

```
## $coef
##                               Fun_bray_wholecommunity_genus  pval
## Int                                                   0.729 1.000
## Bac_bray_wholecommunity_genus                         0.121 0.001
## 
## $r.squared
##    R2  pval 
## 0.014 0.001 
## 
## $F.test
##        F   F.pval 
## 1635.345    0.001
```


\
\


\
\

------------------------------------------------------------------------

------------------------------------------------------------------------

\
\






# Cut code {.unnumbered .unlisted .hidden}

##### Logistic {.unnumbered .unlisted .hidden}

-   A: Yes, but barely



For ease of interpretation:

-   `$F.test`

    -   `F`: The F-statistic measures the ratio of the variance explained by the model to the unexplained variance. In the context of the lack of fit test:

        -   A larger F-statistic indicates that the variance explained by the model is significantly greater than the unexplained variance, suggesting that the model fits the data well.

        -   Conversely, a smaller F-statistic indicates that the model does not explain much of the variance in the data relative to the unexplained variance, suggesting potential lack of fit.

    -   `F.pval`: The p-value associated with the F-statistic indicates the probability of observing an F-statistic as extreme as the one computed from the data, assuming that the null hypothesis is true (i.e., assuming that there is no lack of fit).

        -   A small p-value (usually less than a chosen significance level, e.g., 0.05) suggests that the observed lack of fit is unlikely to occur by chance alone. In this case, you would reject the null hypothesis and conclude that there is evidence of lack of fit in the model.

        -   A large p-value suggests that the observed lack of fit could plausibly occur by chance even if the null hypothesis is true. In this case, you would fail to reject the null hypothesis, indicating that there is no significant evidence of lack of fit in the model.\
