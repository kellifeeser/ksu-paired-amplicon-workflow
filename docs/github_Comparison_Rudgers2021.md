---
title: "**Comparison of fungal analyses**"
subtitle: "Current KSU fungal analyses vs. Rudgers 2021"
author: "Kelli Feeser"
date: '2024-01-02'
output:
  bookdown::html_document2:
    code_folding: hide
    df_print: kable
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
    fig.caption: yes
    keep_md: yes
  html_notebook:
    code_folding: hide
    df_print: kable
    css: test.css
    number_sections: yes
    theme: cosmo
    toc: yes
    toc_depth: 4
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

------------------------------------------------------------------------

\

# Diversity & composition analyses

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
                        \









------------------------------------------------------------------------

## Analysis (1) Does the diversity, composition or abundance of root-associated fungi vary with latitude and are latitudinal gradients similar across host plant species?

### Methods: GLMs

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
-   Cite: using the lmer function in <lme4> (Bates et al., 2015; R Core Team, 2020).\
    \
    \











------------------------------------------------------------------------

### Results: diversity \~ latitude (GLM)

\*Diversity = species richness and evenness\

Latitudinal gradients in fungal diversity and composition differed among grass species (Latitude × Species, Table 1).\

-   [Linear poleward decline]{.underline}

The expected linear poleward decline in **richness** occurred only in *A. gerardii* (Figure 2a (below), Table 1).\

![**Figure 2a.**](../processed_data/Rudgers2021/comparison_figs/Fig2a.png){width="80%"}

\

-   [Latitudinal "U" pattern]{.underline}

In *B. dactyloides*, fungal OTU **richness** peaked at the highest and lowest latitudes (Figure 2b, Table 1, quadratic), and fungal **evenness** had a similar latitudinal "U" pattern in *B. gracilis* (Figure 2i).\

![**Figure 2b.**](../processed_data/Rudgers2021/comparison_figs/Fig2b.png){width="80%" height="80%"}

![**Figure 2i.**](../processed_data/Rudgers2021/comparison_figs/Fig2i.png){width="80%"}

\

-   [Latitudinal inverse "U" pattern]{.underline}

Conversely, evenness peaked at mid-latitudes in both *B. dactyloides* (Figure 2g) and *B. eriopoda* (Figure 2h).\

![**Figure 2g.**](../processed_data/Rudgers2021/comparison_figs/Fig2g.png){width="80%"}

![**Figure 2h.**](../processed_data/Rudgers2021/comparison_figs/Fig2h.png){width="80%" height="80%"}

[*Note for Figure 2h (B. eriopoda evenness):* We have an additional site vs Rudger2021, but I'm not sure why. The site is Central Plains Experimental Range (CPR) at 40.81553 latitude. Conversely we are also missing a site that they had - Gile National Forest (GNF) at 31.95908 latitude. We have this site covered in other grass host species? We both have the same number of *B. eriopoda* samples (n=78). Not sure what's going on here... maybe an EDGE site?]{style="color: darkred;"}

------------------------------------------------------------------------

\

### Results: composition \~ latitude (permANOVA)

"We [Rudgers2021] tested for latitudinal gradients in fungal composition using perMANOVA in Primer v. 6.1.10 on the Bray-Curtis distance from the matrix of rarefied proportional abundances of each fungal OTU (Clarke & Gorley, 2015). We binned sites into categories (North, North-Central, South-Central, or South, Table S1) to overcome the perMANOVA restriction to categorical variables. Models included latitude, grass species identity, species × latitude and the random effects of east-west gradient and site nested in gradient. We then ran distance-based linear models (DIST-LM) for each grass species individually using latitude as a continuous rather than categorical variable (Clarke & Gorley, 2015)."

Note: I did this in R, not Primer

Fungal composition varied with latitude across all grasses combined (Table 1, Latitude p = 0.0218, Table S3), although latitude did not explain a large fraction of the variation in fungal communities within individual grass species (Figure 3, $R^2$ = 0.03 -- 0.09).



permANOVA/`vegan::adonis2(phyloseq::distance(Fun, method="bray") ~ Grass*Bin+I(Latitude^2)+I(Latitude^2)*Grass, data = (as(sample_data(Fun), "data.frame")))`

|                                  |  **Rudger2021: Fungal**  |     **Current: Fungal**     |   **Current: Bacterial**    |
|------------------|:----------------:|:----------------:|:----------------:|
| [*all host species*]{.underline} | F-value \| \* \| p-value | F-value \| $R^2$ \| p-value | F-value \| $R^2$ \| p-value |
| host species                     |    3.98 \| \| 0.0001     | 10.06 \| 0.064 \| \< 0.001  | 24.73 \| 0.132 \| \< 0.001  |
| latitude                         |    1.91 \| \| 0.0218     | 11.50 \| 0.055 \| \< 0.001  | 12.72 \| 0.051 \| \< 0.001  |
| latitude^2^                      |            ns            | 10.58 \| 0.017 \| \< 0.001  | 24.20 \| 0.032 \| \< 0.001  |
| latitude x host species          |     1.68 \| \| 0.001     |  3.59 \| 0.069 \| \< 0.001  |  5.20 \| 0.083 \| \< 0.001  |
| latitude^2^ x host species       |            ns            |  3.08 \| 0.020 \| \< 0.001  |  4.07 \| 0.022 \| \< 0.001  |

: **Table 1i.** Statistical results of mixed-effects models examining the effects of latitude on the root-associated fungi of grass species together. Analyses of composition (perMANOVA, pseudo-F). \*Note: Rudgers2021 didn't calculate $R^2$ values.

------------------------------------------------------------------------

\

### Results: root colonization \~ latitude (GLM)

\*root colonization = fungal abundance in host tissue

Only *B. dactyloides* had a latitudinal trend in root colonization, with greater colonization of roots for plants at high latitudes (Figure 2l; Table 1, p = 0.0853).

[Analysis not re-done]

------------------------------------------------------------------------

------------------------------------------------------------------------

\
\

## Analysis (2) Does the composition of non-mycorrhizal root-associated fungi converge near host range edges?

"We used permDISP to examine divergence among individual plants in fungal composition (Clarke & Gorley, 2015) and to test the hypothesis that fungal composition was more homogenous among plants nearing the hosts' latitudinal range edge."

### Methods: beta dispersion \~ latitude (betadisper)

"Models for each host grass compared dispersion among latitudinal categories (North, North-Central, South-Central or South), each containing similar numbers of samples (Table S1)"\
\
- Details: We measured the multivariate dispersion (variance) for the groups of samples by calculating the average distance of group members to the group centroid ~~or spatial median~~ (aka the 'centroid') in multivariate space. (kf)\

```         
Fun_bray<-phyloseq::distance(Fun, method="bray")

vegan::betadisper(Fun_bray, group = sd_Fun$Latitudinal_Bin,
                            type = "centroid",      # I can't figure out if they used median or centroid for type of analysis to perform: either adjust groups relative to their spatial median or to the group centroid
                            bias.adjust = FALSE,    # guessing the default here ("logical: adjust for small sample bias in beta diversity estimates?")
                            sqrt.dist = FALSE,      # and here ("Take square root of dissimilarities. This often euclidifies dissimilarities.")
                            add = FALSE             # and here
                            )

# type = "centroid" (distance from each sample unit to the centroid of its group)
```

**Significance testing**\
- Do the dispersions of communities vary among latitudinal bins?\
- Multivariate homogeneity of groups dispersions (variances)\
- To test if the dispersions (variances) of one or more groups differed, the distances of group members to the group centroid were subject to ANOVA. This is a multivariate analogue of Levene's test for homogeneity of variances (but instead resorting to Euclidean distances for community data, I/we used Bray-Curtis distance matrices)\
\
[Details]{.underline}\
- To test if one or more groups is more variable than the others, ANOVA of the distances to group centroids can be performed and parametric theory used to interpret the significance of $F$. An alternative is to use a permutation test. [`permutest.betadisper`](http://127.0.0.1:32033/help/library/vegan/help/permutest.betadisper) permutes model residuals to generate a permutation distribution of F under the Null hypothesis of no difference in dispersion between groups.\
- Re: the flag `bias.adjust`:

> As noted in passing by Anderson (2006) and in a related context by O'Neill (2000), estimates of dispersion around a central location (median or centroid) that is calculated from the same data will be biased downward. This bias matters most when comparing diversity among treatments with small, unequal numbers of samples. Setting `bias.adjust=TRUE` when using `betadisper` imposes a $\sqrt{n/(n−1)}$​ correction (Stier et al. 2013).

\- Pairwise comparisons of group mean dispersions can also be performed using [`permutest.betadisper`](http://127.0.0.1:32033/help/library/vegan/help/permutest.betadisper). An alternative to the classical comparison of group dispersions, is to calculate Tukey's Honest Significant Differences between groups, via `TukeyHSD.betadisper`. (Use with caution if function has unbalanced design.)

```         
## Permutation test for F

vegan::permutest(bray_betadisper_Fun_current, pairwise = TRUE, permutations = 99)

  # Permutation test for homogeneity of multivariate dispersions
  # Permutation: free
  # Number of permutations: 99

  # Response: Distances
```



### Results: beta dispersion \~ latitude (betadisper)

All host grass species had significant latitudinal gradients in dispersion, or turn-over, in fungal composition (Table 1, p \< 0.0001). Dispersion was smallest at sites near grass species' range edges (Figure 3, Figure S1, Table S3). In the desert grass *B. eriopoda*, dispersion decreased northward towards its northern range edge (Figure 3c), whereas other species were sampled approaching their southern range limits, where fungal communities became more similar among host individuals. Among the grasses, *S. scoparium* had the greatest dispersion across all sites and samples (Figure 3e, Table 1, Species p = 0.0024), even though *B. gracilis* was sampled at the most sites (Figure 1a, Table S1).\
\

|                                  | **Rudger2021: Fungal** |   **Current: Fungal**    | **Current: Bacterial** |
|------------------|:----------------:|:----------------:|:----------------:|
| [*all host species*]{.underline} |                        | Av. distance to centroid |                        |
| North                            |                        |          0.649           |         0.4580         |
| North Central                    |                        |          0.572           |         0.4999         |
| South Central                    |                        |          0.658           |         0.5291         |
| South                            |                        |          0.550           |         0.4939         |
|                                  |                        |                          |                        |

: **Table 1ii.** Statistical results of mixed-effects models examining the effects of latitude on the root-associated fungi of grass species together. Analyses of dispersion (permDISP for Rudgers2021).

**Permutation test for homogeneity of multivariate dispersions**

**Current: Fungal\
** Response: Distances\
                          Df   SumSq   MeanSq               F   N.Perm   Pr(\>F)\
Lat. Bin            3   1.1552   0.38507       48.759           99     0.01 \*\*\
Residuals   505   3.9882   0.00790\
- - -\
Signif. codes: 0 '\*\*\*' 0.001 '*\*' 0.01 '*' 0.05 '.' 0.1 ' ' 1

        Calculated $R^2$ for regression: 0.225

*Pairwise comparisons:*\
(Observed p-value below diagonal, permuted p-value above diagonal)

|                   |   North    | North Central | South Central | South |
|------------------:|:----------:|:-------------:|:-------------:|:-----:|
|         **North** |            |     0.001     |     0.008     | 0.01  |
| **North Central** | 1.5244e-14 |               |     0.001     | 0.19  |
| **South Central** |   0.005    |  9.5364e-17   |               | 0.01  |
|         **South** | 9.4955e-15 |    0.0161     |  4.1209e-16   |       |

\

**Current: Bacterial\
** Response: Distances\
                          Df   SumSq   MeanSq                   F   N.Perm   Pr(\>F)\
Lat. Bin            3   0.36658   0.122194       32.425           99     0.01 \*\*\
Residuals   529   1.99353   0.003768\
- - -\
Signif. codes: 0 '\*\*\*' 0.001 '*\*' 0.01 '*' 0.05 '.' 0.1 ' ' 1

        Calculated $R^2$ for regression: 0.155

*Pairwise comparisons:*\
(Observed p-value below diagonal, permuted p-value above diagonal)

|                   |   North    | North Central | South Central | South |
|------------------:|:----------:|:-------------:|:-------------:|:-----:|
|         **North** |            |     0.001     |     0.001     | 0.01  |
| **North Central** | 2.5536e-08 |               |     0.001     | 0.39  |
| **South Central** | 2.0902e-17 |  2.4435e-04   |               | 0.01  |
|         **South** | 1.5022e-06 |     0.040     |  8.7131e-06   |       |

\
\

------------------------------------------------------------------------

------------------------------------------------------------------------

\
\

## Analysis (3) What is the relative importance of climate, edaphic factors, or host traits as predictors of root-associated fungal community structure?

\

### Methods: GDMs

**GDMs -** Generalized dissimilarity models of tabular site-pair data

We examined environmental correlates of root-associated fungal community structure for each grass species. For fungal composition, we calculated the site average for the rarefied proportional abundance of each fungal OTU to build Generalized Dissimilarity Models (GDM) (e.g. Glassman et al., 2017) that account for spatial non-independence among sites using latitude and longitude coordinates.

GDMs examine how species turnover increases with spatial distance among sites, and their I-splines describe nonlinear relationships between fungal composition and environmental variables.

-   This approach is particularly important because the same unit increase in, for example, soil moisture may matter more in dry sites than wet sites, producing a nonlinear relationship to fungal composition.

-   Each GDM included 3 climatic variables (annual precipitation, growing degree days and soil gravimetric water content), 3 edaphic variables (soil pH, ammonium and total phosphorus) and 3 plant traits (SLA, SRL and folivory) to give equal weight to each category of predictor.

-   We eliminated multicollinearity by removing correlated predictors, retaining ammonium over nitrate and soil pH over SOM based on initial univariate analyses.

-   All predictors were scaled to mean = 0 and SD = 1.

-   We obtained p-values for best models via backward selection in gdm.varImp (Ferrier et al., 2007).

> basic GDM code:
>
> ```         
>   all_gdm <- formatsitepair(otu_gdm,1, dist="bray", abundance=TRUE, siteColumn="sample", XColumn="longitude", YColumn="latitude", predData=env_gdm, weightType="equal") 
>   m.all <- gdm(all_gdm,geo=TRUE) 
>   
>   ## get splines for best model (P<0.05) modall
>   gdm.varImp(all_gdm,geo=TRUE,parallel=TRUE,nPerm=100)
> ```

------------------------------------------------------------------------

\

### Results: composition \~ latitude (GDMs)

Grass species differed in the relative importance of environmental predictors of root fungal composition (Figure 4).

"A complex set of climatic, edaphic and plant trait variables" explained 17% of variability in fungal composition across grass species together (Figure 4a, p = 0.02) and 9-65% of variation in composition for individual grass species (Figure 4b-f).

|                            | **Rudger2021: Fungal** | **Current: Fungal** | **Current: Fungal** |
|-------------------|:----------------:|:----------------:|:----------------:|
| GDM $R^2$ - all species    |         16.95%         |                     |                     |
| #1 predictor - all species |        soil pH         |                     |                     |
|                            |                        |                     |                     |

![**Figure 4a.** *I*-splines from the best model among generalised dissimilarity models (GDM) comparing climatic factors (blue colours), edaphic factors (brown colours), or plant traits (green colours) as predictors of root-associated fungal composition. The proportion of deviance explained by each best model is given in the upper left corner of each plot for statistically significant models. All species combined are shown in (a)](../processed_data/Rudgers2021/comparison_figs/Fig4a.png){width="65%"}

-   In every grass host species, fungal composition was most sensitive to soil pH at values that occurred below the mean pH (nonlinearity).

-   The degree of nonlinearity in the *I*-splines was greatest for plant trait-related variables, indicating that the sensitivity of fungal composition varied with average values of these traits.

-   Traits with nonlinearity in *I*-splines:

    -   pH (combined hosts, and all individual hosts except for *A. gerardii*)

    -   precipitation (combined hosts, and some individual hosts)

    -   specific leaf area (some hosts)

    -   herbivory (combined hosts, and some individual hosts)\


|GDM summary                                     |         Rudgers2021: Fungal         | Current: Fungal  | Current: Bacterial |Term explaination                                                                                                                                             |
|:-----------------------------------------------|:-----------------------------------:|:----------------:|:------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Data subset                                     |          all host species           | all host species |         NA         |                                                                                                                                                              |
|nsamples                                        |                1596                 |        NA        |         NA         |number of pairwise site comparisons                                                                                                                           |
|Geographical distance used in model fitting?    |                TRUE                 |       TRUE       |         NA         |if TRUE, geographic distance between sites is included as a model term                                                                                        |
|NULL Deviance                                   |               119.71                |        NA        |         NA         |the deviance of the null model                                                                                                                                |
|GDM Deviance                                    |               99.414                |        NA        |         NA         |the deviance of the fitted GDM model                                                                                                                          |
|Percent Deviance Explained                      |               16.954                |        NA        |         NA         |the percentage of null deviance explained by the fitted GDM model                                                                                             |
|Model p-value                                   |                0.01                 |   not run yet    |         NA         |p-values for best models via backward
selection in gdm.varImp()                                                                                                |
|Predictor Order by Sum of I-Spline Coefficients |                  -                  |        -         |         -          |predictors that were used to fit the model, in order of the amount of turnover associated with each predictor (based on the sum of the I-spline coefficients) |
|Predictor 1 (Sum of Coefficients for P1)        |         Edaphic: pH (0.472)         |        NA        |         NA         |category: predictor (sum of I-spline coefficients for predictor)                                                                                              |
|Predictor 2 (Sum of Coefficients for P2)        |      Geographic coords (0.461)      |        NA        |         NA         |                                                                                                                                                              |
|Predictor 3 (Sum of Coefficients for P3)        |      Plant: Herbivory (0.416)       |        NA        |         NA         |                                                                                                                                                              |
|Predictor 4 (Sum of Coefficients for P4)        |   Climatic: Precipitation (0.329)   |        NA        |         NA         |                                                                                                                                                              |
|Predictor 5 (Sum of Coefficients for P5)        |      Edaphic: Ammonium (0.21)       |        NA        |         NA         |                                                                                                                                                              |
|Predictor 6 (Sum of Coefficients for P6)        |  Plant: Specific Leaf Area (0.182)  |        NA        |         NA         |                                                                                                                                                              |
|Predictor 7 (Sum of Coefficients for P7)        | Plant: Specific Root Length (0.009) |        NA        |         NA         |                                                                                                                                                              |
|Predictor 8 (Sum of Coefficients for P8)        |     Climatic: Degree Days (ns)      |        NA        |         NA         |if (ns), predictor was removed from model via backwards selection                                                                                             |
|Predictor 9 (Sum of Coefficients for P9)        |  Climatic: Gravimetric Water (ns)   |        NA        |         NA         |                                                                                                                                                              |
|Predictor 10 (Sum of Coefficients for P10)      |      Edaphic: Phosphorus (ns)       |        NA        |         NA         |                                                                                                                                                              |
|Predictor 11 (Sum of Coefficients for P11)      |           Elevation (ns)            |        NA        |         NA         |                                                                                                                                                              |

------------------------------------------------------------------------

------------------------------------------------------------------------

\
\

# Figures

## NMDS by Grass Host (Figure 1B) {.unnumbered}

\



![**Figure 1b** Rudgers2021 and current fungal. NMDS plots showing variation in the composition of root-associated fungi for five grass species: Species pseudo-F = 4.0, p \< 0.0001, 2-dimensional stress = 0.26 due to strong differences in fungal composition among species. Symbols show the NMDS centroid ± bidirectional SE. Samples were pooled within sites, then SE. calculated across sites for each plant species.](../figures/Rudgers2021_comparison/fig1b_comparison.png){width="80%"}

*Note:* Rudgers2021 reports a stress of 0.26 (for *k* = 3) which I would strongly consider to be too high (guidelines: \>0.2 is poor (risks for false interpretation), 0.1 - 0.2 is fair (some distances can be misleading for interpretation), 0.05 - 0.1 is good (can be confident in inferences from plot), and \<0.05 is excellent (this can be rare)). I created this ordination with a higher *k* value of 5 and resulting stress of 0.11.\
\
\
\

## Relationships between fungal OTU richness against latitude for each of five grass species (Figure 2) {.unnumbered}

\
\



![**Figure 2.** Relationships between fungal OTU richness (a-e), evenness, as square-root of the inverse Simpson evenness, E (f-j) against latitude for each of five grass species: *Andropogon gerardii*, *Bouteloua dactyloides*, *B. eriopoda*, *B. gracilis* and ~~*Schizachyrium scoparium*~~ (note: omitted). *p* values for significant (p \< 0.05) trends in latitude are from a mixed effects general linear model for each grass species. Full statistical results are in Table 1. Samples were pooled within sites, then SE calculated across sites.](../processed_data/Rudgers2021/comparison_figs/Fig2.png){width="80%"}

\
\
