---
title: "**Comparison of fungal analyses**"
subtitle: "Current KSU fungal analyses vs. Rudgers 2021"
author: "Kelli Feeser"
date: '2024-01-02'
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
    css: test.css
    number_sections: yes
    theme: cosmo
    toc: yes
    toc_depth: 3
editor_options:
  chunk_output_type: inline
---

**Previous manuscript**\
Rudgers, J.A., Fox, S., Porras‐Alfaro, A., Herrera, J., Reazin, C., Kent, D.R., Souza, L., Chung, Y.A., & Jumpponen, A. (2022). Biogeography of root‐associated fungi in foundation grasses of North American plains. Journal of Biogeography, 49(1), 22-37. doi/10.1111/jbi.14260\
<object data="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/JournalofBiogeography2021_Rudgers_BiogeographyOfRootAssociatedFungiInFoundationGrassesOfNorthAmericanPlains.pdf" type="application/pdf" width="100%" height="400px">

<p>Unable to display PDF file. <a href="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/JournalofBiogeography2021_Rudgers_BiogeographyOfRootAssociatedFungiInFoundationGrassesOfNorthAmericanPlains.pdf">Download</a> instead.</p>

</object>

\

# Set-up {.unlisted .unnumbered .hidden}





# Sequencing and OTU clustering results

\


<table class="table table-condensed">
 <thead>
  <tr>
   <th style="text-align:left;"> Sequencing Stats </th>
   <th style="text-align:center;"> Rudgers2021 </th>
   <th style="text-align:center;"> Current </th>
   <th style="text-align:right;"> Improvement (%) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> <span style="color: grey; font-weight: bold">Total Reads      </span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #71ca97">48,000,648</span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #def7e9">30,012,559</span> </td>
   <td style="text-align:right;"> <span style="font-weight: bold; color: #ff7f7f">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -37.47
</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="color: grey; font-weight: bold">Clean Reads      </span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #71ca97">20,716,515</span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #def7e9">18,230,837</span> </td>
   <td style="text-align:right;"> <span style="font-weight: bold; color: #ff7f7f">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -12
</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="color: grey; font-weight: bold">Mean Read Count  </span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #def7e9">30,376</span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #71ca97">42,571</span> </td>
   <td style="text-align:right;"> <span style="font-weight: bold; color: #71CA97">
  <i class="glyphicon glyphicon-arrow-up"></i>
  40.15
</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="color: grey; font-weight: bold">SD Read Count    </span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #def7e9">26,066</span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #71ca97">57,199</span> </td>
   <td style="text-align:right;"> <span style="font-weight: bold; color: #71CA97">
  <i class="glyphicon glyphicon-arrow-up"></i>
  119.44
</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="color: grey; font-weight: bold">Rarefaction Level</span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #def7e9">10,000</span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #71ca97">10,116</span> </td>
   <td style="text-align:right;"> <span style="font-weight: bold; color: #71CA97">
  <i class="glyphicon glyphicon-arrow-up"></i>
  1.16
</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <span style="color: grey; font-weight: bold">Fungal OTU Count </span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #71ca97">7,608</span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #def7e9">6,749</span> </td>
   <td style="text-align:right;"> <span style="font-weight: bold; color: #ff7f7f">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -11.29
</span> </td>
  </tr>
</tbody>
</table>

*Note*: I did further cleaning of the dataset reducing the number of clean reads to 5,149,044, however I am reporting the value that corresponds to the processing steps by Rudgers et al. Also, Rudgers 2021 included all EDGE samples for their analyses. I can go back and remove EDGE samples from their analyses to make this more comparable if need be.


<table class="table table-condensed">
 <thead>
  <tr>
   <th style="text-align:left;"> Sequencing Coverage </th>
   <th style="text-align:center;"> Rudgers2021 </th>
   <th style="text-align:center;"> Current </th>
   <th style="text-align:right;"> Improvement (%) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> <span style="color: grey; font-weight: bold">Good's Coverage (mean ± SD)</span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #def7e9">0.994 ± 0.003</span> </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #71ca97">0.997 ± 0.003</span> </td>
   <td style="text-align:right;"> <span style="font-weight: bold; color: #71CA97">
  <i class="glyphicon glyphicon-arrow-up"></i>
  0.3
</span> </td>
  </tr>
</tbody>
</table>



# Diversity analyses

\
\

**Diversity definitions**

-   Rudgers2021 used Mothur for calculating alpha diversity. Mothur differs from vegan in calculating some metrics, so I am explicitly defining the equations used by Rudgers2021 and these current analyses.\
    \
-   ***Species Richness*** (observed species)
    -   $S_{obs} = \sum_ix_i$
        -   $x_i$ is a numeric vector of species counts per sample
            -   Equivalents
                -   `estimate_richness()` R package `vegan 2.6-4` with `measures = "Observed"` (I used this)\
                    \
-   ***Simpson*** (unbiased estimate of dominance index)
    -   $D_{simpson} = \sum_ip^2_i$, where $p_i$ is the species proportion and $N$ is the total number of counts (i.e., the rarefaction depth - 10,116 sequences/sample in our data)
        -   $p_i = x_i(x_i - 1)/(N(N - 1))$
        -   Approximate equivalents (these use a different calculation for $p_i$ ($p_i = x_i/N$))
            -   `simpson` calculator in Mothur
            -   `dominance()` in `skbio.diversity.alpha`
            -   `dominance()` in R package `abdiv 0.2.0`
            -   1 - `diversity()` in R package `vegan 2.6-4` with `index = "simpson"`
            -   1 - `estimate_richness()` R package `vegan 2.6-4` with `measures = "Simpson"` (I used this)\
                \
-   ***Inverse Simpson*** (the probability of selecting two individuals from different species, with replacement, using an unbiased estimate of dominance index)
    -   Notably, this is defined as $1 - D_{simpson}$, [*not*]{style="color:red"} $1/D_{simpson}$
        -   Approximate equivalents
            -   `?` calculator in Mothur
            -   `simpson()` in `skbio.diversity.alpha`
            -   `simpson()` in R package `abdiv 0.2.0`
            -   `diversity()` in R package `vegan 2.6-4` with `index = "simpson"`
            -   `estimate_richness()` R package `vegan 2.6-4` with `measures = "Simpson"` (I used this)\
                \
-   ***Simpson evenness*** (inverse Simpson index divided by the theoretical maximum diversity)
    -   $E_{simpson} = 1 / (D_{simpson}*S_{obs})$
        -   The logic is that in a perfectly even community (all OTUs are present in equal ratios), the $D_{simpson}$ would just be $1/(S_{obs})$ so any deviation in the observed $D_{simpson}$ from this value is the result of uneveness.
        -   Approximate equivalents
            -   `simpsoneven` calculator in Mothur
            -   `simpson_e()` in skbio.diversity.alpha
            -   `simpson_e()` in R package `abdiv 0.2.0`
            -   Derived from $D_{simpson}$ (using `diversity()` in R package `vegan 2.6-4` with `index = "simpson"` or `estimate_richness()` in R package `vegan 2.6-4` with `measures = "Simpson"`).
                -   I used the latter, then applied the above equation ($E_{simpson} = 1 /(D_{simpson}*S_{obs})$)\
                    \
-   ***Shannon***
    -   $H_{shannon} = -\sum\limits_ip_i log p_i$, where $p_i$ is the species proportion
        -   $p_i = x_i(x_i - 1)/(N(N - 1))$
        -   Equivalents
            -   `shannon` calculator in Mothur
            -   `shannon()` in `skbio.diversity.alpha`
            -   `shannon()` in R package `abdiv 0.2.0` (I used this)
            -   `diversity()` in R package `vegan 2.6-4` with `index = "shannon"`
            -   `estimate_richness()` R package `vegan 2.6-4` with `measures = "Shannon"` (I used this)\
                \
-   ***Shannon evenness*** (Shannon index divided by the theoretical maximum diversity, aka Pielou's Evenness index)
    -   $E_{shannon} = H_{shannon}/ln(S_{obs})$
        -   Equivalents
            -   `shannoneven` calculator in Mothur
            -   `peilou_e()` in `skbio.diversity.alpha`
            -   `pielou_e()` in R package `abdiv 0.2.0` (I used this)
            -   Derived from $H_{shannon}$ (using `diversity()` in R package `vegan 2.6-4` with `index = "shannon"` or `estimate_richness()` in R package `vegan 2.6-4` with `measures = "Shannon"`) (I used the latter)
                -   In R, $E_{shannon} = H_{shannon}/log(S_{obs})$
                    -   note that in R, `log` is the natural logarithm, the typical base 10 logarithm is invoked with `log10`\
                        \
-   ***Boneh*** (Boneh estimate of the number of additional OTUs that would be observed for an additional level of sampling)
    -   [skipping for now...]\
        \
        \





------------------------------------------------------------------------

## Analysis (1) Does the diversity, composition or abundance of root-associated fungi vary with latitude and are latitudinal gradients similar across host plant species?

\
**GLM -** General linear mixed-effects models

-   Responses
    -   diversity ($1 - D_{simpson}$; "inverse Simpson" per Rudgers 2021)
    -   richness ($S_{obs}$; species richness)
    -   evenness ($E_{simpson} = 1 / (D_{simpson}*S_{obs})$; Simpson's evenness)
    -   root colonisation (fungal abundance in host tissue)
-   Predictors
    -   latitude
    -   plant species identity
    -   the species × latitude interaction.
-   Models included the random effects of east-west gradient identity and site nested within gradient (Table S1)
-   Secondary analysis
    -   Significant grass species ×latitude interactions were decomposed via secondary analysis for each grass species.
-   Other notes
    -   The model for B. eriopoda, which occurred only on the western gradient, lacked the gradient random effect. We chose the best linear or quadratic model for latitude using the second-order Akaike's Information Criterion (AICc). Analyses met assumptions of normality of residuals and homogeneity of variances following square-root transformation of evenness and log-transformation of root colonisation.
-   Cite: using the lmer function in <lme4> (Bates et al., 2015; R Core Team, 2020). \










### Results

Latitudinal gradients in fungal diversity and composition differed
among grass species (Latitude × Species, Table 1). 

The expected linear poleward decline in **diversity** occurred only in *A. gerardii*
(Figure 2a (below), Table 1). \

![Figure 2a](../processed_data/Rudgers2021/comparison_figs/Fig2a.png){width="80%" height="80%"}


In *B. dactyloides*, fungal OTU richness peaked at the highest and lowest latitudes (Figure 2b, Table 1, quadratic), and fungal evenness had a similar latitudinal “U” pattern in *B. gracilis* (Figure 2i). \

![Figure 2b](../processed_data/Rudgers2021/comparison_figs/Fig2b.png){width="80%" height="80%"}
![Figure 2i](../processed_data/Rudgers2021/comparison_figs/Fig2i.png){width="80%" height="80%"}
\


Conversely, evenness peaked at mid-latitudes in
both *B. dactyloides* (Figure 2g) and *B. eriopoda* (Figure 2h). 

[TBD]

Only *B. dactyloides* had a latitudinal trend in root colonisation, with
greater colonisation of roots for plants at high latitudes (Figure 2l;
Table 1, p = 0.0853).

[TBD]

------------------------------------------------------------------------


\
\

# Figures

## NMDS by Grass Host (Figure 1B) {.unnumbered}

\



![](../figures/Rudgers2021_comparison/fig1b_comparison.png){width="80%" height="64%"}

*Note:* Rudgers 2021 reports a stress of 0.26 (for *k* = 3) which I would strongly consider to be too high (guidelines: \>0.2 is poor (risks for false interpretation), 0.1 - 0.2 is fair (some distances can be misleading for interpretation), 0.05 - 0.1 is good (can be confident in inferences from plot), and \<0.05 is excellent (this can be rare)). I created this ordination with a higher *k* value of 5 and resulting stress of 0.11.\
\
\
\

## Relationships between fungal OTU richness against latitude for each of five grass species (Figure 2) {.unnumbered}

\
\

TBD\
\
\