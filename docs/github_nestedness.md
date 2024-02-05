---
title: "**KSU: Nestedness vs Turnover**"
author: "Kelli Feeser"
date: '2024-02-04'
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
    toc_depth: 3
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

> **Summary:** As Sørensen dissimilarity and Simpson dissimilarity are equal in the absence of nestedness, their difference is a net measure of the nestedness-resultant component of beta diversity (Baselga 2010; Leprieuret al.2011). I chose Sørensen because it is a presence/absence diversity measure formulated to enable additive partitioning of beta diversity ~~(Sørensen is a monotonic transformation of Jaccard).~~

[Definition of $\beta$ diversity]{.underline}

Beta diversity can be viewed as a measure that compares inventory diversity at two different scales (alpha and gamma diversity).

$$
\text{If}\ \gamma \neq \bar{\alpha} \text{, then the diversity of a region (} \gamma \text{) exceeds the mean diversity of local sites (} \bar{\alpha} \text{) within the region.}
$$

Therefore, in the strictest sense, the definition of beta diversity ($\beta$) is the ratio between gamma and mean alpha diversities ([Tuomisto, 2010](https://onlinelibrary.wiley.com/doi/10.1111/j.1466-8238.2011.00756.x#b21)).

$$
\beta =  {\gamma \over \bar{\alpha}}
$$

It is clear that gamma diversity can be different from mean alpha diversity if, and only if, local sites differ in species composition. Therefore, the actual parameter determining the ratio between gamma and mean alpha diversities is *the degree to which species composition changes* from site to site. For this reason, the term beta diversity is usually applied in a broad sense to any measure of variation in species composition ([Anderson *et al*., 2011](https://onlinelibrary.wiley.com/doi/10.1111/j.1466-8238.2011.00756.x#b3)). Some of the most popular measures of variation in species composition, like the Jaccard and Sørensen indices, are [monotonic transformations]{style="color: yellow;"} of beta diversity that therefore reflect the same concept ([Jost, 2007](https://onlinelibrary.wiley.com/doi/10.1111/j.1466-8238.2011.00756.x#b13)).

There are two general approaches to defining beta diversity:

1.  *proportional diversity*
    a.  classical multiplicative formulation (Whittaker's beta; ($\beta = {\gamma \over \alpha}$)
    b.  if using species count data, the use of classical multiplicative partition is mandatory ([Baselga 2010b](https://www.jstor.org/stable/25680449)), because independence between beta and alpha is a necessary property (Wilson & Shmida, 1984).
2.  *differentiation diversity*
    a.  additive partitioning of diversity ($\beta = \gamma - \alpha$)
    b.  can be used if using (dis)similarity metrics

However, on *proportional diversity* vs. *differentiation diversity*: it's really all the same in the end because pairwise similarity indices are [monotonic transformations]{style="color: yellow;"} of the multiplicative Whittaker's beta computed for two sites ([Jost, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b18)).

The issue is exemplified by the fact that pairwise similarity indices can be generalized and applied to situations involving multiple sites, with multiple-site similarity measures again being monotonic transformations of Whittaker's beta for any number of sites ([Diserud & Ødegaard, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b10)). Therefore, these apparently divergent views on beta diversity are actually consistent with a single beta-diversity concept.

\####################################################

[Pairwise vs. multiple-site dissimilarity measures]{.underline}

::: {style="color: darkgreen;"}
Note that *pairwise* and *multiple-site* measures are different! Modifications (monotonic transformations) need to be made to the pairwise input data - multiple-site indices must be formulated in terms of matching components as pairwise measures.
:::

    ↪  This means building multiple-site equivalents of the matching components (*a*, *b*, *c*)

-   *a* is the number of species common to both sites

    -   the *a*-component analogue for the multiple-site measures is very simply computed, while still accounting for the different degrees of overlap derived from species shared by more than two sites, because it is derived using the inclusion--exclusion principle‡ ([Erickson, 1996](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b12))

-   *b* is the number of species that occur in the first site but not in the second

    -   for the multiple-site analogue - derive minimum number of species exclusive to sites *i* and *j*, when compared by pairs

-   *c* is the number of species that occur in the second site but not in the first

    -   for the multiple-site analogue - derive maximum number of species exclusive to sites *i* and *j*, when compared by pairs

    -   note that the *b*- and *c*-component analogues cannot be simplified as in *a* while maintaining comparisons among more than three sites because of the need to separate the maximum and minimum values. For this reason, the *b*- and *c*-component analogues are computed only for pairs of sites because doing the contrary would imply severe computational difficulties in the generalization of indices for situations involving any number of sites.

‡Doing this simplification to the *a*-component analogue, the multiple-site nature of the measures is not compromised, since the *a*-component analogue accounts for the information on species shared by more than two sites, but, as a consequence, measures are dependent on the number of sites (*n*), i.e. β~SOR~ is a transformation of Whittaker's beta and β~−1~, but the shape of the relationship depends on *n*. **Therefore, it is essential that comparisons between multiple-site measures should always be conducted among areas with equal numbers, or a very similar number, of sites.**

|        Examples of pairwise measures        |             Multiple-site measure equivalents             |
|:-----------------------------:|:---------------------------------------:|
|   Simpson pairwise dissimilarity (β~sim~)   |    Simpson-based multiple-site dissimilarity (β~SIM~)     |
|  Sørensen pairwise dissimilarity (β~sor~)   |    Sørensen-based multiple-site dissimilarity (β~SOR~)    |
| Nestedness-resultant dissimilarity (β~nes~) | Nestedness-resultant multiple-site dissimilarity (β~NES~) |

\####################################################

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

![**Conceptual Diagram.** (From Baselga2010a) Hypothetical examples involving four islands (A--D) and three sampling sites in each. Biotas of sites A1--A3 are completely nested, because poorer biotas are subsets of richer biotas. Sites B1--B3 have the same richness (six species each) with three species common to all three sites and three species exclusive to each site, i.e. displaying a pattern of spatial turnover. Sites C1--C3 present both patterns, because C2 and C3 are subsets of C1 (nestedness), but some species are replaced between C2 and C3, which are not subsets of each other. Sites D1--D3 present spatial turnover and are obviously not nested, but present differences in richness.](../code/Baselga2010_Fig1.png){width="30%"}

Prior poor performing measures:

-   Several multiple-site measures intended to account for spatial turnover, $\beta_{-2}$ ([Harrison *et al.*, 1992](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b15)) and $\beta_{-3}$ ([Williams, 1996](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b40)) do not provide satisfactory results for certain situations in which both nestedness and spatial turnover are involved, because both measures would identify these mixed patterns as completely nested (β~−2~=β~−3~= 0 in both islands A and C).

-   Prior to ([Baselga *et al.*, 2010a](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x)), no unified framework existed for measuring beta diversity and partitioning the contributions of spatial turnover and nestedness

However, the pairwise Simpson dissimilarity measure (β~sim~), recovered by [Lennon *et al.* (2001](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b22)) based on [Simpson (1943](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b31)), and its multiple-site generalization ([Baselga *et al.*, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b6)) have proved to efficiently discriminate turnover from nestedness (β~SIM~= 0 in island A, β~SIM~= 0.6 in island B) and mixed situations (β~SIM~= 0.2 in island C).

The total dissimilarity between two assemblages (i.e. beta diversity or, in my specific framework, a monotonic transformation of beta diversity -- Sørensen dissimilarity, $\beta_{sor}$) can be partitioned into two components: dissimilarity due to species replacement (Simpson dissimilarity or spatial turnover, $\beta_{sim}$) and dissimilarity due to nestedness (nestedness-resultant dissimilarity, $\beta_{sne}$).

-   It should be noted that the second component is not a measure of nestedness itself, but a measure of the fraction of total dissimilarity that it is not caused by species replacement but instead by nestedness.

[Pairwise dissimilarity: Sørensen-based dissimilarity and related measures]{.underline}

The Sørensen dissimilarity index (β~sor~) is one of the most used measures due to its dependence on the proportion of species shared between two communities and its linear relationship with Whittaker's beta ([Diserud & Ødegaard, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b10)). The Sørensen dissimilarity index (β~sor~) is formulated as:

$$
\beta_{sor} = {b + c \over 2a + b + c}
$$

where *a* is the number of species common to both sites, *b* is the number of species that occur in the first site but not in the second and *c* is the number of species that occur in the second site but not in the first. It is well known that this measure incorporates both true spatial turnover and differences in richness ([Koleff *et al.*, 2003](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b20)).

To describe spatial turnover without the influence of richness gradients, the Simpson dissimilarity index (β~sim~) was first proposed by [Simpson (1943](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b31)) and later recovered by [Lennon *et al.* (2001](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b22)):

$$
\beta_{sim} = {min(b,c) \over a + min(b,c)}
$$

where *a*, *b* and *c* are the same variables as defined for Sørensen dissimilarity.

Under equal richness:

-   When both localities have the same number of species *b* and *c* must be equal, thus β~sor~ and β~sim~ are also equal because *b*/(*a*+*b*) = 2*b*/(2*a*+ 2*b*).

-   It is apparent that any dissimilarity between two localities with the same number of species is completely due to spatial turnover because nestedness cannot occur.

Since β~sor~ and β~sim~ are equal in the absence of nestedness, their difference is a measure of the nestedness component of beta diversity. Therefore, I (read: [Baselga 2010a](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x)) here introduce the nestedness-resultant dissimilarity (β~nes~) which is derived using basic operations on fractions, and formulated as

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

As mentioned before, a multiple-site similarity measure accounting only for species turnover is already known ([Baselga *et al.*, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b6)), and β~SIM~ is just its complement:

$$
\beta_{SIM} = { \left[ \sum_ \limits{i>j} min(b_{ij},b_{ji}] \right] \over \left[ \sum_ \limits{i} S_i - S_T \right] + \left[ \sum_ \limits{i>j} min(b_{ij},b_{ji}] \right] }
$$

The multiple-site dissimilarity accounting only for nestedness can be derived by simple subtraction:

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
Baselga, A., Jiménez-Valverde, A. & Niccolini, G. (2007) A multiple-site similarity measure independent of richness. *Biology Letters*, **3**, 642--645. (<https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2391238/>)

Baselga, A. (2007) Disentangling distance decay of similarity from richness gradients: response to Soininen *et al.* 2007. *Ecography*, 30, 838--841. (<https://www.jstor.org/stable/30244535>)

Baselga, A. (2008) Determinants of species richness, endemism and turnover in European longhorn beetles. *Ecography*, 31, 263--271. (<https://doi.org/10.1111/j.0906-7590.2008.5335.x>)

Baselga, A. (2010a) Partitioning the turnover and nestedness components of beta diversity. Global Ecology and Biogeography 19:134-143 (<https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b6>)

Baselga, A. (2010b) Multiplicative partitioning of true diversity yields independent alpha and beta components, additive partitioning does not. *Ecology*, *91*(7), 1974-1981. (<https://www.jstor.org/stable/25680449>)

Baselga, A. (2012) The relationship between species replacement, dissimilarity derived from nestedness, and nestedness. Global Ecology and Biogeography 21, 1223-1232 (<https://onlinelibrary.wiley.com/doi/pdfdirect/10.1111/j.1466-8238.2011.00756.x>)

-   From the latter, "Here, I review the concepts and methods used in these recent contributions, with the aim of clarifying: (1) the rationale behind the partitioning of beta diversity into species replacement and nestedness-resultant dissimilarity, (2) how, based on this rationale, numerators and denominators of indices have to match, and (3) how nestedness and nestedness-resultant dissimilarity are related but different concepts... Nestedness should be assessed using consistent measures that depend both on paired overlap and matrix filling, e.g. NODF, whereas beta-diversity patterns should be examined using measures that allow the total dissimilarity to be separated into the components of dissimilarity due to species replacement and dissimilarity due to nestedness. In the case of multiple-site dissimilarity patterns, averaged pairwise indices should never be used because the mean of the pairwise values is unable to accurately reflect the multiple-site attributes of dissimilarity."

    -   It should be stressed that βNES is rooted in the framework of beta-diversity analyses and intended to account for the patterns of beta diversity caused by nestedness. In other words, it is not a measure of nestedness in absolute terms but a measure of the dissimilarity of communities due to the effect of nestedness patterns.

\



# Methods:

## Prepare input data: explanatory variables {.unlisted}

Down-selected from all variables available based on i) gradient length (if applicable) and ii) permANOVA (\`vegan::adonis2(..., distance="bray")) significance and $R^2$ values. See R script .R for details.

Down-selected list

-   Latitudinal bins

Details by variable type:

-   Discrete categories/binned data

    -   Latitudinal bins (n = 4)

        -   North (n = 6 sites, 141 samples); North Central (n = 5 sites, 105 samples); South Central (n = 6 sites, 131 samples); South (n = 6 sites, 132 samples)
        -   To build multiple-site equivalent to pairwise (via re-sampling):
            -   The minimum number of sites is 5 and the minimum number of samples is 105, therefore to compare the dissimilarities I selected 105 random samples of 5 site inventories (list of all 16S and ITS OTUs present) and computed the average $/beta$ values of each domain, as measured by [Sørensen(??)]{style="color: orange;"} dissimilarity

-   Continuous data: mean standardized (if applicable) explanatory variables were converted into Euclidean distance matrices.

    -   soil moisture (%) was not mean standardized as it is inherently bounded between 0 and 1.

        `Bac.soil_moisture.dist = dist(Bac.soil_moisture, method = "euclidean", diag=TRUE, upper=FALSE)`

        `Bac.soil_moisture.matrix <- matrix(Bac.soil_moisture.dist)`

-   Geographic distance

    -   I assessed the increase of biotic dissimilarity with geographic distance (equivalent to the distance decay of similarity)

    -   Since the lack of independence of observations (distances) precludes the test for significance by means of traditional regression procedures, significance of the Pearson correlations was computed by means of Mantel permutation tests using the vegan package ([Oksanen *et al.*, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b26)) in R ([R Development Core Team, 2006](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b28))

## Randomly subsample 16S and ITS OTU tables to the lowest common denominator number of sites and samples {.unlisted}

-   Rarefied fungal and bacterial OTU tables were converted to presence/absence matrices.

-   For each analysis, groups of locations and samples within were randomly sub-sampled so that the number of sites and samples were comparable (common minimum, as described above).\

## Compute incidence-based multiple-site dissimilarities {.unlisted}

To partition the turnover and nestedness components of beta diversity within each domain, I used `betapart::beta.multi(otu_df, index.family="sorensen")` to compute 3 dissimilarity matrices that account for the (i) total dissimilarity, (ii) turnover (replacement), and (iii) nestedness-resultant component.

        i. total dissimilarity, measured as Sorensen dissimilarity (a monotonic transformation of beta diversity). Notably the sum of components ii and iii.

        ii. spatial turnover (replacement), measured as Simpson pair-wise dissimilarity

        iii. nestedness-resultant dissimilarity, measured as the nestedness-fraction of Sorensen pair-wise dissimilarity\

## Statistical analysis

### Distance-decay relationships

From [Baselga 2010a](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x):

"In a second analysis, I assessed the increase of biotic dissimilarity with geographic distance (equivalent to the distance decay of similarity), as computed with the total beta diversity (β~sor~), as well as with the turnover (β~sim~) and nestedness (β~nes~) measures. Since the lack of independence of observations (distances) precludes the test for significance by means of traditional regression procedures, significance of the Pearson correlations was computed by means of Mantel permutation tests using the vegan package ([Oksanen *et al.*, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b26)) in R ([R Development Core Team, 2006](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b28)). To compare the intercepts and slopes yielded by the different dissimilarity indices, the frequency distributions of the parameters were estimated by bootstrapping in order to detect significant differences between measures. A frequency distribution of 1000 slopes and intercepts was retrieved by bootstrapping, using the boot package ([Canty & Ripley, 2008](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b7)). When assessing the significance of one parameter being larger in one region than in the other, the probability of obtaining the opposite result by chance was empirically computed by comparing the estimated distributions of parameters."

### Gradient analyses: multiple regression models for distance matrices (MRM)

To assess the impact of environmental gradients on beta-diversity patterns, I used multiple regression models for distance matrices (MRM) (Lichstein 2007) to examine the relationships between dissimilarity matrices (overall beta diversity, and its turnover and nestedness-resultant components) and the Euclidean distance matrices of environmental variables:

1.  difference in area (note to me: re-org so not under 'Gradient')

2.  soil moisture

3.  TBD

Compared to multiple regressions, all variables in MRM are distance matrices and P-values are estimated by permutation test (9999 runs) to remove the effect of non-independence between cases on P-values (Legendre, Lapointe & Casgrain 1994).\

## methods text to hide for now {.unlisted .unnumbered .hidden}

"For the two large areas (northern versus southern Europe) I first assessed the overall multiple-site dissimilarity, considering the total beta diversity (β~SOR~), as well as the spatial turnover (β~SIM~) and nestedness (β~NES~) components, and then compared the patterns between northern and southern Europe. To make comparable dissimilarities computed for sets with different number of sites (19 vs. 15), β-values for northern Europe were computed using a resampling procedure, taking 100 random samples of 15 inventories and computing the average β (see R script in Appendix S3). In a second analysis, I assessed the increase of biotic dissimilarity with geographic distance (equivalent to the distance decay of similarity), as computed with the total beta diversity (β~sor~), as well as with the turnover (β~sim~) and nestedness (β~nes~) measures. Since the lack of independence of observations (distances) precludes the test for significance by means of traditional regression procedures, significance of the Pearson correlations was computed by means of Mantel permutation tests using the vegan package ([Oksanen *et al.*, 2007](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b26)) in R ([R Development Core Team, 2006](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b28)). To compare the intercepts and slopes yielded by the different dissimilarity indices, the frequency distributions of the parameters were estimated by bootstrapping in order to detect significant differences between measures. A frequency distribution of 1000 slopes and intercepts was retrieved by bootstrapping, using the boot package ([Canty & Ripley, 2008](https://onlinelibrary.wiley.com/doi/full/10.1111/j.1466-8238.2009.00490.x#b7)). When assessing the significance of one parameter being larger in one region than in the other, the probability of obtaining the opposite result by chance was empirically computed by comparing the estimated distributions of parameters."

*...ignore the following section for now*\
\######\
In the case of the Sørensen index (βsor=b+c/2a+b+c), it should be noted that the denominator is 2a+b+c because here the total number of unique species (b+c) is relativized with respect to the sum of local richness in both sites (i.e. S1+S2= 2a+b+c). The rationale behind using this denominator is that βsor yields the proportion of unique species per site, which is a measure of dissimilarity at least as meaningful as the proportion of unique species in the entire pool (βjac).

The monotonic relationship between βsor and βjac is well known, as both are monotonic transformations of multiplicative beta diversity (Jost, 2007). This relationship is described by the equation βsor= 2βjac/(1 +βjac) (see, for example, Soininen et al., 2007). However, the relationship is not linear (Fig. 4a). βsor gives more weight to the shared species a because of the aforementioned different rationales introduced by the different denominators (unique species by site in βsor, versus unique species by entire pool in βjac). A similar monotonic relationship holds for the turnover components of βsim and βjtu (Fig. 4b) but not for the nestedness components of βsne and βjne (Spearman rank correlation ρ= 0.980; Fig. 4c). Deviations from the monotonic relationship are related to (1) the existence richness differences (i.e. non-zero nestedness-component) and (2) the nonlinear relationship between the turnover components caused by the different denominator (i.e. βsim measures the proportion of unique species per site if both sites where equally rich, while βjtu measures the proportion of unique species in the two sites pooled together if both sites were equally rich). Thus, the largest deviations from the linear relationship occur when richness differences are large (i.e. b \>\> c or b \<\< c) and either of these conditions is met: (1) max(b,c) =a or (2) min(b,c) =a.\
All analyses were carried out in R (R Development Core Team, 2006), using the functions 'beta-multi.R'and 'beta-pairwise.R'. The file 'beta-multi.R' includes the functions to compute multiple-site dissimilarities βSOR, βSIM and βNES, called beta.SOR(x), beta.SIM(x) and beta.NES(x), respectively, where x is a data frame in which sites are rows and species are columns. The file 'beta-pairwise.R' includes the functions to compute distance matrices using pairwise dissimilarities βsor, βsim and βnes, called beta.sor(x), beta.sim(x) and beta.nes(x), respectively.

\######

### Sub-sample {.unlisted}



# Prep data {.unnumbered .unlisted .hidden}

## betapart.core

Computes the basic quantities needed for computing the multiple-site beta diversity measures and pairwise dissimilarity matrices.



### Sub-sample OTU tables



## Edaphic/environmental var: distance matrices

### soil moisture

## Unsorted code {.unnumbered}



#### Generate Distance Matrices for OTU Tables {.unnumbered .unlisted .hidden}

##### All Survey Samples {.unnumbered}





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

# Results

Before multiple-site modifications and trimming of sites/samples, here are the relevant stats for the full OTU tables:

| Multi-site analogue elements |    Bacteria    | Fungi  | Element explanation                                                 |
|-----------------|:---------------:|:---------------:|-----------------------|
|                              | *full dataset* |        |                                                                     |
| n_sites                      |      533       |  509   |                                                                     |
| sumSi                        |    590,625     | 73,496 | the sum of the species richness values of all sites ($\sum \alpha$) |
| $\bar{\alpha}$               |    1,108.1     | 144.4  | computed average $\alpha$ value                                     |
| St                           |     23,156     | 6,749  | the total richness in the dataset ($\gamma$)                        |
| *a*                          |    567,469     | 66,747 | the multiple-site analog of the shared species term                 |

[For edaphic gradients]{.underline}

After re-sampling 999 times and calculating the multiple-site dissimilarities for 509 samples (minimum number of samples in common):

| Beta-diversity after re-sampling | Bacteria  |     Fungi      | Term explanation                 |
|-----------------|:---------------:|:---------------:|-----------------------|
|                                  |           | *full dataset* |                                  |
| $\beta_{SOR}$                    | 0.9945 ± 6.1e-06  |   0.9940 ± 0   | total dissimilarity (mean ± SD)  |
| $\beta_{SIM}$                    |   0.9929 ± 1.29e-05   |   0.9956 ± 0   | turnover component (mean ± SD)   |
| $\beta_{NES}$                    |   0.00163 ± 1.21e-05   |  0.00158 ± 0   | nestedness component (mean ± SD) |

## results text to hide for now {.unlisted .unnumbered .hidden}

[TBD]

testing:

In order to test for the existence of latitudinal patterns of beta diversity, as could be expected by the biogeographic ~~history of Europe~~, I have split the data into ~~two groups: northern European countries, with mean latitude higher than 48° (*n*= 19) and southern European countries (*n*= 15).~~

This study assessed the diversity patterns of a large family of beetles, in Europe and tested the following hypotheses:

1)  richness gradients of this hyperdiverse taxon are driven by water and energy variables;

2)  endemism is explained by the same factors, but variation between areas also reflects post-glacial re-colonization processes; and

3)  faunal composition is determined by the same climatic variables and, therefore, beta diversity (species turnover) is related to richness gradients.

Species richness, endemism and beta diversity were modelled using inventories of 37 European territories, built from a database containing the distributions of 609 species.

Area, spatial position, and nine topographical and climatic variables were used as predictors in regression and constrained analysis of principal coordinates modelling.

From Baselga 2008 -\
The relationship between the aforementioned predictors and richness, endemism, and beta diversity of European Cerambycidae was assessed.

1)  Richness. Multiple relationships between species richness and the explanatory variables were analysed using regression modelling (Legendre and Legendre 1998) performed with Statistica 6.0 (StatSoft). Richness was log transformed to normalize model residuals. Linear, quadratic and cubic functions of the predictors were independently regressed against the response variable to determine significant relationships. Significant terms for each set (area, environment, and spatial variables) were selected by means of a backward stepwise procedure. Finally, variation partitioning among sets of predictors was used to quantify the relative importance of the pure effects of area (A), environment (E) and spatial variables (S), and their respective shared influences (Legendre and Legendre 1998). Such an approach allows non-independent explanatory variables to be dealt with, as it is explicitly designed to identify the portions of explained variability that are shared by different sets of variables and those that are independent (Borcard et al. 1992). Area is included as a covariable in order to control for the effect of differences in area among sampling units. Moreover, to confirm the robustness of the richness patterns regarding the variation in country area, a second analysis was performed using species density (Whittaker et al. 2001) as a dependent variable (computed as the fraction between the logarithm of richness and the logarithm of area). Since the number of cases is not high, the robustness of all A, E and S models was assessed by estimating the SE of all R2 and F values by means of bootstrap resampling performed with PopTools (Hood 2006).

2)  Endemism. A measure of the uniqueness of the fauna of each country was computed as the number of endemic species with a distribution range \<6×105 km2 (category IV by Lumaret and Lobo 1996). Since the available data notes the presence of a species in each country, the areas of all countries where a species was recorded were combined to estimate its distribution range. Scores of endemism were log transformed to normalize model residuals and regressed against the predictors following the same procedure as described for richness, including the use of density of endemics in a second analysis and the bootstrap analysis.

3)  Beta diversity. Faunal heterogeneity among countries was analyzed with the Simpson's index of beta diversity (βsim) and the resulting dissimilarity matrix was used to assess compositional differences due to its independence of species richness gradients (Koleff et al. 2003). Ordination of European countries was based on this faunal dissimilarity matrix, which was submitted to a nonparametric multidimensional scaling analysis (NMDS, Legendre and Legendre 1998) performed with Statistica 6.0 (StatSoft). The number of dimensions could not be selected using a scree-plot procedure, because stress values decreased gradually from 0.23 (two dimensions) to 0.09 (nine dimensions). Therefore, nine dimensions were extracted, using 0.1 as the cut-off point of acceptable stress. Axes scores for the 37 countries were submitted to a cluster analysis to identify the major groups of faunas. A dendrogram was drawn with Statistica 6.0, taking Euclidean distance as the measure of resemblance and average linkage procedure as the linkage rule. Significance of the faunal groups yielded by the cluster analysis was assessed by means of ANOSIM tests computed in R (R Development Core Team 2006) using the vegan package (Oksanen et al. 2007).

Thereafter, the variables determining the described patterns were explored. A constrained analysis of principal coordinates (CAP) was computed in R using the vegan package (Oksanen et al. 2007) to examine the relationship between variability in the table of species occurrences and the three sets of predictor variables. CAP was selected because it can be computed with any dissimilarity index with ecological significance and, therefore, βsim dissimilarity was preserved in the constrained ordination. Area, the nine aforementioned environmental variables, and spatial variables (the nine terms of a third degree polynomial of mean latitude and longitude; trend surface analysis, Legendre and Legendre 1998) were used as predictors to perform constrained ordinations yielding respectively A, E and S models. Since the order of inclusion in the model affects the significance computed by the permutation tests (vegan command permutest; Oksanen et al. 2007), the amount by which the explained variation was reduced due to the elimination of a single variable (compared with the complete model) was tested prior to the final analysis. This allowed the individual variables to be ranked in order of their independent contribution to the total variation in the response variable (from greatest to least), and the variables were included in the significance test in this order. Only significant variables were retained (p\<0.05) to avoid overfitting due to the inclusion of non-significant terms. Finally, to partition the variation among A, E and S sets of predictors, partial CAPs were performed, eliminating the effects of each variable (covariable) on the others, yielding estimates of pure effects (Borcard et al. 1992).
