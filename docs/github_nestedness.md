---
title: "**KSU: Nestedness vs Turnover**"
author: "Kelli Feeser"
date: '2023-10-10'
output:
  bookdown::html_document2:
    code_folding: hide
    df_print: kable
    number_sections: yes
    toc: yes
    toc_depth: 3
    fig.caption: yes
    keep_md: yes
  html_notebook:
    code_folding: hide
    df_print: paged
    number_sections: yes
    theme: cosmo
    toc: yes
    toc_depth: 2
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

# Theory on the partitioning of beta diversity

[Definition of $\beta$ diversity]{.underline}

Beta diversity can be viewed as a measure that compares inventory diversity at two different scales (alpha and gamma diversity).

$$
\text{If}\ \gamma \neq \bar{\alpha} \text{, then the diversity of a region (} \gamma \text{) exceeds the mean diversity of local sites (} \bar{\alpha} \text{) within the region.}
$$

Therefore, in the strictest sense, the definition of beta diversity ($\beta$) is the ratio between gamma and mean alpha diversities ([Tuomisto, 2010](https://onlinelibrary.wiley.com/doi/10.1111/j.1466-8238.2011.00756.x#b21)).

$$
\beta =  {\gamma \over \bar{\alpha}}
$$

It is clear that gamma diversity can be different from mean alpha diversity if, and only if, local sites differ in species composition. Therefore, the actual parameter determining the ratio between gamma and mean alpha diversities is *the degree to which species composition changes* from site to site. For this reason, the term beta diversity is usually applied in a broad sense to any measure of variation in species composition ([Anderson *et al*., 2011](https://onlinelibrary.wiley.com/doi/10.1111/j.1466-8238.2011.00756.x#b3)). Some of the most popular measures of variation in species composition, like the Jaccard and Sørensen indices, are monotonic transformations of beta diversity that therefore reflect the same concept ([Jost, 2007](https://onlinelibrary.wiley.com/doi/10.1111/j.1466-8238.2011.00756.x#b13)).

There are two general approaches to defining beta diversity:

1.  *proportional diversity*
    a.  classical multiplicative formulation (Whittaker's beta; ($\beta = {\gamma \over \alpha}$)
    b.  if using species count data, the use of classical multiplicative partition is mandatory (Baselga, in press(?)), because independence between beta and alpha is a necessary property (Wilson & Shmida, 1984).
2.  *differentiation diversity*
    a.  additive partitioning of diversity ($\beta = \gamma - \alpha$)
    b.  can be used if using (dis)similarity metrics

However, on *proportional diversity* vs. *differentiation diversity*: it's really all the same in the end because pairwise similarity indices are monotonic transformations of the multiplicative Whittaker's beta computed for two sites ([Jost, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b18)).

The issue is clearly exemplified by the fact that pairwise similarity indices can be generalized and applied to situations involving multiple sites, with multiple-site similarity measures again being monotonic transformations of Whittaker's beta for any number of sites ([Diserud & Ødegaard, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b10)). Therefore, these apparently divergent views on beta diversity are actually consistent with a single beta-diversity concept.

> Note that *pairwise* and *multiple-site* measures are different!

[Additive partitioning of beta diversity into its components]{.underline}

1.  dissimilarity due to species replacement
2.  dissimilarity due to nestedness

-   Changes in species composition (beta diversity) can arise from two phenomena: **spatial turnover** and **nestedness** ([Harrison *et al.*, 1992](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b15); [Baselga *et al.*, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b6)).

    -   **spatial turnover:** the replacement of some species by others from site to site

        -   Spatial turnover implies the replacement of some species by others as a consequence of environmental sorting or spatial and historical constraints ([Qian *et al.*, 2005](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b27)).

    -   **nestedness:** a pattern characterized by the poorest site being a strict subset of the richest site.

        -   Two sites can have obviously different species composition (i.e. the richest site has unique species not present in the poorest site), but no species is replaced by other.

        -   Nestedness of species assemblages occurs when the biotas of sites with smaller numbers of species are subsets of the biotas at richer sites ([Wright & Reeves, 1992](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b43); [Ulrich & Gotelli, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b36)), reflecting a non-random process of species loss as a consequence of any factor that promotes the orderly disaggregation of assemblages ([Gaston & Blackburn, 2000](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b14)).

        -   This effect of richness differences in measures of compositional change was realized by Simpson (1943) as he noted that richness differences could be responsible for the dissimilarity between sites even in the absence of species replacement.

        -   To assess nestedness, need to use a measure that accounts for matrix filling

        -   On the relationship between beta diversity and nestedness:

            -   Harrison et al. (1992) stressed that Whittaker's beta diversity 'does not distinguish between true species turnover along a distance (or environmental) gradient, and situations in which species drop out along the gradient without any new species being added'.

The turnover and nestedness components of beta diversity have contrasting spatial patterns and that the separation of these components is crucial for understanding the historic and present-day determinants of beta diversity (e.g. Dobrovolski et al., 2012; Hortal et al., 2011; Leprieur et al., 2011; Svenning et al., 2011).

It should be stressed that although many matrix configurations are possible ([Almeida-Neto *et al.*, 2008](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b1)), **all situations in which communities are not identical can be described with only these two main patterns (turnover and nestedness) or combinations of both**, since the only processes needed to generate all the possible patterns are species replacement and species loss (or gain). Note that I use the term 'species loss' just to indicate that some species are absent from some sites, without regard to the underlying mechanism (i.e. extinction, differential dispersal capacity and others; [Ulrich *et al.*, 2009](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b37)).

[Parsing effect of nestedness on community similarities (multiple-site measures)]{.underline}

If we are to understand biotic patterns and their causes, patterns which may be revealing different processes must be discerned ([Williams *et al.*, 1999](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b41)) and, in this case, the two processes underlying measures of beta diversity (species loss and species replacement) are not only different but antithetic ([Williams, 1996](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b40); [Gaston & Blackburn, 2000](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b14)). Therefore, nestedness and species turnover must be disentangled ([Baselga, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b3)).

To deal with this effect, several measures ([Shi, 1993](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b30); [Williams, 1996](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b40); [Lennon *et al.*, 2001](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b22); [Koleff *et al.*, 2003](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b20); [Baselga *et al.*, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b6)) have been developed to compute values of: (1) spatial turnover independent of nestedness, and (2) compositional differences attributable to richness.

![**Conceptual Diagram.** (From Baselga2010) Hypothetical examples involving four islands (A--D) and three sampling sites in each. Biotas of sites A1--A3 are completely nested, because poorer biotas are subsets of richer biotas. Sites B1--B3 have the same richness (six species each) with three species common to all three sites and three species exclusive to each site, i.e. displaying a pattern of spatial turnover. Sites C1--C3 present both patterns, because C2 and C3 are subsets of C1 (nestedness), but some species are replaced between C2 and C3, which are not subsets of each other. Sites D1--D3 present spatial turnover and are obviously not nested, but present differences in richness.](../code/Baselga2010_Fig1.png){width="30%"}

Prior poor performing measures:

-   Several multiple-site measures intended to account for spatial turnover, $\beta_{-2}$ ([Harrison *et al.*, 1992](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b15)) and $\beta_{-3}$ ([Williams, 1996](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b40)) do not provide satisfactory results for certain situations in which both nestedness and spatial turnover are involved, because both measures would identify these mixed patterns as completely nested (β~−2~=β~−3~= 0 in both islands A and C).

-   Prior to ([Baselga *et al.*, 2009](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x)), no unified framework existed for measuring beta diversity and partitioning the contributions of spatial turnover and nestedness

However, the pairwise Simpson dissimilarity measure (β~sim~), recovered by [Lennon *et al.* (2001](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b22)) based on [Simpson (1943](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b31)), and its multiple-site generalization ([Baselga *et al.*, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b6)) have proved to efficiently discriminate turnover from nestedness (β~SIM~= 0 in island A, β~SIM~= 0.6 in island B) and mixed situations (β~SIM~= 0.2 in island C).

The total dissimilarity between two assemblages (i.e. beta diversity or, in my specific framework, a monotonic transformation of beta diversity -- Sørensen dissimilarity, $\beta_{sor}$) can be partitioned into two components: dissimilarity due to species replacement (Simpson dissimilarity or spatial turnover, $\beta_{sim}$) and dissimilarity due to nestedness (nestedness-resultant dissimilarity, $\beta_{sne}$).

-   It should be noted that the second component is not a measure of nestedness itself, but a measure of the fraction of total dissimilarity that it is not caused by species replacement but instead by nestedness.

[Pairwise dissimilarity: Sørensen-based dissimilarity and related measures]{.underline}

The Sørensen dissimilarity index (β~sor~) is one of the most used measures due to its dependence on the proportion of species shared between two communities and its linear relationship with Whittaker's beta ([Diserud & Ødegaard, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b10)). The Sørensen dissimilarity index (β~sor~) is formulated as:

$$
\beta_{sor} = {b + c \over 2a + b + c}
$$

where *a* is the number of species common to both sites, *b* is the number of species that occur in the first site but not in the second and *c* is the number of species that occur in the second site but not in the first. It is well known that this measure incorporates both true spatial turnover and differences in richness ([Koleff *et al.*, 2003](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b20)).

To describe spatial turnover without the influence of richness gradients, the Simpson dissimilarity index (β~sim~) was first proposed by [Simpson (1943](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b31)) and later recovered by [Lennon *et al.* (2001](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b22)):

$$
\beta_{sim} = {min(b,c) \over a + min(b,c)}
$$

where *a*, *b* and *c* are the same variables as defined for Sørensen dissimilarity.

Under equal richness:

-   When both localities have the same number of species *b* and *c* must be equal, thus β~sor~ and β~sim~ are also equal because *b*/(*a*+*b*) = 2*b*/(2*a*+ 2*b*).

-   It is also obvious that any dissimilarity between two localities with the same number of species is completely due to spatial turnover because nestedness cannot occur.

Since β~sor~ and β~sim~ are equal in the absence of nestedness, their difference is a measure of the nestedness component of beta diversity. Therefore, I (read: [Baselga *et al.*, 2009](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x)) here introduce the nestedness-resultant dissimilarity (β~nes~) which is derived using basic operations on fractions, and formulated as

$$
\beta_{nes} = \beta_{sor} - \beta_{sim} = {b + c \over 2a + b + c} - {min(b,c) \over a + min(b,c)} \\
\implies {max(b,c) - min(b,c) \over 2a + min(b,c) + max(b,c)} \times {a \over a+ min(b,c)}
$$

It should be noted that the first term of the product is very similar to β~gl~ ([Lennon *et al.*, 2001](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b22); [Koleff *et al.*, 2003](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b20)), a measure of differences in richness, but in this case this term is multiplied by the second term, which is Simpson similarity (i.e. similarity independent of richness differences = 1 −β~sim~). This product is needed to separate differences in richness caused by nestedness from other differences in richness: for example, two completely different communities (sharing no species, i.e. 1 −β~sim~= 0) may have a different number of species, but they are obviously not nested ([Fig.1, island D](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#f1)). In this way, β~nes~ yields the nestedness component of beta diversity, instead of any difference on richness.

Therefore we have a dissimilarity measure accounting for all aspects of beta diversity (β~sor~) that can be partitioned into two additive components accounting for pure spatial turnover (β~sim~) and nestedness (β~nes~):

$$
\beta_{sor} = \beta_{sim} - \beta_{nes}
$$

[Multiple site dissimilarities (Sørensen)]{.underline}

The same additive partition can be conducted for multiple-site dissimilarity measures, but only if multiple-site indices are formulated in terms of matching components as pairwise measures. Otherwise, nestedness and turnover cannot be separated and measures do not perform well in all situations.

Therefore, it is necessary to adopt the approach suggested in [Baselga *et al.* (2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b6)) and build multiple-site equivalents of the matching components (*a*, *b*, *c*). In the cited paper, an index accounting just for the species turnover component was proposed, but the same procedure can be followed to formulate an index accounting for both species turnover and nestedness derived from the pairwise Sørensen dissimilarity:

$$
\beta_{SOR} = { \left[ \sum_ \limits{i>j} min(b_{ij},b_{ji}] \right] + \left[ \sum_ \limits{i>j} max(b_{ij},b_{ji}] \right] \over 2\left[ \sum_ \limits{i} S_i - S_T \right] + \left[ \sum_ \limits{i>j} min(b_{ij},b_{ji}] \right] + \left[ \sum_ \limits{i>j} max(b_{ij},b_{ji}] \right] }
$$

where S~*i*~ is the total number of species in site *i*, S~T~ is the total number of species in all sites considered together and *b~ij~*, *b~ji~* are the number of species exclusive to sites *i* and *j*, respectively, when compared by pairs. Thus$\left[ \sum_ \limits{i>j} min(b_{ij},b_{ji}] \right]$and $\left[ \sum_ \limits{i>j} max(b_{ij},b_{ji}] \right]$ are the multiple-site analogues of the *b* and *c* matching components of pairwise measures, respectively, and $\left[ \sum_ \limits{i} S_i - S_T \right]$ is the analogue of the *a*-component.

As mentioned before, a multiple-site similarity measure accounting only for species turnover is already known ([Baselga *et al.*, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b6)), and β~SIM~ is just its complement:

$$
\beta_{SIM} = { \left[ \sum_ \limits{i>j} min(b_{ij},b_{ji}] \right] \over \left[ \sum_ \limits{i} S_i - S_T \right] + \left[ \sum_ \limits{i>j} min(b_{ij},b_{ji}] \right] }
$$

The multiple-site dissimilarity accounting only for nestedness can just be derived by simple subtraction:

$$
\beta_{NES} = \beta_{SOR} - \beta_{SIM}
$$

[Relationship between β~NES~ and nestedness measures]{.underline}

It should be stressed that β~NES~ is rooted in the framework of beta-diversity analyses and intended to account for the patterns of beta diversity caused by nestedness. In other words, it is *not* a measure of nestedness in absolute terms but a measure of the dissimilarity of communities due to the effect of nestedness patterns.

Many measures of nestedness are available, diverging in the different philosophies behind each metric ([Ulrich *et al.*, 2009](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b37)).\

β~NES~ reflects the increasing dissimilarity between nested communities produced by the increasing differences in the number of species.

In summary, nestedness and *dissimilarity due to nestedness* are related but different concepts, thus divergences in performance between NODF and β~NES~ are consistent with differences between both concepts.

\
**References**\
Baselga, A. 2010. Partitioning the turnover and nestedness components of beta diversity. Global Ecology and Biogeography 19:134-143\

Baselga, A. 2012. The relationship between species replacement, dissimilarity derived from nestedness, and nestedness. Global Ecology and Biogeography 21, 1223-1232

-   From the latter, "Here, I review the concepts and methods used in these recent contributions, with the aim of clarifying: (1) the rationale behind the partitioning of beta diversity into species replacement and nestedness-resultant dissimilarity, (2) how, based on this rationale, numerators and denominators of indices have to match, and (3) how nestedness and nestedness-resultant dissimilarity are related but different concepts... Nestedness should be assessed using consistent measures that depend both on paired overlap and matrix filling, e.g. NODF, whereas beta-diversity patterns should be examined using measures that allow the total dissimilarity to be separated into the components of dissimilarity due to species replacement and dissimilarity due to nestedness. In the case of multiple-site dissimilarity patterns, averaged pairwise indices should never be used because the mean of the pairwise values is unable to accurately reflect the multiple-site attributes of dissimilarity."

    -   It should be stressed that βNES is rooted in the framework of beta-diversity analyses and intended to account for the patterns of beta diversity caused by nestedness. In other words, it is not a measure of nestedness in absolute terms but a measure of the dissimilarity of communities due to the effect of nestedness patterns.

*...ignore the following section for now*\
\######\
In the case of the Sørensen index (βsor=b+c/2a+b+c), it should be noted that the denominator is 2a+b+c because here the total number of unique species (b+c) is relativized with respect to the sum of local richness in both sites (i.e. S1+S2= 2a+b+c). The rationale behind using this denominator is that βsor yields the proportion of unique species per site, which is a measure of dissimilarity at least as meaningful as the proportion of unique species in the entire pool (βjac).

The monotonic relationship between βsor and βjac is well known, as both are monotonic transformations of multiplicative beta diversity (Jost, 2007). This relationship is described by the equation βsor= 2βjac/(1 +βjac) (see, for example, Soininen et al., 2007). However, the relationship is not linear (Fig. 4a). βsor gives more weight to the shared species a because of the aforementioned different rationales introduced by the different denominators (unique species by site in βsor, versus unique species by entire pool in βjac). A similar monotonic relationship holds for the turnover components of βsim and βjtu (Fig. 4b) but not for the nestedness components of βsne and βjne (Spearman rank correlation ρ= 0.980; Fig. 4c). Deviations from the monotonic relationship are related to (1) the existence richness differences (i.e. non-zero nestedness-component) and (2) the nonlinear relationship between the turnover components caused by the different denominator (i.e. βsim measures the proportion of unique species per site if both sites where equally rich, while βjtu measures the proportion of unique species in the two sites pooled together if both sites were equally rich). Thus, the largest deviations from the linear relationship occur when richness differences are large (i.e. b \>\> c or b \<\< c) and either of these conditions is met: (1) max(b,c) =a or (2) min(b,c) =a.\
All analyses were carried out in R (R Development Core Team, 2006), using the functions 'beta-multi.R'and 'beta-pairwise.R'. The file 'beta-multi.R' includes the functions to compute multiple-site dissimilarities βSOR, βSIM and βNES, called beta.SOR(x), beta.SIM(x) and beta.NES(x), respectively, where x is a data frame in which sites are rows and species are columns. The file 'beta-pairwise.R' includes the functions to compute distance matrices using pairwise dissimilarities βsor, βsim and βnes, called beta.sor(x), beta.sim(x) and beta.nes(x), respectively.

\######

\



# Methods: Incidence-based pair-wise dissimilarities

## Prepare input data {.unlisted}

[Explanatory variables]{.underline}\
Mean standardized (if applicable) explanatory variables were converted into Euclidean distance matrices.

`Bac.soil_moisture.dist = dist(Bac.soil_moisture, method = "euclidean", diag=TRUE, upper=FALSE)`

`Bac.soil_moisture.matrix <- matrix(Bac.soil_moisture.dist)`\

[OTU tables]{.underline}\
- Rarefied fungal and bacterial OTU tables were converted to presence/absence matrices.\

## Compute incidence-based pair-wise dissimilarities {.unlisted}

To partition the turnover and nestedness components of beta diversity within each domain, I used `betapart::beta.pair(otu_matrix, index.family="sorensen")` to compute 3 dissimilarity matrices that account for the (i) turnover (replacement), (ii) nestedness-resultant component, and (iii) total dissimilarity (i.e. the sum of both components)\
        i. spatial turnover (replacement), measured as Simpson pair-wise dissimilarity\
        ii. nestedness-resultant dissimilarity, measured as the nestedness-fraction of Sorensen pair-wise dissimilarity\
        iii. total dissimilarity, measured as Sorensen pair-wise dissimilarity (a monotonic transformation of beta diversity)\

"For the two large areas (northern versus southern Europe) I first assessed the overall multiple-site dissimilarity, considering the total beta diversity (β~SOR~), as well as the spatial turnover (β~SIM~) and nestedness (β~NES~) components, and then compared the patterns between northern and southern Europe. To make comparable dissimilarities computed for sets with different number of sites (19 vs. 15), β-values for northern Europe were computed using a resampling procedure, taking 100 random samples of 15 inventories and computing the average β (see R script in Appendix S3). In a second analysis, I assessed the increase of biotic dissimilarity with geographic distance (equivalent to the distance decay of similarity), as computed with the total beta diversity (β~sor~), as well as with the turnover (β~sim~) and nestedness (β~nes~) measures. Since the lack of independence of observations (distances) precludes the test for significance by means of traditional regression procedures, significance of the Pearson correlations was computed by means of Mantel permutation tests using the vegan package ([Oksanen *et al.*, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b26)) in R ([R Development Core Team, 2006](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b28)). To compare the intercepts and slopes yielded by the different dissimilarity indices, the frequency distributions of the parameters were estimated by bootstrapping in order to detect significant differences between measures. A frequency distribution of 1000 slopes and intercepts was retrieved by bootstrapping, using the boot package ([Canty & Ripley, 2008](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b7)). When assessing the significance of one parameter being larger in one region than in the other, the probability of obtaining the opposite result by chance was empirically computed by comparing the estimated distributions of parameters."

## Generate distance matrices for OTU tables {.unlisted}

## Run MRM model {.unlisted}

# Prep data {.unnumbered .unlisted .hidden}

## Create Euclidean Distance Matrix for depth

### All Grasses {.unnumbered}



## Generate Distance Matrices for OTU Tables {.unnumbered .unlisted .hidden}

### All Survey Samples {.unnumbered}





\

## Run MRM Model {.tabset}



\

## Plotting {.tabset}

### All Survey Samples {.unnumbered}



\

### LHSS {.unnumbered}



\

### WHC {.unnumbered}



------------------------------------------------------------------------

#  Results

[TBD]
