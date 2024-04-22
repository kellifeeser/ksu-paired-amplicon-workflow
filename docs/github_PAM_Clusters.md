---
title: '**KSU paired amplicons: PAM Clustering**'
author: "Kelli Feeser"
date: "2024-04-10"
output:
  bookdown::html_document2:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 3
    fig.caption: yes
    keep_md: yes
  html_document:
    toc: yes
    toc_depth: '3'
    df_print: paged
  html_notebook:
    code_folding: hide
    df_print: paged
    number_sections: yes
    toc: yes
    toc_depth: 3
    css: styles.css
    fig.caption: yes
  prettydoc::html_pretty:
    toc: yes
    fig.caption: yes
editor_options:
  chunk_output_type: inline
---

\

::: homelink
<a href="https://kellifeeser.github.io/ksu-paired-amplicon-workflow/index.html" target="_blank" style="text-align:right">Back to Home</a>
:::



# Set-up {.unlisted .unnumbered .hidden}



## load phylo, ord, pam res









\

# More in-depth: PAM clustering based on Sørensen-distance matrices

\

[Background]{.underline}

Microbiome sample clustering can be performed using either model-based methods and machine learning methods. Machine learning methods, which rely on defined distance metrics, are used more frequently than model-based statistical methods ("due to their efficient implementation and easy interpretation.")\
- I used the **partition around medoids (PAM)** clustering method, which is related to but considered more robust than K-means. In contrast to K-means, which can be sensitive to the effects of outliers, PAM's optimization goal is to minimize the sum of distances to the medoids instead of minimizing the sum of the squared distances to the cluster centers.\
\

***Note: clustering was performed directly on distance matrices,** not **ordinations or ordination scores! This was done to eliminate the introduction of artifacts arising from clustering ordination scores.***\

## Clustering evaluation: Gap Statistic {.tabset .tabset-pills}

\
[Methods]{.underline}

Partitioning methods, such as PAM clustering require the number of clusters to be generated as an input value. Here we are viewing the gap statistic as calculated by the function `cluster::clusGap`(). The optimal number of clusters was specified using the "Tibs2001SEmax" method, Tibshirani et al's recommendation of determining the number of clusters from the gap statistics and their standard deviations.

`clusGap()` calculates a goodness of clustering measure, the "gap" statistic. For each number of clusters $k$, it compares $log(W(k))$ with $E∗[log(W(k))]$ where the latter is defined via bootstrapping, i.e., simulating from a reference ($H_0$) distribution, a uniform distribution on the hypercube determined by the ranges of `x`, after first centering, and then [`svd`](http://127.0.0.1:39411/help/library/cluster/help/svd) (aka 'PCA')-rotating them when (as by default) `spaceH0 = "scaledPCA"`.

~~`maxSE(f, SE.f)` determines the location of the **maximum** of `f`, taking a "1-SE rule" into account for the `*SE*` methods. The default method `"firstSEmax"` looks for the smallest~~ $k$ such that its value $f(k)$ is not more than 1 standard error away from the first local maximum. This is similar but not the same as `"Tibs2001SEmax"`, Tibshirani et al's recommendation of determining the number of clusters from the gap statistics and their standard deviations.\

References\
Tibshirani, R., Walther, G. and Hastie, T. (2001). Estimating the number of data clusters via the Gap statistic. Journal of the Royal Statistical Society B, 63, 411--423.\

Tibshirani, R., Walther, G. and Hastie, T. (2000). Estimating the number of clusters in a dataset via the Gap statistic. Technical Report. Stanford.\

Dudoit, S. and Fridlyand, J. (2002) A prediction-based resampling method for estimating the number of clusters in a dataset. Genome Biology 3(7). [[doi:10.1186/gb-2002-3-7-research0036\\\\](doi:10.1186/gb-2002-3-7-research0036\\){.uri}]([doi:10.1186/gb-2002-3-7-research0036\\](doi:10.1186/gb-2002-3-7-research0036\){.uri}){.uri}

Per Broberg (2006). SAGx: Statistical Analysis of the GeneChip. R package version 1.9.7. <https://bioconductor.org/packages/3.12/bioc/html/SAGx.html> Deprecated and removed from Bioc ca. 2022\
\

### Fun {.unnumbered}

\
We found the optimal number of clusters for the Sørensen-based dissimilarities of the fungal communities to be 10.\

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_PAM_Clusters_files/figure-html/plot_gs_Fun-1.png" height="70%" />

\
\

------------------------------------------------------------------------

### Bac {.unnumbered}

\
We found the optimal number of clusters for the Sørensen-based dissimilarities of the bacterial communities to be 14.\

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_PAM_Clusters_files/figure-html/plot_gs_Bac-1.png" width="20%" />

\
\

------------------------------------------------------------------------

## View clustering results overlaid onto NMDS plots

\

### Sørensen-based clusters {.unnumbered .unlisted .tabset .tabset-pills}

\

#### Fun {.unnumbered .tabset}

Note the density of cluster 1 (now F1) - I'll investigate that further below. Fungal clusters have now been relabeled in an intuitive order based on decreasing similiarities to F1.\



<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_PAM_Clusters_files/figure-html/unnamed-chunk-1-1.png" height="90%" />

\

##### All samples {.unnumbered .unlisted}

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_PAM_Clusters_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

\

##### Facet by Lat {.unnumbered .unlisted}

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_PAM_Clusters_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

\

##### Facet by Long {.unnumbered .unlisted}

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_PAM_Clusters_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

\

##### Facet by Cluster, color Site {.unnumbered .unlisted}

We do see clusters with only 1 site and others with multiple sites.\

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_PAM_Clusters_files/figure-html/unnamed-chunk-5-1.png" width="60%" />

\
\

------------------------------------------------------------------------

#  {.unnumbered .unlisted}

------------------------------------------------------------------------

# adonis2(. \~ metadata, strata = clusters)

\

## Explanatory power of cluster designations {.tabset .tabset-pills}



\

### Fun {.unnumbered .unlisted}

\


                    Df     SumOfSqs     R2       F      Pr(>F) 
-----------------  -----  ----------  ------  -------  --------
Fun_sor_clusters     9       56.9      0.34    27.12    0.001  
Residual            474     110.5      0.66     NA        NA   
Total               483     167.4      1.00     NA        NA   

Across the whole dataset, the fungal clustering explained 33.99% of the community variability (presence/absence).\
\
\

### Bac {.unnumbered .unlisted}

\
TBD


Across the whole dataset, the bacterial clustering explained 
~~33.99%~~ of the community 
variability (presence/absence).\
\
\

## Explanatory power of metadata within clusters {.tabset .tabset-pills}

\

### Fun {.unnumbered .unlisted .tabset}

\
Note that in fungal cluster "F2" there were only 10 samples (all site=SFA, grass=SCSC), and because enviromental data was measured on a pooled site-by-grass bases, no underlying variability exists to perform stats on.\



\

#### whole community {.unnumbered .unlisted}

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:600px; overflow-x: scroll; width:80%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-8)adonis2 outputs for single-term models</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Df </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> SumOfSqs </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> R2 </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> F </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Pr(&gt;F) </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> comm </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> expl_var </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="5"><td colspan="8" style="border-bottom: 1px solid;"><strong>Edaphic</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wholecommunity.pH_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 5.766 </td>
   <td style="text-align:right;"> 0.034 </td>
   <td style="text-align:right;"> 17.188 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wholecommunity </td>
   <td style="text-align:left;"> pH </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wholecommunity.soil_moisture_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 5.695 </td>
   <td style="text-align:right;"> 0.034 </td>
   <td style="text-align:right;"> 16.969 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wholecommunity </td>
   <td style="text-align:left;"> soil_moisture </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wholecommunity.SOM_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 6.082 </td>
   <td style="text-align:right;"> 0.036 </td>
   <td style="text-align:right;"> 18.167 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wholecommunity </td>
   <td style="text-align:left;"> SOM </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wholecommunity.ammonium_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 6.447 </td>
   <td style="text-align:right;"> 0.039 </td>
   <td style="text-align:right;"> 19.303 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wholecommunity </td>
   <td style="text-align:left;"> ammonium </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wholecommunity.phos_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 6.227 </td>
   <td style="text-align:right;"> 0.037 </td>
   <td style="text-align:right;"> 18.616 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wholecommunity </td>
   <td style="text-align:left;"> phos </td>
  </tr>
  <tr grouplength="2"><td colspan="8" style="border-bottom: 1px solid;"><strong>Climate</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wholecommunity.ppt3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 6.046 </td>
   <td style="text-align:right;"> 0.036 </td>
   <td style="text-align:right;"> 18.057 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wholecommunity </td>
   <td style="text-align:left;"> ppt3yr </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wholecommunity.GDD3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2.574 </td>
   <td style="text-align:right;"> 0.015 </td>
   <td style="text-align:right;"> 7.526 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wholecommunity </td>
   <td style="text-align:left;"> GDD3yr </td>
  </tr>
  <tr grouplength="3"><td colspan="8" style="border-bottom: 1px solid;"><strong>Plant</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wholecommunity.avg_SRL_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.847 </td>
   <td style="text-align:right;"> 0.011 </td>
   <td style="text-align:right;"> 5.375 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wholecommunity </td>
   <td style="text-align:left;"> avg_SRL </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wholecommunity.avg_SLA_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3.154 </td>
   <td style="text-align:right;"> 0.019 </td>
   <td style="text-align:right;"> 9.253 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wholecommunity </td>
   <td style="text-align:left;"> avg_SLA </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wholecommunity.herbivory_perc_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2.380 </td>
   <td style="text-align:right;"> 0.014 </td>
   <td style="text-align:right;"> 6.949 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wholecommunity </td>
   <td style="text-align:left;"> herbivory_perc </td>
  </tr>
</tbody>
</table></div>

\

#### F1 {.unnumbered .unlisted}

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:600px; overflow-x: scroll; width:80%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-9)adonis2 outputs for single-term models</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Df </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> SumOfSqs </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> R2 </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> F </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Pr(&gt;F) </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> comm </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> expl_var </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="5"><td colspan="8" style="border-bottom: 1px solid;"><strong>Edaphic</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F1.pH_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.537 </td>
   <td style="text-align:right;"> 0.063 </td>
   <td style="text-align:right;"> 12.119 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F1 </td>
   <td style="text-align:left;"> pH </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F1.soil_moisture_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.203 </td>
   <td style="text-align:right;"> 0.049 </td>
   <td style="text-align:right;"> 9.347 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F1 </td>
   <td style="text-align:left;"> soil_moisture </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F1.SOM_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.529 </td>
   <td style="text-align:right;"> 0.062 </td>
   <td style="text-align:right;"> 12.055 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F1 </td>
   <td style="text-align:left;"> SOM </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F1.ammonium_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.193 </td>
   <td style="text-align:right;"> 0.049 </td>
   <td style="text-align:right;"> 9.271 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F1 </td>
   <td style="text-align:left;"> ammonium </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F1.phos_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.230 </td>
   <td style="text-align:right;"> 0.050 </td>
   <td style="text-align:right;"> 9.572 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F1 </td>
   <td style="text-align:left;"> phos </td>
  </tr>
  <tr grouplength="2"><td colspan="8" style="border-bottom: 1px solid;"><strong>Climate</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F1.ppt3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.863 </td>
   <td style="text-align:right;"> 0.076 </td>
   <td style="text-align:right;"> 14.898 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F1 </td>
   <td style="text-align:left;"> ppt3yr </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F1.GDD3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.677 </td>
   <td style="text-align:right;"> 0.068 </td>
   <td style="text-align:right;"> 13.301 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F1 </td>
   <td style="text-align:left;"> GDD3yr </td>
  </tr>
  <tr grouplength="3"><td colspan="8" style="border-bottom: 1px solid;"><strong>Plant</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F1.avg_SRL_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.655 </td>
   <td style="text-align:right;"> 0.027 </td>
   <td style="text-align:right;"> 4.976 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F1 </td>
   <td style="text-align:left;"> avg_SRL </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F1.avg_SLA_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.076 </td>
   <td style="text-align:right;"> 0.044 </td>
   <td style="text-align:right;"> 8.319 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F1 </td>
   <td style="text-align:left;"> avg_SLA </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F1.herbivory_perc_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.578 </td>
   <td style="text-align:right;"> 0.024 </td>
   <td style="text-align:right;"> 4.373 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F1 </td>
   <td style="text-align:left;"> herbivory_perc </td>
  </tr>
</tbody>
</table></div>

\

#### F3 {.unnumbered .unlisted}

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:600px; overflow-x: scroll; width:80%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-10)adonis2 outputs for single-term models</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Df </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> SumOfSqs </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> R2 </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> F </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Pr(&gt;F) </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> comm </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> expl_var </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="5"><td colspan="8" style="border-bottom: 1px solid;"><strong>Edaphic</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F3.pH_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.664 </td>
   <td style="text-align:right;"> 0.223 </td>
   <td style="text-align:right;"> 7.751 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F3 </td>
   <td style="text-align:left;"> pH </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F3.soil_moisture_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.759 </td>
   <td style="text-align:right;"> 0.102 </td>
   <td style="text-align:right;"> 3.059 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:left;"> Fun_wc_F3 </td>
   <td style="text-align:left;"> soil_moisture </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F3.SOM_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.627 </td>
   <td style="text-align:right;"> 0.218 </td>
   <td style="text-align:right;"> 7.534 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F3 </td>
   <td style="text-align:left;"> SOM </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F3.ammonium_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.426 </td>
   <td style="text-align:right;"> 0.057 </td>
   <td style="text-align:right;"> 1.636 </td>
   <td style="text-align:right;"> 0.060 </td>
   <td style="text-align:left;"> Fun_wc_F3 </td>
   <td style="text-align:left;"> ammonium </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F3.phos_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.948 </td>
   <td style="text-align:right;"> 0.127 </td>
   <td style="text-align:right;"> 3.931 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F3 </td>
   <td style="text-align:left;"> phos </td>
  </tr>
  <tr grouplength="2"><td colspan="8" style="border-bottom: 1px solid;"><strong>Climate</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F3.ppt3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.676 </td>
   <td style="text-align:right;"> 0.225 </td>
   <td style="text-align:right;"> 7.827 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F3 </td>
   <td style="text-align:left;"> ppt3yr </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F3.GDD3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.676 </td>
   <td style="text-align:right;"> 0.225 </td>
   <td style="text-align:right;"> 7.827 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F3 </td>
   <td style="text-align:left;"> GDD3yr </td>
  </tr>
  <tr grouplength="3"><td colspan="8" style="border-bottom: 1px solid;"><strong>Plant</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F3.avg_SRL_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.488 </td>
   <td style="text-align:right;"> 0.200 </td>
   <td style="text-align:right;"> 6.730 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F3 </td>
   <td style="text-align:left;"> avg_SRL </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F3.avg_SLA_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.670 </td>
   <td style="text-align:right;"> 0.224 </td>
   <td style="text-align:right;"> 7.789 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F3 </td>
   <td style="text-align:left;"> avg_SLA </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F3.herbivory_perc_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.645 </td>
   <td style="text-align:right;"> 0.087 </td>
   <td style="text-align:right;"> 2.557 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:left;"> Fun_wc_F3 </td>
   <td style="text-align:left;"> herbivory_perc </td>
  </tr>
</tbody>
</table></div>

\

#### F4 {.unnumbered .unlisted}

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:600px; overflow-x: scroll; width:80%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-11)adonis2 outputs for single-term models</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Df </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> SumOfSqs </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> R2 </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> F </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Pr(&gt;F) </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> comm </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> expl_var </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="5"><td colspan="8" style="border-bottom: 1px solid;"><strong>Edaphic</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F4.pH_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.455 </td>
   <td style="text-align:right;"> 0.067 </td>
   <td style="text-align:right;"> 1.929 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:left;"> Fun_wc_F4 </td>
   <td style="text-align:left;"> pH </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F4.soil_moisture_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.352 </td>
   <td style="text-align:right;"> 0.052 </td>
   <td style="text-align:right;"> 1.469 </td>
   <td style="text-align:right;"> 0.012 </td>
   <td style="text-align:left;"> Fun_wc_F4 </td>
   <td style="text-align:left;"> soil_moisture </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F4.SOM_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.483 </td>
   <td style="text-align:right;"> 0.071 </td>
   <td style="text-align:right;"> 2.060 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:left;"> Fun_wc_F4 </td>
   <td style="text-align:left;"> SOM </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F4.ammonium_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.352 </td>
   <td style="text-align:right;"> 0.052 </td>
   <td style="text-align:right;"> 1.469 </td>
   <td style="text-align:right;"> 0.009 </td>
   <td style="text-align:left;"> Fun_wc_F4 </td>
   <td style="text-align:left;"> ammonium </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F4.phos_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.358 </td>
   <td style="text-align:right;"> 0.052 </td>
   <td style="text-align:right;"> 1.495 </td>
   <td style="text-align:right;"> 0.010 </td>
   <td style="text-align:left;"> Fun_wc_F4 </td>
   <td style="text-align:left;"> phos </td>
  </tr>
  <tr grouplength="2"><td colspan="8" style="border-bottom: 1px solid;"><strong>Climate</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F4.ppt3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.409 </td>
   <td style="text-align:right;"> 0.060 </td>
   <td style="text-align:right;"> 1.724 </td>
   <td style="text-align:right;"> 0.068 </td>
   <td style="text-align:left;"> Fun_wc_F4 </td>
   <td style="text-align:left;"> ppt3yr </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F4.GDD3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.396 </td>
   <td style="text-align:right;"> 0.058 </td>
   <td style="text-align:right;"> 1.666 </td>
   <td style="text-align:right;"> 0.013 </td>
   <td style="text-align:left;"> Fun_wc_F4 </td>
   <td style="text-align:left;"> GDD3yr </td>
  </tr>
  <tr grouplength="3"><td colspan="8" style="border-bottom: 1px solid;"><strong>Plant</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F4.avg_SRL_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.468 </td>
   <td style="text-align:right;"> 0.069 </td>
   <td style="text-align:right;"> 1.989 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F4 </td>
   <td style="text-align:left;"> avg_SRL </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F4.avg_SLA_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.379 </td>
   <td style="text-align:right;"> 0.056 </td>
   <td style="text-align:right;"> 1.590 </td>
   <td style="text-align:right;"> 0.006 </td>
   <td style="text-align:left;"> Fun_wc_F4 </td>
   <td style="text-align:left;"> avg_SLA </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F4.herbivory_perc_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.430 </td>
   <td style="text-align:right;"> 0.063 </td>
   <td style="text-align:right;"> 1.820 </td>
   <td style="text-align:right;"> 0.005 </td>
   <td style="text-align:left;"> Fun_wc_F4 </td>
   <td style="text-align:left;"> herbivory_perc </td>
  </tr>
</tbody>
</table></div>

\

#### F5 {.unnumbered .unlisted}

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:600px; overflow-x: scroll; width:80%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-12)adonis2 outputs for single-term models</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Df </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> SumOfSqs </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> R2 </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> F </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Pr(&gt;F) </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> comm </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> expl_var </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="5"><td colspan="8" style="border-bottom: 1px solid;"><strong>Edaphic</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F5.pH_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.720 </td>
   <td style="text-align:right;"> 0.156 </td>
   <td style="text-align:right;"> 2.779 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F5 </td>
   <td style="text-align:left;"> pH </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F5.soil_moisture_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.645 </td>
   <td style="text-align:right;"> 0.140 </td>
   <td style="text-align:right;"> 2.442 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F5 </td>
   <td style="text-align:left;"> soil_moisture </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F5.SOM_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.707 </td>
   <td style="text-align:right;"> 0.154 </td>
   <td style="text-align:right;"> 2.722 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F5 </td>
   <td style="text-align:left;"> SOM </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F5.ammonium_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.673 </td>
   <td style="text-align:right;"> 0.146 </td>
   <td style="text-align:right;"> 2.565 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F5 </td>
   <td style="text-align:left;"> ammonium </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F5.phos_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.651 </td>
   <td style="text-align:right;"> 0.141 </td>
   <td style="text-align:right;"> 2.467 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F5 </td>
   <td style="text-align:left;"> phos </td>
  </tr>
  <tr grouplength="2"><td colspan="8" style="border-bottom: 1px solid;"><strong>Climate</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F5.ppt3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.368 </td>
   <td style="text-align:right;"> 0.080 </td>
   <td style="text-align:right;"> 1.303 </td>
   <td style="text-align:right;"> 0.119 </td>
   <td style="text-align:left;"> Fun_wc_F5 </td>
   <td style="text-align:left;"> ppt3yr </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F5.GDD3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.402 </td>
   <td style="text-align:right;"> 0.087 </td>
   <td style="text-align:right;"> 1.435 </td>
   <td style="text-align:right;"> 0.041 </td>
   <td style="text-align:left;"> Fun_wc_F5 </td>
   <td style="text-align:left;"> GDD3yr </td>
  </tr>
  <tr grouplength="3"><td colspan="8" style="border-bottom: 1px solid;"><strong>Plant</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F5.avg_SRL_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.397 </td>
   <td style="text-align:right;"> 0.086 </td>
   <td style="text-align:right;"> 1.414 </td>
   <td style="text-align:right;"> 0.053 </td>
   <td style="text-align:left;"> Fun_wc_F5 </td>
   <td style="text-align:left;"> avg_SRL </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F5.avg_SLA_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.691 </td>
   <td style="text-align:right;"> 0.150 </td>
   <td style="text-align:right;"> 2.648 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F5 </td>
   <td style="text-align:left;"> avg_SLA </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F5.herbivory_perc_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.399 </td>
   <td style="text-align:right;"> 0.087 </td>
   <td style="text-align:right;"> 1.422 </td>
   <td style="text-align:right;"> 0.063 </td>
   <td style="text-align:left;"> Fun_wc_F5 </td>
   <td style="text-align:left;"> herbivory_perc </td>
  </tr>
</tbody>
</table></div>

\

#### F6 {.unnumbered .unlisted}

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:600px; overflow-x: scroll; width:80%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-13)adonis2 outputs for single-term models</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Df </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> SumOfSqs </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> R2 </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> F </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Pr(&gt;F) </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> comm </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> expl_var </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="5"><td colspan="8" style="border-bottom: 1px solid;"><strong>Edaphic</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F6.pH_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.738 </td>
   <td style="text-align:right;"> 0.085 </td>
   <td style="text-align:right;"> 2.797 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F6 </td>
   <td style="text-align:left;"> pH </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F6.soil_moisture_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.551 </td>
   <td style="text-align:right;"> 0.064 </td>
   <td style="text-align:right;"> 2.039 </td>
   <td style="text-align:right;"> 0.004 </td>
   <td style="text-align:left;"> Fun_wc_F6 </td>
   <td style="text-align:left;"> soil_moisture </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F6.SOM_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.496 </td>
   <td style="text-align:right;"> 0.057 </td>
   <td style="text-align:right;"> 1.822 </td>
   <td style="text-align:right;"> 0.007 </td>
   <td style="text-align:left;"> Fun_wc_F6 </td>
   <td style="text-align:left;"> SOM </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F6.ammonium_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.538 </td>
   <td style="text-align:right;"> 0.062 </td>
   <td style="text-align:right;"> 1.989 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F6 </td>
   <td style="text-align:left;"> ammonium </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F6.phos_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.395 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 1.435 </td>
   <td style="text-align:right;"> 0.030 </td>
   <td style="text-align:left;"> Fun_wc_F6 </td>
   <td style="text-align:left;"> phos </td>
  </tr>
  <tr grouplength="2"><td colspan="8" style="border-bottom: 1px solid;"><strong>Climate</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F6.ppt3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.594 </td>
   <td style="text-align:right;"> 0.069 </td>
   <td style="text-align:right;"> 2.210 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F6 </td>
   <td style="text-align:left;"> ppt3yr </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F6.GDD3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.088 </td>
   <td style="text-align:right;"> 0.126 </td>
   <td style="text-align:right;"> 4.313 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F6 </td>
   <td style="text-align:left;"> GDD3yr </td>
  </tr>
  <tr grouplength="3"><td colspan="8" style="border-bottom: 1px solid;"><strong>Plant</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F6.avg_SRL_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.703 </td>
   <td style="text-align:right;"> 0.081 </td>
   <td style="text-align:right;"> 2.651 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F6 </td>
   <td style="text-align:left;"> avg_SRL </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F6.avg_SLA_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.395 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 1.435 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:left;"> Fun_wc_F6 </td>
   <td style="text-align:left;"> avg_SLA </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F6.herbivory_perc_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.561 </td>
   <td style="text-align:right;"> 0.065 </td>
   <td style="text-align:right;"> 2.078 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F6 </td>
   <td style="text-align:left;"> herbivory_perc </td>
  </tr>
</tbody>
</table></div>

\

#### F7 {.unnumbered .unlisted}

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:600px; overflow-x: scroll; width:80%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-14)adonis2 outputs for single-term models</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Df </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> SumOfSqs </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> R2 </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> F </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Pr(&gt;F) </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> comm </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> expl_var </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="5"><td colspan="8" style="border-bottom: 1px solid;"><strong>Edaphic</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F7.pH_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.035 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 3.962 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F7 </td>
   <td style="text-align:left;"> pH </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F7.soil_moisture_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.753 </td>
   <td style="text-align:right;"> 0.072 </td>
   <td style="text-align:right;"> 2.802 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F7 </td>
   <td style="text-align:left;"> soil_moisture </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F7.SOM_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.198 </td>
   <td style="text-align:right;"> 0.115 </td>
   <td style="text-align:right;"> 4.670 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F7 </td>
   <td style="text-align:left;"> SOM </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F7.ammonium_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.582 </td>
   <td style="text-align:right;"> 0.056 </td>
   <td style="text-align:right;"> 2.125 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F7 </td>
   <td style="text-align:left;"> ammonium </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F7.phos_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.362 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 1.293 </td>
   <td style="text-align:right;"> 0.107 </td>
   <td style="text-align:left;"> Fun_wc_F7 </td>
   <td style="text-align:left;"> phos </td>
  </tr>
  <tr grouplength="2"><td colspan="8" style="border-bottom: 1px solid;"><strong>Climate</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F7.ppt3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.199 </td>
   <td style="text-align:right;"> 0.115 </td>
   <td style="text-align:right;"> 4.671 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F7 </td>
   <td style="text-align:left;"> ppt3yr </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F7.GDD3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.008 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 3.848 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F7 </td>
   <td style="text-align:left;"> GDD3yr </td>
  </tr>
  <tr grouplength="3"><td colspan="8" style="border-bottom: 1px solid;"><strong>Plant</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F7.avg_SRL_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.801 </td>
   <td style="text-align:right;"> 0.077 </td>
   <td style="text-align:right;"> 2.993 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F7 </td>
   <td style="text-align:left;"> avg_SRL </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F7.avg_SLA_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.790 </td>
   <td style="text-align:right;"> 0.076 </td>
   <td style="text-align:right;"> 2.948 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F7 </td>
   <td style="text-align:left;"> avg_SLA </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F7.herbivory_perc_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.622 </td>
   <td style="text-align:right;"> 0.060 </td>
   <td style="text-align:right;"> 2.283 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F7 </td>
   <td style="text-align:left;"> herbivory_perc </td>
  </tr>
</tbody>
</table></div>

\

#### F8 {.unnumbered .unlisted}

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:600px; overflow-x: scroll; width:80%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-15)adonis2 outputs for single-term models</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Df </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> SumOfSqs </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> R2 </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> F </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Pr(&gt;F) </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> comm </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> expl_var </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="5"><td colspan="8" style="border-bottom: 1px solid;"><strong>Edaphic</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F8.pH_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.317 </td>
   <td style="text-align:right;"> 0.076 </td>
   <td style="text-align:right;"> 4.176 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F8 </td>
   <td style="text-align:left;"> pH </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F8.soil_moisture_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.244 </td>
   <td style="text-align:right;"> 0.071 </td>
   <td style="text-align:right;"> 3.927 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F8 </td>
   <td style="text-align:left;"> soil_moisture </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F8.SOM_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.586 </td>
   <td style="text-align:right;"> 0.091 </td>
   <td style="text-align:right;"> 5.116 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F8 </td>
   <td style="text-align:left;"> SOM </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F8.ammonium_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.038 </td>
   <td style="text-align:right;"> 0.060 </td>
   <td style="text-align:right;"> 3.235 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F8 </td>
   <td style="text-align:left;"> ammonium </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F8.phos_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.135 </td>
   <td style="text-align:right;"> 0.065 </td>
   <td style="text-align:right;"> 3.558 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F8 </td>
   <td style="text-align:left;"> phos </td>
  </tr>
  <tr grouplength="2"><td colspan="8" style="border-bottom: 1px solid;"><strong>Climate</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F8.ppt3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.924 </td>
   <td style="text-align:right;"> 0.111 </td>
   <td style="text-align:right;"> 6.343 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F8 </td>
   <td style="text-align:left;"> ppt3yr </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F8.GDD3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.370 </td>
   <td style="text-align:right;"> 0.079 </td>
   <td style="text-align:right;"> 4.358 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F8 </td>
   <td style="text-align:left;"> GDD3yr </td>
  </tr>
  <tr grouplength="3"><td colspan="8" style="border-bottom: 1px solid;"><strong>Plant</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F8.avg_SRL_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.891 </td>
   <td style="text-align:right;"> 0.051 </td>
   <td style="text-align:right;"> 2.754 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F8 </td>
   <td style="text-align:left;"> avg_SRL </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F8.avg_SLA_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.066 </td>
   <td style="text-align:right;"> 0.061 </td>
   <td style="text-align:right;"> 3.330 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F8 </td>
   <td style="text-align:left;"> avg_SLA </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F8.herbivory_perc_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.116 </td>
   <td style="text-align:right;"> 0.064 </td>
   <td style="text-align:right;"> 3.495 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F8 </td>
   <td style="text-align:left;"> herbivory_perc </td>
  </tr>
</tbody>
</table></div>

\

#### F9 {.unnumbered .unlisted}

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:600px; overflow-x: scroll; width:80%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-16)adonis2 outputs for single-term models</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Df </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> SumOfSqs </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> R2 </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> F </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Pr(&gt;F) </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> comm </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> expl_var </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="5"><td colspan="8" style="border-bottom: 1px solid;"><strong>Edaphic</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F9.pH_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.727 </td>
   <td style="text-align:right;"> 0.041 </td>
   <td style="text-align:right;"> 2.328 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F9 </td>
   <td style="text-align:left;"> pH </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F9.soil_moisture_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.928 </td>
   <td style="text-align:right;"> 0.053 </td>
   <td style="text-align:right;"> 3.005 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F9 </td>
   <td style="text-align:left;"> soil_moisture </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F9.SOM_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.340 </td>
   <td style="text-align:right;"> 0.076 </td>
   <td style="text-align:right;"> 4.450 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F9 </td>
   <td style="text-align:left;"> SOM </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F9.ammonium_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.914 </td>
   <td style="text-align:right;"> 0.052 </td>
   <td style="text-align:right;"> 2.957 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F9 </td>
   <td style="text-align:left;"> ammonium </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F9.phos_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.808 </td>
   <td style="text-align:right;"> 0.046 </td>
   <td style="text-align:right;"> 2.599 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F9 </td>
   <td style="text-align:left;"> phos </td>
  </tr>
  <tr grouplength="2"><td colspan="8" style="border-bottom: 1px solid;"><strong>Climate</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F9.ppt3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.227 </td>
   <td style="text-align:right;"> 0.070 </td>
   <td style="text-align:right;"> 4.048 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F9 </td>
   <td style="text-align:left;"> ppt3yr </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F9.GDD3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.064 </td>
   <td style="text-align:right;"> 0.060 </td>
   <td style="text-align:right;"> 3.473 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F9 </td>
   <td style="text-align:left;"> GDD3yr </td>
  </tr>
  <tr grouplength="3"><td colspan="8" style="border-bottom: 1px solid;"><strong>Plant</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F9.avg_SRL_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.650 </td>
   <td style="text-align:right;"> 0.037 </td>
   <td style="text-align:right;"> 2.071 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F9 </td>
   <td style="text-align:left;"> avg_SRL </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F9.avg_SLA_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.703 </td>
   <td style="text-align:right;"> 0.040 </td>
   <td style="text-align:right;"> 2.246 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F9 </td>
   <td style="text-align:left;"> avg_SLA </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F9.herbivory_perc_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.789 </td>
   <td style="text-align:right;"> 0.045 </td>
   <td style="text-align:right;"> 2.534 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F9 </td>
   <td style="text-align:left;"> herbivory_perc </td>
  </tr>
</tbody>
</table></div>

\

#### F10 {.unnumbered .unlisted}

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:600px; overflow-x: scroll; width:80%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-17)adonis2 outputs for single-term models</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Df </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> SumOfSqs </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> R2 </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> F </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Pr(&gt;F) </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> comm </th>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> expl_var </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="5"><td colspan="8" style="border-bottom: 1px solid;"><strong>Edaphic</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F10.pH_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.868 </td>
   <td style="text-align:right;"> 0.074 </td>
   <td style="text-align:right;"> 2.815 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F10 </td>
   <td style="text-align:left;"> pH </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F10.soil_moisture_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.072 </td>
   <td style="text-align:right;"> 0.092 </td>
   <td style="text-align:right;"> 3.541 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F10 </td>
   <td style="text-align:left;"> soil_moisture </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F10.SOM_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.970 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 3.175 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F10 </td>
   <td style="text-align:left;"> SOM </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F10.ammonium_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.097 </td>
   <td style="text-align:right;"> 0.094 </td>
   <td style="text-align:right;"> 3.635 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F10 </td>
   <td style="text-align:left;"> ammonium </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F10.phos_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1.113 </td>
   <td style="text-align:right;"> 0.095 </td>
   <td style="text-align:right;"> 3.693 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F10 </td>
   <td style="text-align:left;"> phos </td>
  </tr>
  <tr grouplength="2"><td colspan="8" style="border-bottom: 1px solid;"><strong>Climate</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F10.ppt3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.753 </td>
   <td style="text-align:right;"> 0.065 </td>
   <td style="text-align:right;"> 2.416 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F10 </td>
   <td style="text-align:left;"> ppt3yr </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F10.GDD3yr_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.797 </td>
   <td style="text-align:right;"> 0.068 </td>
   <td style="text-align:right;"> 2.567 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F10 </td>
   <td style="text-align:left;"> GDD3yr </td>
  </tr>
  <tr grouplength="3"><td colspan="8" style="border-bottom: 1px solid;"><strong>Plant</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F10.avg_SRL_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.738 </td>
   <td style="text-align:right;"> 0.063 </td>
   <td style="text-align:right;"> 2.362 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F10 </td>
   <td style="text-align:left;"> avg_SRL </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F10.avg_SLA_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.768 </td>
   <td style="text-align:right;"> 0.066 </td>
   <td style="text-align:right;"> 2.466 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F10 </td>
   <td style="text-align:left;"> avg_SLA </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Fun_wc_F10.herbivory_perc_m.std </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.814 </td>
   <td style="text-align:right;"> 0.070 </td>
   <td style="text-align:right;"> 2.626 </td>
   <td style="text-align:right;"> 0.001 </td>
   <td style="text-align:left;"> Fun_wc_F10 </td>
   <td style="text-align:left;"> herbivory_perc </td>
  </tr>
</tbody>
</table></div>

\
\

------------------------------------------------------------------------


### Bac {.unnumbered .unlisted .tabset}

\
\
TBD
\
\

------------------------------------------------------------------------


------------------------------------------------------------------------

# Cluster descriptions

\
[in-progress]\

| Cluster | total n | Site(s)           | Grass(es)                 | Characteristics†                       | Exclusivity                                                           |     |
|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
| 1       | 183     |                   |                           | spans pH range                         |                                                                       |     |
| 2       | 37      | BNP,DMT,FMT,SEV   | BOER (n=33), BOGR (n=4)   | high pH\* (6.8 - 8.3, mean 7.5)        |                                                                       |     |
| 3       | 56      |                   |                           | high pH\*\*\*\* (6.8 - 8.3, mean 7.8)  |                                                                       |     |
| 4       | 17      |                   |                           | lower pH\*\*\*\* (5.6 - 7.6, mean 6.2) |                                                                       |     |
| 5       | 43      |                   |                           | high pH\*\* (7.1 - 7.8, mean 7.6)      |                                                                       |     |
| 6       | 32      |                   |                           | lower pH\*\*\*\* (5.1 - 7.8, mean 6.2) |                                                                       |     |
| 7       | 38      |                   |                           |                                        |                                                                       |     |
| 8       | 29      | mostly LAR (n=27) |                           | high pH\*\*\*\* (7.2 - 8.2, mean 8.0)  |                                                                       |     |
| 9       | 9       | SFA               | SCSC (only grass present) |                                        | Site=SFA                                                              |     |
| 10      | 29      | KAE               |                           | lower pH\*\*\*\* (5.9 - 7.2, mean 6.3) | Site=KAE (of the 32 KAE samples, only 3 others were in diff clusters) |     |

: Descriptions of Sørensen distance-based clusters. †variables listed are significant in all vs. base-mean Wilcox test with BH p-value corrections. \* p-value \< 0.05, \*\* \< 0.001, \*\*\* \< 0.0001, \*\*\*\* \< 1e-5.

[\
]{.underline}

\
\

# Are the clusters distinct/distinguishable? -\> yes, mostly

[Clusters]{.underline}: Sørensen dissimilarity clusters based on pam (k = 10)

[Method]{.underline}: R package `randomForest v4.7.1.1`

```         
predictors.all<-t(otu_table(Fun_wholecommunity))

response.clus_sor_k10<-as.factor(sample_data(Fun_wholecommunity)$clus_sor_k10_new)

rf.data.clus_sor_k10<-data.frame(response.clus_sor_k10, predictors.all)

classify.clus_sor_k10<-randomForest(response.clus_sor_k10~., data = rf.data.clus_sor_k10, ntree=999)
```

Call: randomForest(formula = response.clus_sor_k10 \~ ., data = rf.data.clus_sor_k10, ntree = 999)

Type of random forest: classification

Number of trees: 999

No. of variables tried at each split: 81

OOB estimate of error rate: 6.82%

|         | F1  | F2  | F3  | F4  | F5  | F6  | F7  | F8  | F9  | F10 | Cluster error % |
|---------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---------------:|
| **F1**  | 183 |     |     |     |     |     |     |     |     |     |       0.0       |
| **F2**  |     | 10  |     |     |     |     |     |     |     |     |       0.0       |
| **F3**  |     |     | 28  |     |     |     |     |  1  |     |     |       3.4       |
| **F4**  |     |     |  1  | 27  |     |     |     |     |  1  |     |       6.9       |
| **F5**  |     |     |     |     | 12  |     |  1  |  4  |     |     |      29.4       |
| **F6**  |     |     |     |     |     | 23  |  2  |  7  |     |     |      28.1       |
| **F7**  |     |     |  1  |     |     |  2  | 34  |     |  1  |     |      10.5       |
| **F8**  |     |     |  1  |     |     |  1  |  1  | 50  |     |     |       5.7       |
| **F9**  |     |     |     |     |     |     |  1  |  1  | 49  |  5  |      12.5       |
| **F10** |     |     |     |     |     |     |     |     |  2  | 35  |       5.4       |

: Confusion matrix of fungal whole community randomForest classification based on Sørensen-based PAM clusters. Diagonals are accurate calls. Misclassifications are shown as values by row, i.e., cluster F3 was misclassified as cluster F8 in 1 sample, while 28 samples were accurately called, resulting in an error rate of 3.4% for that cluster.

\
\
\

**adonis2**\


```
## Permutation test for adonis under reduced model
## Terms added sequentially (first to last)
## Permutation: free
## Number of permutations: 999
## 
## adonis2(formula = phyloseq::distance(Fun_wholecommunity, method = "bray") ~ clus_sor_k10_new, data = (as(sample_data(Fun_wholecommunity), "data.frame")))
##                   Df SumOfSqs      R2      F Pr(>F)    
## clus_sor_k10_new   9   40.489 0.20715 13.761  0.001 ***
## Residual         474  154.968 0.79285                  
## Total            483  195.457 1.00000                  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

\
\
\

## Dendrogram of Sørensen-based clusters (k = 10)

\

**Fungal whole community**\

![Dendrogram of Sørensen-based clusters of fungal whole communities. The terminal segments hang to within-cluster dissimilarity.](../processed_data/Dendrograms/Dendrogram_Fun_wc_sor_clus_sor_k10.png){out.width="500px"}

Clusters 2 & 3 seem to be the outgroup / most distantly related\
**Clusters 1 & 9 are very similar, followed by 10 -\> wrap-around cluster numbering**\

## Which OTUs are driving the differences between clusters 1 & 2? {.tabset}

\

### SIMPER results {.unnumbered}

\

`average` - Species contribution to average between-group dissimilarity\
`cusum` - Ordered cumulative contribution (to between-group dissimilarity). These are based on item `average`, but they sum up to total 1\
`p` - Permutation $p$-value. Probability of getting a larger or equal average contribution in random permutation of the group factor\
\
\

**Mean Sørensen dissimilarity between Clusters 1 & 2:** 0.920 (unweighted) / 0.903 (weighted by sample size)\

*Mean within-cluster similarities*\
- Cluster 1: 0.514\
- Cluster 2: 0.802\
\





\

# Significantly differential taxa among clusters

\



## Genus-level

\

### Fusarium {.unnumbered}

\

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_PAM_Clusters_files/figure-html/unnamed-chunk-20-1.png)<!-- -->

\

## OTU-level {.tabset}

\

### OTU1252 {.unnumbered}

\

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_PAM_Clusters_files/figure-html/unnamed-chunk-21-1.png)<!-- -->

\

### OTU6679 {.unnumbered}

\

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_PAM_Clusters_files/figure-html/unnamed-chunk-22-1.png)<!-- -->

\

### OTU205 {.unnumbered}

\

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_PAM_Clusters_files/figure-html/unnamed-chunk-23-1.png)<!-- -->

\
\
\
\

# Taxonomy of clusters

\
\

# Fungal {.tabset}

## Phylum {.unnumbered}

![](../figures/taxa_plots/Fun_Phylum_Full_sample_cluster.png){width="100%"}

\

## Class {.unnumbered}

![](../figures/taxa_plots/Fun_Class_Full_sample_cluster.png){width="100%"}

\

## Order {.unnumbered}

![](../figures/taxa_plots/Fun_Order_Full_sample_cluster.png){width="100%"}

\

## Family {.unnumbered}

![](../figures/taxa_plots/Fun_Family_Full_sample_cluster.png){width="100%"}

\

## Generalists v Specialists {.unnumbered}

![](../figures/taxa_plots/Fun_Sign_Full_sample_cluster.png){width="100%"}

\

\
\
\

# hide {.unnumbered .hidden .unlisted}

Notes: OTU205 is highest in relative abundance in Cluster 1, most other clusters have minimal or no presence. ~~Exception is sample in Cluster 7, which was the one misclassified into Cluster 1.~~

OTU6679, Generalist\nwilcox.test: all (global RA = 1.65%) v. Cluster 1 (mean RA = 3.75%)





\
