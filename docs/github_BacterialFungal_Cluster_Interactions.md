---
title: '**RAM paired amplicons: Bacterial-Fungal Cluster (BFC) Interactions**'
author: "Kelli Feeser"
date: "2024-05-13"
output:
  bookdown::html_document2:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
    toc_float: true
    fig.caption: yes
    keep_md: yes
  html_notebook:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
    toc_float: true
    fig.caption: yes
  html_document:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
    toc_float: true
    fig.caption: yes
editor_options:
  chunk_output_type: inline
---

\

::: homelink
<a href="https://kellifeeser.github.io/ksu-paired-amplicon-workflow/index.html" target="_blank" style="text-align:right">Back to Home</a>
:::

\

------------------------------------------------------------------------

Document last updated: 2024-05-13

------------------------------------------------------------------------

\

# Set-up {.unlisted .unnumbered .hidden}





## load packages



## load cache



## load rds



## check metadata



\

# Generate figures {.hidden}

## nmds





### fun

(ref:Fun-NMDS-Sor-PAM-all-fig-caption) NMDS plot showing variation in the presence/absence-based composition of root-associated fungi in relation to PAM cluster designations. NMDS plot based on Sørensen dissimilarities: k = 4, 2-dimensional stress = 0.122, non-metric fit R^2^ = 0.985, linear fit R^2^ = 0.908.



### bac

(ref:Bac-NMDS-Sor-PAM-all-fig-caption) NMDS plot showing variation in the presence/absence-based composition of root-associated fungi in relation to PAM cluster designations. NMDS plot based on Sørensen dissimilarities: k = 5, 2-dimensional stress = 0.055, non-metric fit R^2^ = 0.997, linear fit R^2^ = 0.981.

<div class="figure">
<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_BacterialFungal_Cluster_Interactions_files/figure-html/unnamed-chunk-4-1.png" alt="(ref:Bac-NMDS-Sor-PAM-all-fig-caption)" height="90%" />
<p class="caption">(\#fig:unnamed-chunk-4)(ref:Bac-NMDS-Sor-PAM-all-fig-caption)</p>
</div>

## pairwise 



------------------------------------------------------------------------

# Relationships among bacterial-fungal clusters

\

## Chord diagram {.tabset}

\
Evidence of cross-talk among BFCs, i.e., a bacterial cluster might correspond to > 1 fungal cluster.\

### fungal emphasis

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_BacterialFungal_Cluster_Interactions_files/figure-html/unnamed-chunk-5-1.png" width="30%" /><img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_BacterialFungal_Cluster_Interactions_files/figure-html/unnamed-chunk-5-2.png" width="30%" /><img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_BacterialFungal_Cluster_Interactions_files/figure-html/unnamed-chunk-5-3.png" width="30%" />




### bacterial emphasis 

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_BacterialFungal_Cluster_Interactions_files/figure-html/unnamed-chunk-6-1.png" width="30%" /><img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_BacterialFungal_Cluster_Interactions_files/figure-html/unnamed-chunk-6-2.png" width="30%" /><img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_BacterialFungal_Cluster_Interactions_files/figure-html/unnamed-chunk-6-3.png" width="30%" />





## heatmap



![Heatmap of bacterial-fungal cluster (BFC) membership.](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_BacterialFungal_Cluster_Interactions_files/figure-html/BFCheatmap1-1.png)


# logistic regressions

Binary/categorical response variables necessitate logistic and/or multinomial regression models.\

-    Response variables (binary or categorical)

  -    F1
  
-    Explanatory variables (continuous and/or categorical)

  -    F1
  
  
logistic regression models can accommodate continuous and/or categorical explanatory variables as well as interaction terms to investigate potential combined effects of the explanatory variables (see our recent blog on Key Driver Analysis for more information).

# in-progress {.hidden}




## Computing multiple categorical factor pairwise comparisons

We used `supernova::pairwise` for generating and testing all pairwise comparisons of categorical terms (BFC) in a linear model. This function computes the pooled standard error by using the mean squared error (MSE) from the full model fit (not of each group) and then weighting it based on the size of the groups in question (divide by n).\








