---
title: "Alpha beta gamma by Site"
author: "Kelli Feeser"
date: "2024-07-22"
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

Document last updated: 2024-07-22

------------------------------------------------------------------------

\

# Set-up {.unlisted .unnumbered .hidden}





## load packages



\

## load rds



\

# Mean beta dissimilarities by site

\

## Bac



\

## Fun



\

# 𝛄 - Gamma diversity of sites {.tabset .tabset-pills}

\

## Bac

\

### Calculate site gamma ($\gamma_{site}$)



\

#### summary stats


```r
# summary stats
paste0("Sample Alpha - min: ",
  min(bwc_alpha_Site$Observed),", max: ",max(bwc_alpha_Site$Observed),", mean: ",round(mean(bwc_alpha_Site$Observed),0),", sd: ",round(sd(bwc_alpha_Site$Observed),0)
)
```

```
## [1] "Sample Alpha - min: 187, max: 1941, mean: 1113, sd: 311"
```

```r
paste0("Site gamma - min: ",
  min(Bac_gamma_Site),", max: ",max(Bac_gamma_Site),", mean: ",round(mean(Bac_gamma_Site),0),", sd: ",round(sd(Bac_gamma_Site),0)
)
```

```
## [1] "Site gamma - min: 2505, max: 8620, mean: 5328, sd: 1858"
```

```r
paste0("Site mean alpha - min: ",
  round(min(Bac_obs_mean_alpha$Observed),1),", max: ",round(max(Bac_obs_mean_alpha$Observed),1),", mean: ",round(mean(Bac_obs_mean_alpha$Observed),1),", sd: ",round(sd(Bac_obs_mean_alpha$Observed),1)
)
```

```
## [1] "Site mean alpha - min: 712.3, max: 1711.6, mean: 1081.5, sd: 249.9"
```

\

### Table: Bacterial Gamma Diversity By Site


```r
Bac_gamma_Site3 %>%
  kbl(caption = "Gamma diversity of sites: bacteria",
            align = 'c',
      # col.names = c("Number of OTUs","Number of samples")
      # ,format.args = format(list(big.mark = ',', digit))
      ) %>%
  kable_styling() %>%
  scroll_box(width = "80%", height = "550px")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:550px; overflow-x: scroll; width:80%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-1)Gamma diversity of sites: bacteria</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Gamma (# total unique OTUs) </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> n (# of samples per site) </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> # of grass hosts per site </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Gamma / n </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Observed mean 𝝰 </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> mean prop. of gamma detected per sample </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> SD prop. of gamma detected per sample </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> BLM </td>
   <td style="text-align:center;"> 4,689 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 2344.5 </td>
   <td style="text-align:center;"> 924.7 </td>
   <td style="text-align:center;"> 0.197 </td>
   <td style="text-align:center;"> 0.029 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:center;"> 4,547 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 2273.5 </td>
   <td style="text-align:center;"> 964.1 </td>
   <td style="text-align:center;"> 0.212 </td>
   <td style="text-align:center;"> 0.033 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:center;"> 8,620 </td>
   <td style="text-align:center;"> 38 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 2155 </td>
   <td style="text-align:center;"> 1419.1 </td>
   <td style="text-align:center;"> 0.165 </td>
   <td style="text-align:center;"> 0.031 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:center;"> 5,427 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1809 </td>
   <td style="text-align:center;"> 931.7 </td>
   <td style="text-align:center;"> 0.172 </td>
   <td style="text-align:center;"> 0.041 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR </td>
   <td style="text-align:center;"> 2,719 </td>
   <td style="text-align:center;"> 11 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 2719 </td>
   <td style="text-align:center;"> 814.4 </td>
   <td style="text-align:center;"> 0.3 </td>
   <td style="text-align:center;"> 0.045 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:center;"> 5,801 </td>
   <td style="text-align:center;"> 26 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1933.7 </td>
   <td style="text-align:center;"> 942.7 </td>
   <td style="text-align:center;"> 0.163 </td>
   <td style="text-align:center;"> 0.022 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:center;"> 6,362 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 2120.7 </td>
   <td style="text-align:center;"> 1154.5 </td>
   <td style="text-align:center;"> 0.181 </td>
   <td style="text-align:center;"> 0.026 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:center;"> 4,076 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 2038 </td>
   <td style="text-align:center;"> 922.6 </td>
   <td style="text-align:center;"> 0.226 </td>
   <td style="text-align:center;"> 0.026 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:center;"> 4,362 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 2181 </td>
   <td style="text-align:center;"> 1010.6 </td>
   <td style="text-align:center;"> 0.232 </td>
   <td style="text-align:center;"> 0.034 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF </td>
   <td style="text-align:center;"> 2,711 </td>
   <td style="text-align:center;"> 7 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 2711 </td>
   <td style="text-align:center;"> 964.9 </td>
   <td style="text-align:center;"> 0.356 </td>
   <td style="text-align:center;"> 0.03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:center;"> 6,631 </td>
   <td style="text-align:center;"> 37 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 1657.8 </td>
   <td style="text-align:center;"> 1058.9 </td>
   <td style="text-align:center;"> 0.16 </td>
   <td style="text-align:center;"> 0.028 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:center;"> 4,043 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 2021.5 </td>
   <td style="text-align:center;"> 1061.3 </td>
   <td style="text-align:center;"> 0.263 </td>
   <td style="text-align:center;"> 0.035 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:center;"> 6,909 </td>
   <td style="text-align:center;"> 32 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 2303 </td>
   <td style="text-align:center;"> 875.5 </td>
   <td style="text-align:center;"> 0.127 </td>
   <td style="text-align:center;"> 0.061 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:center;"> 7,892 </td>
   <td style="text-align:center;"> 42 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 1973 </td>
   <td style="text-align:center;"> 1390.3 </td>
   <td style="text-align:center;"> 0.176 </td>
   <td style="text-align:center;"> 0.019 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:center;"> 4,516 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1505.3 </td>
   <td style="text-align:center;"> 785.2 </td>
   <td style="text-align:center;"> 0.174 </td>
   <td style="text-align:center;"> 0.032 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:center;"> 7,876 </td>
   <td style="text-align:center;"> 34 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 2625.3 </td>
   <td style="text-align:center;"> 1217.4 </td>
   <td style="text-align:center;"> 0.155 </td>
   <td style="text-align:center;"> 0.026 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:center;"> 5,964 </td>
   <td style="text-align:center;"> 20 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 2982 </td>
   <td style="text-align:center;"> 1325.1 </td>
   <td style="text-align:center;"> 0.222 </td>
   <td style="text-align:center;"> 0.031 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:center;"> 5,569 </td>
   <td style="text-align:center;"> 22 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 2784.5 </td>
   <td style="text-align:center;"> 1127.8 </td>
   <td style="text-align:center;"> 0.203 </td>
   <td style="text-align:center;"> 0.034 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNF </td>
   <td style="text-align:center;"> 2,517 </td>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 2517 </td>
   <td style="text-align:center;"> 1007.5 </td>
   <td style="text-align:center;"> 0.4 </td>
   <td style="text-align:center;"> 0.055 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:center;"> 2,505 </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 1252.5 </td>
   <td style="text-align:center;"> 712.3 </td>
   <td style="text-align:center;"> 0.284 </td>
   <td style="text-align:center;"> 0.031 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFA </td>
   <td style="text-align:center;"> 5,456 </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 5456 </td>
   <td style="text-align:center;"> 1471.5 </td>
   <td style="text-align:center;"> 0.27 </td>
   <td style="text-align:center;"> 0.021 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:center;"> 8,020 </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 4010 </td>
   <td style="text-align:center;"> 1711.6 </td>
   <td style="text-align:center;"> 0.213 </td>
   <td style="text-align:center;"> 0.021 </td>
  </tr>
</tbody>
</table></div>

\

## Fun

\

###  Calculate site gamma ($\gamma_{site}$)



\

#### summary stats


```r
# summary stats
paste0("Sample Alpha - min: ",
  min(fwc_alpha_Site$Observed),", max: ",max(fwc_alpha_Site$Observed),", mean: ",round(mean(fwc_alpha_Site$Observed),0),", sd: ",round(sd(fwc_alpha_Site$Observed),0)
)
```

```
## [1] "Sample Alpha - min: 41, max: 311, mean: 146, sd: 53"
```

```r
paste0("Site gamma - min: ",
  min(Fun_gamma_Site),", max: ",max(Fun_gamma_Site),", mean: ",round(mean(Fun_gamma_Site),0),", sd: ",round(sd(Fun_gamma_Site),0)
)
```

```
## [1] "Site gamma - min: 256, max: 1442, mean: 877, sd: 348"
```

```r
paste0("Site mean alpha - min: ",
  round(min(Fun_obs_mean_alpha$Observed),1),", max: ",round(max(Fun_obs_mean_alpha$Observed),1),", mean: ",round(mean(Fun_obs_mean_alpha$Observed),1),", sd: ",round(sd(Fun_obs_mean_alpha$Observed),1)
)
```

```
## [1] "Site mean alpha - min: 71.4, max: 219.3, mean: 142.8, sd: 51.6"
```

\

### Table: Fungal Gamma Diversity By Site


```r
Fun_gamma_Site3 %>%
  kbl(caption = "Gamma diversity of sites: fungi",
            align = 'c',
      # col.names = c("Number of OTUs","Number of samples")

      # ,format.args = format(list(big.mark = ',', digit))
      ) %>%
  kable_styling() %>%
  scroll_box(width = "80%", height = "550px")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:550px; overflow-x: scroll; width:80%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-2)Gamma diversity of sites: fungi</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Gamma (# total unique OTUs) </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> n (# of samples per site) </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> # of grass hosts per site </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Gamma / n </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Observed mean 𝝰 </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> mean prop. of gamma detected per sample </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> SD prop. of gamma detected per sample </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> BLM </td>
   <td style="text-align:center;"> 983 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 491.5 </td>
   <td style="text-align:center;"> 181.3 </td>
   <td style="text-align:center;"> 0.184 </td>
   <td style="text-align:center;"> 0.029 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:center;"> 633 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 316.5 </td>
   <td style="text-align:center;"> 83.2 </td>
   <td style="text-align:center;"> 0.131 </td>
   <td style="text-align:center;"> 0.04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:center;"> 1,341 </td>
   <td style="text-align:center;"> 38 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 335.2 </td>
   <td style="text-align:center;"> 120 </td>
   <td style="text-align:center;"> 0.09 </td>
   <td style="text-align:center;"> 0.021 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:center;"> 923 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 307.7 </td>
   <td style="text-align:center;"> 173.3 </td>
   <td style="text-align:center;"> 0.188 </td>
   <td style="text-align:center;"> 0.019 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR </td>
   <td style="text-align:center;"> 430 </td>
   <td style="text-align:center;"> 11 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 430 </td>
   <td style="text-align:center;"> 94.1 </td>
   <td style="text-align:center;"> 0.219 </td>
   <td style="text-align:center;"> 0.031 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:center;"> 1,044 </td>
   <td style="text-align:center;"> 26 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 348 </td>
   <td style="text-align:center;"> 93.3 </td>
   <td style="text-align:center;"> 0.089 </td>
   <td style="text-align:center;"> 0.024 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:center;"> 1,169 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 389.7 </td>
   <td style="text-align:center;"> 120.5 </td>
   <td style="text-align:center;"> 0.103 </td>
   <td style="text-align:center;"> 0.03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:center;"> 522 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 261 </td>
   <td style="text-align:center;"> 71.4 </td>
   <td style="text-align:center;"> 0.137 </td>
   <td style="text-align:center;"> 0.023 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:center;"> 646 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 323 </td>
   <td style="text-align:center;"> 189 </td>
   <td style="text-align:center;"> 0.293 </td>
   <td style="text-align:center;"> 0.022 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF </td>
   <td style="text-align:center;"> 256 </td>
   <td style="text-align:center;"> 7 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 256 </td>
   <td style="text-align:center;"> 74 </td>
   <td style="text-align:center;"> 0.289 </td>
   <td style="text-align:center;"> 0.059 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:center;"> 1,315 </td>
   <td style="text-align:center;"> 37 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 328.8 </td>
   <td style="text-align:center;"> 129.4 </td>
   <td style="text-align:center;"> 0.098 </td>
   <td style="text-align:center;"> 0.025 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:center;"> 717 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 358.5 </td>
   <td style="text-align:center;"> 165.3 </td>
   <td style="text-align:center;"> 0.23 </td>
   <td style="text-align:center;"> 0.052 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:center;"> 1,202 </td>
   <td style="text-align:center;"> 32 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 400.7 </td>
   <td style="text-align:center;"> 119.5 </td>
   <td style="text-align:center;"> 0.099 </td>
   <td style="text-align:center;"> 0.018 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:center;"> 1,337 </td>
   <td style="text-align:center;"> 42 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 334.2 </td>
   <td style="text-align:center;"> 141 </td>
   <td style="text-align:center;"> 0.105 </td>
   <td style="text-align:center;"> 0.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:center;"> 694 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 231.3 </td>
   <td style="text-align:center;"> 90.8 </td>
   <td style="text-align:center;"> 0.131 </td>
   <td style="text-align:center;"> 0.027 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:center;"> 1,442 </td>
   <td style="text-align:center;"> 34 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 480.7 </td>
   <td style="text-align:center;"> 218.6 </td>
   <td style="text-align:center;"> 0.152 </td>
   <td style="text-align:center;"> 0.025 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:center;"> 1,007 </td>
   <td style="text-align:center;"> 20 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 503.5 </td>
   <td style="text-align:center;"> 219.3 </td>
   <td style="text-align:center;"> 0.218 </td>
   <td style="text-align:center;"> 0.021 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:center;"> 1,068 </td>
   <td style="text-align:center;"> 22 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 534 </td>
   <td style="text-align:center;"> 203.3 </td>
   <td style="text-align:center;"> 0.19 </td>
   <td style="text-align:center;"> 0.019 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNF </td>
   <td style="text-align:center;"> 443 </td>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 443 </td>
   <td style="text-align:center;"> 179.7 </td>
   <td style="text-align:center;"> 0.406 </td>
   <td style="text-align:center;"> 0.035 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:center;"> 379 </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 189.5 </td>
   <td style="text-align:center;"> 73.5 </td>
   <td style="text-align:center;"> 0.194 </td>
   <td style="text-align:center;"> 0.055 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFA </td>
   <td style="text-align:center;"> 817 </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 817 </td>
   <td style="text-align:center;"> 188.4 </td>
   <td style="text-align:center;"> 0.231 </td>
   <td style="text-align:center;"> 0.051 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:center;"> 936 </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 468 </td>
   <td style="text-align:center;"> 212 </td>
   <td style="text-align:center;"> 0.226 </td>
   <td style="text-align:center;"> 0.024 </td>
  </tr>
</tbody>
</table></div>

\

# Beta dispersion by site

## Calculate multivariate dispersions {.tabset}


```r
# Fun
Fun_wc_sorensen_distmat <- as.matrix(sor.dist.list$Fun_wholecommunity)

Fun_wc_sorensen_dist<-as.dist(Fun_wc_sorensen_distmat)

## Calculate multivariate dispersions
betadisp_Site_Fun_addC <- betadisper(Fun_wc_sorensen_dist,
                            group = phylo2vegan_sd(Fun_wholecommunity)$Site,
                            type = "median", # type = "median" (distance from each sample unit to the spatial median of its group)
                            bias.adjust = T, # adjust for small sample bias in beta div estimates?
                            sqrt.dist = FALSE,
                            add = "lingoes")

# Bac
Bac_wc_sorensen_distmat <- as.matrix(beta.pair(decostand(phylo2vegan_OTU(Bac_wholecommunity), method = "pa"), index.family = "sorensen")$beta.sor)

Bac_wc_sorensen_dist<-as.dist(Bac_wc_sorensen_distmat)

## Calculate multivariate dispersions
betadisp_Site_Bac_addC <- betadisper(Bac_wc_sorensen_dist,
                            group = phylo2vegan_sd(Bac_wholecommunity)$Site,
                            type = "median", # type = "median" (distance from each sample unit to the spatial median of its group)
                            bias.adjust = T, # adjust for small sample bias in beta div estimates?
                            sqrt.dist = FALSE,
                            add = "lingoes")
```


```r
perform_anova_betadisper <- function(betadisper_object, grouping) {

  # Perform ANOVA 
  anova_result <- anova(betadisper_object)
  
  tidy_aov <- tidy(anova_result)
  tidy_df <- as.data.frame(tidy_aov)
  
  tidy_df$term[1] <- paste0(grouping)

  sum_squares_regression <- tidy_df$sumsq[1]
  sum_squares_residuals <- tidy_df$sumsq[2]

  R_squared <- sum_squares_regression /
            (sum_squares_regression + sum_squares_residuals)*100

  tidier_df <- data.frame(Term = character(),df = numeric(),
                          SumSq = numeric(),MeanSq = numeric(),
                          F.statistic = numeric(),
                          R_squared = numeric(),p.value = character(),
                          stringsAsFactors = FALSE)
  
  tidier_df[1,"Term"] <- tidy_df$term[1]
  tidier_df[2,"Term"] <- tidy_df$term[2]
  tidier_df[1:2,2] <- (tidy_df$df)[1:2]
  tidier_df$SumSq <- round(tidy_df$sumsq[1:2],2)
  tidier_df$MeanSq <- round(tidy_df$meansq[1:2],3)
  tidier_df$F.statistic <- round(tidy_df$statistic,2)
  tidier_df[1,"R_squared"] <- round(R_squared,2)
  tidier_df[2,"R_squared"] <- 100-(round(R_squared,2))
  tidier_df[1,"P.value"] <- prettyNum(tidy_df$p.value[1],digits=2)

  # Return ANOVA results for the specified taxa_of_interest
  return(tidier_df)
}
```

### Bac {.unnumbered}

\
range of site dispersions:


```r
summary(betadisp_Site_Bac_addC$group.distances)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.3596  0.3912  0.4175  0.4162  0.4360  0.5076
```

\

#### Perform ANOVA

probably removing in favor of perm F test (following)

`betadisp_Site_Bac.aov <- perform_anova_betadisper(betadisp_Site_Bac_addC, "Site")`


```r
betadisp_Site_Bac.aov<-perform_anova_betadisper(betadisp_Site_Bac_addC, "Site")
betadisp_Site_Bac.aov
```

\

#### Permutation test for F with post-hoc Tukey's HSD {.tabset}

\
\
`vegan::permutest(betadisp_Site_Bac_addC, permutations = 999, pairwise = F)`


```r
## Permutation test for F
betadisp_Site_Bac.pmod <- permutest(betadisp_Site_Bac_addC, permutations = 999, pairwise = F)

bdr2Bac<-prettyNum(betadisp_Site_Bac.pmod$tab$`Sum Sq`[1]/(sum(betadisp_Site_Bac.pmod$tab$`Sum Sq`)),digits=3)
```


```r
betadisp_Site_Bac.pmod
```

```
## 
## Permutation test for homogeneity of multivariate dispersions
## Permutation: free
## Number of permutations: 999
## 
## Response: Distances
##            Df  Sum Sq   Mean Sq      F N.Perm Pr(>F)    
## Groups     21 0.50316 0.0239599 14.104    999  0.001 ***
## Residuals 462 0.78483 0.0016988                         
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

\
\
[Impact of site on explainable variability of beta dispersions:]{.underline}

Permuted $F$ = 14.104\

Calculated $R^2$ = 0.391\
\

[**Post-hoc: compute Tukey HSD**]{.underline}\

`stats::TukeyHSD(betadisp_Site_Bac_addC, ordered = T)`


```r
## Tukey's Honest Significant Differences
(betadisp_Site_Bac_addC.HSD <- TukeyHSD(betadisp_Site_Bac_addC, ordered = T, conf.level = 0.95))
bdHSDBacs<-subset(as.data.frame(betadisp_Site_Bac_addC.HSD$group),`p adj` < 0.05)
# plot(betadisp_Site_Bac_addC.HSD)
```



```r
bdHSDBacs %>%
  kbl(caption = "Bacteria: Tukey HSD of site beta dispersion, subset to p.adj < 0.05",
            align = 'c',
      digits = c(3,3,3,4)
      # col.names = c("Number of OTUs","Number of samples")
      # format.args = format(list(big.mark = ',', digit))
      ) %>%
  kable_styling() %>%
  scroll_box(width = "60%", height = "400px")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:400px; overflow-x: scroll; width:60%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-7)Bacteria: Tukey HSD of site beta dispersion, subset to p.adj &lt; 0.05</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> diff </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> lwr </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> upr </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> p adj </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> FCP-RNF </td>
   <td style="text-align:center;"> 0.071 </td>
   <td style="text-align:center;"> 0.003 </td>
   <td style="text-align:center;"> 0.138 </td>
   <td style="text-align:center;"> 0.0272 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-RNF </td>
   <td style="text-align:center;"> 0.078 </td>
   <td style="text-align:center;"> 0.006 </td>
   <td style="text-align:center;"> 0.150 </td>
   <td style="text-align:center;"> 0.0166 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-RNF </td>
   <td style="text-align:center;"> 0.081 </td>
   <td style="text-align:center;"> 0.009 </td>
   <td style="text-align:center;"> 0.153 </td>
   <td style="text-align:center;"> 0.0093 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ-RNF </td>
   <td style="text-align:center;"> 0.083 </td>
   <td style="text-align:center;"> 0.017 </td>
   <td style="text-align:center;"> 0.148 </td>
   <td style="text-align:center;"> 0.0016 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF-RNF </td>
   <td style="text-align:center;"> 0.091 </td>
   <td style="text-align:center;"> 0.024 </td>
   <td style="text-align:center;"> 0.159 </td>
   <td style="text-align:center;"> 0.0003 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-RNF </td>
   <td style="text-align:center;"> 0.100 </td>
   <td style="text-align:center;"> 0.033 </td>
   <td style="text-align:center;"> 0.168 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-RNF </td>
   <td style="text-align:center;"> 0.148 </td>
   <td style="text-align:center;"> 0.082 </td>
   <td style="text-align:center;"> 0.214 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-CPR </td>
   <td style="text-align:center;"> 0.054 </td>
   <td style="text-align:center;"> 0.001 </td>
   <td style="text-align:center;"> 0.107 </td>
   <td style="text-align:center;"> 0.0434 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-CPR </td>
   <td style="text-align:center;"> 0.062 </td>
   <td style="text-align:center;"> 0.003 </td>
   <td style="text-align:center;"> 0.121 </td>
   <td style="text-align:center;"> 0.0300 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-CPR </td>
   <td style="text-align:center;"> 0.065 </td>
   <td style="text-align:center;"> 0.006 </td>
   <td style="text-align:center;"> 0.124 </td>
   <td style="text-align:center;"> 0.0153 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ-CPR </td>
   <td style="text-align:center;"> 0.066 </td>
   <td style="text-align:center;"> 0.014 </td>
   <td style="text-align:center;"> 0.117 </td>
   <td style="text-align:center;"> 0.0011 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF-CPR </td>
   <td style="text-align:center;"> 0.075 </td>
   <td style="text-align:center;"> 0.021 </td>
   <td style="text-align:center;"> 0.128 </td>
   <td style="text-align:center;"> 0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-CPR </td>
   <td style="text-align:center;"> 0.084 </td>
   <td style="text-align:center;"> 0.030 </td>
   <td style="text-align:center;"> 0.137 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-CPR </td>
   <td style="text-align:center;"> 0.131 </td>
   <td style="text-align:center;"> 0.079 </td>
   <td style="text-align:center;"> 0.183 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-HPG </td>
   <td style="text-align:center;"> 0.047 </td>
   <td style="text-align:center;"> 0.002 </td>
   <td style="text-align:center;"> 0.093 </td>
   <td style="text-align:center;"> 0.0322 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-HPG </td>
   <td style="text-align:center;"> 0.052 </td>
   <td style="text-align:center;"> 0.004 </td>
   <td style="text-align:center;"> 0.100 </td>
   <td style="text-align:center;"> 0.0157 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-HPG </td>
   <td style="text-align:center;"> 0.060 </td>
   <td style="text-align:center;"> 0.006 </td>
   <td style="text-align:center;"> 0.115 </td>
   <td style="text-align:center;"> 0.0132 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-HPG </td>
   <td style="text-align:center;"> 0.063 </td>
   <td style="text-align:center;"> 0.009 </td>
   <td style="text-align:center;"> 0.118 </td>
   <td style="text-align:center;"> 0.0060 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ-HPG </td>
   <td style="text-align:center;"> 0.064 </td>
   <td style="text-align:center;"> 0.018 </td>
   <td style="text-align:center;"> 0.110 </td>
   <td style="text-align:center;"> 0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF-HPG </td>
   <td style="text-align:center;"> 0.073 </td>
   <td style="text-align:center;"> 0.025 </td>
   <td style="text-align:center;"> 0.121 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-HPG </td>
   <td style="text-align:center;"> 0.082 </td>
   <td style="text-align:center;"> 0.034 </td>
   <td style="text-align:center;"> 0.130 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-HPG </td>
   <td style="text-align:center;"> 0.130 </td>
   <td style="text-align:center;"> 0.083 </td>
   <td style="text-align:center;"> 0.176 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF-GNF </td>
   <td style="text-align:center;"> 0.069 </td>
   <td style="text-align:center;"> 0.006 </td>
   <td style="text-align:center;"> 0.132 </td>
   <td style="text-align:center;"> 0.0162 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-GNF </td>
   <td style="text-align:center;"> 0.078 </td>
   <td style="text-align:center;"> 0.014 </td>
   <td style="text-align:center;"> 0.141 </td>
   <td style="text-align:center;"> 0.0023 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-GNF </td>
   <td style="text-align:center;"> 0.126 </td>
   <td style="text-align:center;"> 0.063 </td>
   <td style="text-align:center;"> 0.188 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-GMT </td>
   <td style="text-align:center;"> 0.052 </td>
   <td style="text-align:center;"> 0.001 </td>
   <td style="text-align:center;"> 0.104 </td>
   <td style="text-align:center;"> 0.0434 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ-GMT </td>
   <td style="text-align:center;"> 0.053 </td>
   <td style="text-align:center;"> 0.010 </td>
   <td style="text-align:center;"> 0.096 </td>
   <td style="text-align:center;"> 0.0017 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF-GMT </td>
   <td style="text-align:center;"> 0.062 </td>
   <td style="text-align:center;"> 0.017 </td>
   <td style="text-align:center;"> 0.107 </td>
   <td style="text-align:center;"> 0.0002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-GMT </td>
   <td style="text-align:center;"> 0.071 </td>
   <td style="text-align:center;"> 0.026 </td>
   <td style="text-align:center;"> 0.116 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-GMT </td>
   <td style="text-align:center;"> 0.119 </td>
   <td style="text-align:center;"> 0.075 </td>
   <td style="text-align:center;"> 0.162 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-KNZ </td>
   <td style="text-align:center;"> 0.035 </td>
   <td style="text-align:center;"> 0.002 </td>
   <td style="text-align:center;"> 0.069 </td>
   <td style="text-align:center;"> 0.0268 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-KNZ </td>
   <td style="text-align:center;"> 0.040 </td>
   <td style="text-align:center;"> 0.004 </td>
   <td style="text-align:center;"> 0.077 </td>
   <td style="text-align:center;"> 0.0141 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-KNZ </td>
   <td style="text-align:center;"> 0.048 </td>
   <td style="text-align:center;"> 0.003 </td>
   <td style="text-align:center;"> 0.093 </td>
   <td style="text-align:center;"> 0.0197 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-KNZ </td>
   <td style="text-align:center;"> 0.051 </td>
   <td style="text-align:center;"> 0.006 </td>
   <td style="text-align:center;"> 0.096 </td>
   <td style="text-align:center;"> 0.0077 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ-KNZ </td>
   <td style="text-align:center;"> 0.052 </td>
   <td style="text-align:center;"> 0.018 </td>
   <td style="text-align:center;"> 0.087 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF-KNZ </td>
   <td style="text-align:center;"> 0.061 </td>
   <td style="text-align:center;"> 0.024 </td>
   <td style="text-align:center;"> 0.098 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-KNZ </td>
   <td style="text-align:center;"> 0.070 </td>
   <td style="text-align:center;"> 0.033 </td>
   <td style="text-align:center;"> 0.107 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-KNZ </td>
   <td style="text-align:center;"> 0.118 </td>
   <td style="text-align:center;"> 0.083 </td>
   <td style="text-align:center;"> 0.153 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ-NWP </td>
   <td style="text-align:center;"> 0.046 </td>
   <td style="text-align:center;"> 0.004 </td>
   <td style="text-align:center;"> 0.088 </td>
   <td style="text-align:center;"> 0.0131 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF-NWP </td>
   <td style="text-align:center;"> 0.055 </td>
   <td style="text-align:center;"> 0.011 </td>
   <td style="text-align:center;"> 0.099 </td>
   <td style="text-align:center;"> 0.0014 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-NWP </td>
   <td style="text-align:center;"> 0.064 </td>
   <td style="text-align:center;"> 0.020 </td>
   <td style="text-align:center;"> 0.109 </td>
   <td style="text-align:center;"> 0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-NWP </td>
   <td style="text-align:center;"> 0.112 </td>
   <td style="text-align:center;"> 0.069 </td>
   <td style="text-align:center;"> 0.154 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF-UHC </td>
   <td style="text-align:center;"> 0.050 </td>
   <td style="text-align:center;"> 0.007 </td>
   <td style="text-align:center;"> 0.093 </td>
   <td style="text-align:center;"> 0.0071 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-UHC </td>
   <td style="text-align:center;"> 0.059 </td>
   <td style="text-align:center;"> 0.015 </td>
   <td style="text-align:center;"> 0.103 </td>
   <td style="text-align:center;"> 0.0003 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-UHC </td>
   <td style="text-align:center;"> 0.106 </td>
   <td style="text-align:center;"> 0.065 </td>
   <td style="text-align:center;"> 0.148 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF-ONF </td>
   <td style="text-align:center;"> 0.047 </td>
   <td style="text-align:center;"> 0.004 </td>
   <td style="text-align:center;"> 0.090 </td>
   <td style="text-align:center;"> 0.0153 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-ONF </td>
   <td style="text-align:center;"> 0.056 </td>
   <td style="text-align:center;"> 0.013 </td>
   <td style="text-align:center;"> 0.099 </td>
   <td style="text-align:center;"> 0.0008 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-ONF </td>
   <td style="text-align:center;"> 0.103 </td>
   <td style="text-align:center;"> 0.062 </td>
   <td style="text-align:center;"> 0.145 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-SEV </td>
   <td style="text-align:center;"> 0.098 </td>
   <td style="text-align:center;"> 0.045 </td>
   <td style="text-align:center;"> 0.152 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-BLM </td>
   <td style="text-align:center;"> 0.044 </td>
   <td style="text-align:center;"> 0.001 </td>
   <td style="text-align:center;"> 0.087 </td>
   <td style="text-align:center;"> 0.0354 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-BLM </td>
   <td style="text-align:center;"> 0.092 </td>
   <td style="text-align:center;"> 0.051 </td>
   <td style="text-align:center;"> 0.132 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-CAD </td>
   <td style="text-align:center;"> 0.041 </td>
   <td style="text-align:center;"> 0.003 </td>
   <td style="text-align:center;"> 0.079 </td>
   <td style="text-align:center;"> 0.0193 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-CAD </td>
   <td style="text-align:center;"> 0.089 </td>
   <td style="text-align:center;"> 0.053 </td>
   <td style="text-align:center;"> 0.124 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-SFA </td>
   <td style="text-align:center;"> 0.088 </td>
   <td style="text-align:center;"> 0.034 </td>
   <td style="text-align:center;"> 0.142 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-LAR </td>
   <td style="text-align:center;"> 0.084 </td>
   <td style="text-align:center;"> 0.045 </td>
   <td style="text-align:center;"> 0.123 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-HAR </td>
   <td style="text-align:center;"> 0.082 </td>
   <td style="text-align:center;"> 0.047 </td>
   <td style="text-align:center;"> 0.118 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-FCP </td>
   <td style="text-align:center;"> 0.077 </td>
   <td style="text-align:center;"> 0.038 </td>
   <td style="text-align:center;"> 0.116 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-BNP </td>
   <td style="text-align:center;"> 0.070 </td>
   <td style="text-align:center;"> 0.023 </td>
   <td style="text-align:center;"> 0.116 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-FMT </td>
   <td style="text-align:center;"> 0.067 </td>
   <td style="text-align:center;"> 0.020 </td>
   <td style="text-align:center;"> 0.113 </td>
   <td style="text-align:center;"> 0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-LBJ </td>
   <td style="text-align:center;"> 0.065 </td>
   <td style="text-align:center;"> 0.029 </td>
   <td style="text-align:center;"> 0.102 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-CNF </td>
   <td style="text-align:center;"> 0.057 </td>
   <td style="text-align:center;"> 0.018 </td>
   <td style="text-align:center;"> 0.096 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-DMT </td>
   <td style="text-align:center;"> 0.048 </td>
   <td style="text-align:center;"> 0.008 </td>
   <td style="text-align:center;"> 0.087 </td>
   <td style="text-align:center;"> 0.0029 </td>
  </tr>
</tbody>
</table></div>

\
\

### Fun {.unnumbered}

\
range of site dispersions:


```r
summary(betadisp_Site_Fun_addC$group.distances)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.5467  0.5955  0.6675  0.6628  0.7292  0.7698
```

\

#### Perform ANOVA

probably removing in favor of perm F test (following)

`betadisp_Site_Fun.aov <- perform_anova_betadisper(betadisp_Site_Fun_addC, "Site")`


```r
betadisp_Site_Fun.aov<-perform_anova_betadisper(betadisp_Site_Fun_addC, "Site")
```

\

#### Permutation test for F with post-hoc Tukey's HSD {.tabset}

\
\
`vegan::permutest(betadisp_Site_Fun_addC, permutations = 999, pairwise = F)`


```r
## Permutation test for F
betadisp_Site_Fun.pmod <- permutest(betadisp_Site_Fun_addC, permutations = 999, pairwise = F)
bdr2Fun<-prettyNum(betadisp_Site_Fun.pmod$tab$`Sum Sq`[1]/(sum(betadisp_Site_Fun.pmod$tab$`Sum Sq`)),digits=3)
```


```r
betadisp_Site_Fun.pmod
```

```
## 
## Permutation test for homogeneity of multivariate dispersions
## Permutation: free
## Number of permutations: 999
## 
## Response: Distances
##            Df  Sum Sq  Mean Sq      F N.Perm Pr(>F)    
## Groups     21 2.46260 0.117267 68.943    999  0.001 ***
## Residuals 462 0.78583 0.001701                         
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

\
\
[Impact of site on explainable variability of beta dispersions:]{.underline}

Permuted $F$ = 68.943\

Calculated $R^2$ = 0.758\
\

[**Post-hoc: compute Tukey HSD**]{.underline}\

`stats::TukeyHSD(betadisp_Site_Fun_addC, ordered = T)`


```r
## Tukey's Honest Significant Differences
(betadisp_Site_Fun_addC.HSD <- TukeyHSD(betadisp_Site_Fun_addC, ordered = T, conf.level = 0.95))
bdHSDFuns<-subset(as.data.frame(betadisp_Site_Fun_addC.HSD$group),`p adj` < 0.05)
# plot(betadisp_Site_Fun_addC.HSD)
```


```r
bdHSDFuns %>%
  kbl(caption = "Fungi: Tukey HSD of site beta dispersion, subset to p.adj < 0.05",
            align = 'c',
      digits = c(3,3,3,4)
      # col.names = c("Number of OTUs","Number of samples")
      # format.args = format(list(big.mark = ',', digit))
      ) %>%
  kable_styling() %>%
  scroll_box(width = "60%", height = "400px")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:400px; overflow-x: scroll; width:60%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-12)Fungi: Tukey HSD of site beta dispersion, subset to p.adj &lt; 0.05</caption>
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">   </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> diff </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> lwr </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> upr </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> p adj </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> ONF-GMT </td>
   <td style="text-align:center;"> 0.048 </td>
   <td style="text-align:center;"> 0.002 </td>
   <td style="text-align:center;"> 0.095 </td>
   <td style="text-align:center;"> 0.0320 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ-GMT </td>
   <td style="text-align:center;"> 0.050 </td>
   <td style="text-align:center;"> 0.007 </td>
   <td style="text-align:center;"> 0.093 </td>
   <td style="text-align:center;"> 0.0054 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BLM-GMT </td>
   <td style="text-align:center;"> 0.059 </td>
   <td style="text-align:center;"> 0.013 </td>
   <td style="text-align:center;"> 0.105 </td>
   <td style="text-align:center;"> 0.0011 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFA-GMT </td>
   <td style="text-align:center;"> 0.082 </td>
   <td style="text-align:center;"> 0.024 </td>
   <td style="text-align:center;"> 0.140 </td>
   <td style="text-align:center;"> 0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG-GMT </td>
   <td style="text-align:center;"> 0.103 </td>
   <td style="text-align:center;"> 0.051 </td>
   <td style="text-align:center;"> 0.154 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF-GMT </td>
   <td style="text-align:center;"> 0.116 </td>
   <td style="text-align:center;"> 0.050 </td>
   <td style="text-align:center;"> 0.182 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR-GMT </td>
   <td style="text-align:center;"> 0.126 </td>
   <td style="text-align:center;"> 0.069 </td>
   <td style="text-align:center;"> 0.182 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR-GMT </td>
   <td style="text-align:center;"> 0.135 </td>
   <td style="text-align:center;"> 0.091 </td>
   <td style="text-align:center;"> 0.180 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ-GMT </td>
   <td style="text-align:center;"> 0.160 </td>
   <td style="text-align:center;"> 0.119 </td>
   <td style="text-align:center;"> 0.201 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV-GMT </td>
   <td style="text-align:center;"> 0.167 </td>
   <td style="text-align:center;"> 0.109 </td>
   <td style="text-align:center;"> 0.226 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-GMT </td>
   <td style="text-align:center;"> 0.175 </td>
   <td style="text-align:center;"> 0.132 </td>
   <td style="text-align:center;"> 0.218 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-GMT </td>
   <td style="text-align:center;"> 0.185 </td>
   <td style="text-align:center;"> 0.143 </td>
   <td style="text-align:center;"> 0.227 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-GMT </td>
   <td style="text-align:center;"> 0.196 </td>
   <td style="text-align:center;"> 0.154 </td>
   <td style="text-align:center;"> 0.238 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-GMT </td>
   <td style="text-align:center;"> 0.198 </td>
   <td style="text-align:center;"> 0.147 </td>
   <td style="text-align:center;"> 0.250 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-GMT </td>
   <td style="text-align:center;"> 0.201 </td>
   <td style="text-align:center;"> 0.157 </td>
   <td style="text-align:center;"> 0.246 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-GMT </td>
   <td style="text-align:center;"> 0.203 </td>
   <td style="text-align:center;"> 0.151 </td>
   <td style="text-align:center;"> 0.254 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-GMT </td>
   <td style="text-align:center;"> 0.223 </td>
   <td style="text-align:center;"> 0.178 </td>
   <td style="text-align:center;"> 0.268 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFA-UHC </td>
   <td style="text-align:center;"> 0.066 </td>
   <td style="text-align:center;"> 0.009 </td>
   <td style="text-align:center;"> 0.123 </td>
   <td style="text-align:center;"> 0.0073 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG-UHC </td>
   <td style="text-align:center;"> 0.086 </td>
   <td style="text-align:center;"> 0.036 </td>
   <td style="text-align:center;"> 0.137 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF-UHC </td>
   <td style="text-align:center;"> 0.100 </td>
   <td style="text-align:center;"> 0.035 </td>
   <td style="text-align:center;"> 0.165 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR-UHC </td>
   <td style="text-align:center;"> 0.109 </td>
   <td style="text-align:center;"> 0.054 </td>
   <td style="text-align:center;"> 0.165 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR-UHC </td>
   <td style="text-align:center;"> 0.119 </td>
   <td style="text-align:center;"> 0.076 </td>
   <td style="text-align:center;"> 0.162 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ-UHC </td>
   <td style="text-align:center;"> 0.144 </td>
   <td style="text-align:center;"> 0.104 </td>
   <td style="text-align:center;"> 0.184 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV-UHC </td>
   <td style="text-align:center;"> 0.151 </td>
   <td style="text-align:center;"> 0.094 </td>
   <td style="text-align:center;"> 0.208 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-UHC </td>
   <td style="text-align:center;"> 0.159 </td>
   <td style="text-align:center;"> 0.117 </td>
   <td style="text-align:center;"> 0.201 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-UHC </td>
   <td style="text-align:center;"> 0.169 </td>
   <td style="text-align:center;"> 0.128 </td>
   <td style="text-align:center;"> 0.209 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-UHC </td>
   <td style="text-align:center;"> 0.180 </td>
   <td style="text-align:center;"> 0.139 </td>
   <td style="text-align:center;"> 0.220 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-UHC </td>
   <td style="text-align:center;"> 0.182 </td>
   <td style="text-align:center;"> 0.132 </td>
   <td style="text-align:center;"> 0.232 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-UHC </td>
   <td style="text-align:center;"> 0.185 </td>
   <td style="text-align:center;"> 0.142 </td>
   <td style="text-align:center;"> 0.228 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-UHC </td>
   <td style="text-align:center;"> 0.187 </td>
   <td style="text-align:center;"> 0.136 </td>
   <td style="text-align:center;"> 0.237 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-UHC </td>
   <td style="text-align:center;"> 0.207 </td>
   <td style="text-align:center;"> 0.163 </td>
   <td style="text-align:center;"> 0.251 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG-CNF </td>
   <td style="text-align:center;"> 0.068 </td>
   <td style="text-align:center;"> 0.020 </td>
   <td style="text-align:center;"> 0.116 </td>
   <td style="text-align:center;"> 0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF-CNF </td>
   <td style="text-align:center;"> 0.082 </td>
   <td style="text-align:center;"> 0.018 </td>
   <td style="text-align:center;"> 0.145 </td>
   <td style="text-align:center;"> 0.0008 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR-CNF </td>
   <td style="text-align:center;"> 0.091 </td>
   <td style="text-align:center;"> 0.038 </td>
   <td style="text-align:center;"> 0.144 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR-CNF </td>
   <td style="text-align:center;"> 0.101 </td>
   <td style="text-align:center;"> 0.060 </td>
   <td style="text-align:center;"> 0.141 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ-CNF </td>
   <td style="text-align:center;"> 0.125 </td>
   <td style="text-align:center;"> 0.089 </td>
   <td style="text-align:center;"> 0.162 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV-CNF </td>
   <td style="text-align:center;"> 0.133 </td>
   <td style="text-align:center;"> 0.078 </td>
   <td style="text-align:center;"> 0.188 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-CNF </td>
   <td style="text-align:center;"> 0.140 </td>
   <td style="text-align:center;"> 0.102 </td>
   <td style="text-align:center;"> 0.179 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-CNF </td>
   <td style="text-align:center;"> 0.150 </td>
   <td style="text-align:center;"> 0.113 </td>
   <td style="text-align:center;"> 0.188 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-CNF </td>
   <td style="text-align:center;"> 0.162 </td>
   <td style="text-align:center;"> 0.124 </td>
   <td style="text-align:center;"> 0.199 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-CNF </td>
   <td style="text-align:center;"> 0.164 </td>
   <td style="text-align:center;"> 0.116 </td>
   <td style="text-align:center;"> 0.212 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-CNF </td>
   <td style="text-align:center;"> 0.167 </td>
   <td style="text-align:center;"> 0.126 </td>
   <td style="text-align:center;"> 0.207 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-CNF </td>
   <td style="text-align:center;"> 0.168 </td>
   <td style="text-align:center;"> 0.120 </td>
   <td style="text-align:center;"> 0.216 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-CNF </td>
   <td style="text-align:center;"> 0.189 </td>
   <td style="text-align:center;"> 0.148 </td>
   <td style="text-align:center;"> 0.230 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR-RNF </td>
   <td style="text-align:center;"> 0.089 </td>
   <td style="text-align:center;"> 0.013 </td>
   <td style="text-align:center;"> 0.164 </td>
   <td style="text-align:center;"> 0.0052 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR-RNF </td>
   <td style="text-align:center;"> 0.098 </td>
   <td style="text-align:center;"> 0.031 </td>
   <td style="text-align:center;"> 0.166 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ-RNF </td>
   <td style="text-align:center;"> 0.123 </td>
   <td style="text-align:center;"> 0.058 </td>
   <td style="text-align:center;"> 0.188 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV-RNF </td>
   <td style="text-align:center;"> 0.130 </td>
   <td style="text-align:center;"> 0.053 </td>
   <td style="text-align:center;"> 0.207 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-RNF </td>
   <td style="text-align:center;"> 0.138 </td>
   <td style="text-align:center;"> 0.072 </td>
   <td style="text-align:center;"> 0.204 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-RNF </td>
   <td style="text-align:center;"> 0.148 </td>
   <td style="text-align:center;"> 0.083 </td>
   <td style="text-align:center;"> 0.214 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-RNF </td>
   <td style="text-align:center;"> 0.159 </td>
   <td style="text-align:center;"> 0.094 </td>
   <td style="text-align:center;"> 0.225 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-RNF </td>
   <td style="text-align:center;"> 0.161 </td>
   <td style="text-align:center;"> 0.089 </td>
   <td style="text-align:center;"> 0.233 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-RNF </td>
   <td style="text-align:center;"> 0.164 </td>
   <td style="text-align:center;"> 0.097 </td>
   <td style="text-align:center;"> 0.232 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-RNF </td>
   <td style="text-align:center;"> 0.166 </td>
   <td style="text-align:center;"> 0.094 </td>
   <td style="text-align:center;"> 0.238 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-RNF </td>
   <td style="text-align:center;"> 0.186 </td>
   <td style="text-align:center;"> 0.119 </td>
   <td style="text-align:center;"> 0.254 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG-NWP </td>
   <td style="text-align:center;"> 0.063 </td>
   <td style="text-align:center;"> 0.013 </td>
   <td style="text-align:center;"> 0.114 </td>
   <td style="text-align:center;"> 0.0017 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF-NWP </td>
   <td style="text-align:center;"> 0.077 </td>
   <td style="text-align:center;"> 0.011 </td>
   <td style="text-align:center;"> 0.142 </td>
   <td style="text-align:center;"> 0.0050 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR-NWP </td>
   <td style="text-align:center;"> 0.086 </td>
   <td style="text-align:center;"> 0.030 </td>
   <td style="text-align:center;"> 0.142 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR-NWP </td>
   <td style="text-align:center;"> 0.096 </td>
   <td style="text-align:center;"> 0.052 </td>
   <td style="text-align:center;"> 0.140 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ-NWP </td>
   <td style="text-align:center;"> 0.121 </td>
   <td style="text-align:center;"> 0.080 </td>
   <td style="text-align:center;"> 0.161 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV-NWP </td>
   <td style="text-align:center;"> 0.128 </td>
   <td style="text-align:center;"> 0.070 </td>
   <td style="text-align:center;"> 0.186 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-NWP </td>
   <td style="text-align:center;"> 0.136 </td>
   <td style="text-align:center;"> 0.093 </td>
   <td style="text-align:center;"> 0.178 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-NWP </td>
   <td style="text-align:center;"> 0.146 </td>
   <td style="text-align:center;"> 0.104 </td>
   <td style="text-align:center;"> 0.187 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-NWP </td>
   <td style="text-align:center;"> 0.157 </td>
   <td style="text-align:center;"> 0.116 </td>
   <td style="text-align:center;"> 0.198 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-NWP </td>
   <td style="text-align:center;"> 0.159 </td>
   <td style="text-align:center;"> 0.108 </td>
   <td style="text-align:center;"> 0.210 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-NWP </td>
   <td style="text-align:center;"> 0.162 </td>
   <td style="text-align:center;"> 0.118 </td>
   <td style="text-align:center;"> 0.206 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-NWP </td>
   <td style="text-align:center;"> 0.164 </td>
   <td style="text-align:center;"> 0.113 </td>
   <td style="text-align:center;"> 0.215 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-NWP </td>
   <td style="text-align:center;"> 0.184 </td>
   <td style="text-align:center;"> 0.140 </td>
   <td style="text-align:center;"> 0.228 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG-ONF </td>
   <td style="text-align:center;"> 0.054 </td>
   <td style="text-align:center;"> 0.004 </td>
   <td style="text-align:center;"> 0.104 </td>
   <td style="text-align:center;"> 0.0168 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF-ONF </td>
   <td style="text-align:center;"> 0.068 </td>
   <td style="text-align:center;"> 0.003 </td>
   <td style="text-align:center;"> 0.132 </td>
   <td style="text-align:center;"> 0.0285 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR-ONF </td>
   <td style="text-align:center;"> 0.077 </td>
   <td style="text-align:center;"> 0.022 </td>
   <td style="text-align:center;"> 0.132 </td>
   <td style="text-align:center;"> 0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR-ONF </td>
   <td style="text-align:center;"> 0.087 </td>
   <td style="text-align:center;"> 0.044 </td>
   <td style="text-align:center;"> 0.130 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ-ONF </td>
   <td style="text-align:center;"> 0.112 </td>
   <td style="text-align:center;"> 0.072 </td>
   <td style="text-align:center;"> 0.151 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV-ONF </td>
   <td style="text-align:center;"> 0.119 </td>
   <td style="text-align:center;"> 0.062 </td>
   <td style="text-align:center;"> 0.176 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-ONF </td>
   <td style="text-align:center;"> 0.127 </td>
   <td style="text-align:center;"> 0.085 </td>
   <td style="text-align:center;"> 0.168 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-ONF </td>
   <td style="text-align:center;"> 0.137 </td>
   <td style="text-align:center;"> 0.096 </td>
   <td style="text-align:center;"> 0.177 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-ONF </td>
   <td style="text-align:center;"> 0.148 </td>
   <td style="text-align:center;"> 0.108 </td>
   <td style="text-align:center;"> 0.188 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-ONF </td>
   <td style="text-align:center;"> 0.150 </td>
   <td style="text-align:center;"> 0.100 </td>
   <td style="text-align:center;"> 0.200 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-ONF </td>
   <td style="text-align:center;"> 0.153 </td>
   <td style="text-align:center;"> 0.110 </td>
   <td style="text-align:center;"> 0.196 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-ONF </td>
   <td style="text-align:center;"> 0.154 </td>
   <td style="text-align:center;"> 0.105 </td>
   <td style="text-align:center;"> 0.204 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-ONF </td>
   <td style="text-align:center;"> 0.175 </td>
   <td style="text-align:center;"> 0.131 </td>
   <td style="text-align:center;"> 0.218 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG-LBJ </td>
   <td style="text-align:center;"> 0.053 </td>
   <td style="text-align:center;"> 0.007 </td>
   <td style="text-align:center;"> 0.099 </td>
   <td style="text-align:center;"> 0.0080 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF-LBJ </td>
   <td style="text-align:center;"> 0.066 </td>
   <td style="text-align:center;"> 0.004 </td>
   <td style="text-align:center;"> 0.128 </td>
   <td style="text-align:center;"> 0.0213 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR-LBJ </td>
   <td style="text-align:center;"> 0.076 </td>
   <td style="text-align:center;"> 0.024 </td>
   <td style="text-align:center;"> 0.127 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR-LBJ </td>
   <td style="text-align:center;"> 0.085 </td>
   <td style="text-align:center;"> 0.047 </td>
   <td style="text-align:center;"> 0.124 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ-LBJ </td>
   <td style="text-align:center;"> 0.110 </td>
   <td style="text-align:center;"> 0.076 </td>
   <td style="text-align:center;"> 0.144 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV-LBJ </td>
   <td style="text-align:center;"> 0.117 </td>
   <td style="text-align:center;"> 0.064 </td>
   <td style="text-align:center;"> 0.171 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-LBJ </td>
   <td style="text-align:center;"> 0.125 </td>
   <td style="text-align:center;"> 0.088 </td>
   <td style="text-align:center;"> 0.162 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-LBJ </td>
   <td style="text-align:center;"> 0.135 </td>
   <td style="text-align:center;"> 0.100 </td>
   <td style="text-align:center;"> 0.170 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-LBJ </td>
   <td style="text-align:center;"> 0.146 </td>
   <td style="text-align:center;"> 0.111 </td>
   <td style="text-align:center;"> 0.181 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-LBJ </td>
   <td style="text-align:center;"> 0.148 </td>
   <td style="text-align:center;"> 0.102 </td>
   <td style="text-align:center;"> 0.195 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-LBJ </td>
   <td style="text-align:center;"> 0.151 </td>
   <td style="text-align:center;"> 0.113 </td>
   <td style="text-align:center;"> 0.190 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-LBJ </td>
   <td style="text-align:center;"> 0.153 </td>
   <td style="text-align:center;"> 0.107 </td>
   <td style="text-align:center;"> 0.199 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-LBJ </td>
   <td style="text-align:center;"> 0.173 </td>
   <td style="text-align:center;"> 0.134 </td>
   <td style="text-align:center;"> 0.212 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR-BLM </td>
   <td style="text-align:center;"> 0.067 </td>
   <td style="text-align:center;"> 0.012 </td>
   <td style="text-align:center;"> 0.121 </td>
   <td style="text-align:center;"> 0.0026 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR-BLM </td>
   <td style="text-align:center;"> 0.076 </td>
   <td style="text-align:center;"> 0.034 </td>
   <td style="text-align:center;"> 0.119 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ-BLM </td>
   <td style="text-align:center;"> 0.101 </td>
   <td style="text-align:center;"> 0.062 </td>
   <td style="text-align:center;"> 0.140 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV-BLM </td>
   <td style="text-align:center;"> 0.108 </td>
   <td style="text-align:center;"> 0.052 </td>
   <td style="text-align:center;"> 0.165 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-BLM </td>
   <td style="text-align:center;"> 0.116 </td>
   <td style="text-align:center;"> 0.075 </td>
   <td style="text-align:center;"> 0.157 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-BLM </td>
   <td style="text-align:center;"> 0.126 </td>
   <td style="text-align:center;"> 0.086 </td>
   <td style="text-align:center;"> 0.166 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-BLM </td>
   <td style="text-align:center;"> 0.137 </td>
   <td style="text-align:center;"> 0.098 </td>
   <td style="text-align:center;"> 0.177 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-BLM </td>
   <td style="text-align:center;"> 0.139 </td>
   <td style="text-align:center;"> 0.090 </td>
   <td style="text-align:center;"> 0.189 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-BLM </td>
   <td style="text-align:center;"> 0.142 </td>
   <td style="text-align:center;"> 0.100 </td>
   <td style="text-align:center;"> 0.185 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-BLM </td>
   <td style="text-align:center;"> 0.144 </td>
   <td style="text-align:center;"> 0.094 </td>
   <td style="text-align:center;"> 0.193 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-BLM </td>
   <td style="text-align:center;"> 0.164 </td>
   <td style="text-align:center;"> 0.121 </td>
   <td style="text-align:center;"> 0.207 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ-SFA </td>
   <td style="text-align:center;"> 0.078 </td>
   <td style="text-align:center;"> 0.025 </td>
   <td style="text-align:center;"> 0.130 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV-SFA </td>
   <td style="text-align:center;"> 0.085 </td>
   <td style="text-align:center;"> 0.019 </td>
   <td style="text-align:center;"> 0.152 </td>
   <td style="text-align:center;"> 0.0010 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-SFA </td>
   <td style="text-align:center;"> 0.093 </td>
   <td style="text-align:center;"> 0.039 </td>
   <td style="text-align:center;"> 0.147 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-SFA </td>
   <td style="text-align:center;"> 0.103 </td>
   <td style="text-align:center;"> 0.050 </td>
   <td style="text-align:center;"> 0.156 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-SFA </td>
   <td style="text-align:center;"> 0.114 </td>
   <td style="text-align:center;"> 0.061 </td>
   <td style="text-align:center;"> 0.167 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-SFA </td>
   <td style="text-align:center;"> 0.116 </td>
   <td style="text-align:center;"> 0.055 </td>
   <td style="text-align:center;"> 0.177 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-SFA </td>
   <td style="text-align:center;"> 0.119 </td>
   <td style="text-align:center;"> 0.064 </td>
   <td style="text-align:center;"> 0.174 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-SFA </td>
   <td style="text-align:center;"> 0.121 </td>
   <td style="text-align:center;"> 0.060 </td>
   <td style="text-align:center;"> 0.182 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-SFA </td>
   <td style="text-align:center;"> 0.141 </td>
   <td style="text-align:center;"> 0.086 </td>
   <td style="text-align:center;"> 0.196 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ-HPG </td>
   <td style="text-align:center;"> 0.057 </td>
   <td style="text-align:center;"> 0.012 </td>
   <td style="text-align:center;"> 0.102 </td>
   <td style="text-align:center;"> 0.0010 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV-HPG </td>
   <td style="text-align:center;"> 0.065 </td>
   <td style="text-align:center;"> 0.004 </td>
   <td style="text-align:center;"> 0.125 </td>
   <td style="text-align:center;"> 0.0236 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-HPG </td>
   <td style="text-align:center;"> 0.072 </td>
   <td style="text-align:center;"> 0.026 </td>
   <td style="text-align:center;"> 0.119 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-HPG </td>
   <td style="text-align:center;"> 0.082 </td>
   <td style="text-align:center;"> 0.037 </td>
   <td style="text-align:center;"> 0.128 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-HPG </td>
   <td style="text-align:center;"> 0.093 </td>
   <td style="text-align:center;"> 0.048 </td>
   <td style="text-align:center;"> 0.139 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-HPG </td>
   <td style="text-align:center;"> 0.096 </td>
   <td style="text-align:center;"> 0.041 </td>
   <td style="text-align:center;"> 0.150 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-HPG </td>
   <td style="text-align:center;"> 0.098 </td>
   <td style="text-align:center;"> 0.050 </td>
   <td style="text-align:center;"> 0.147 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-HPG </td>
   <td style="text-align:center;"> 0.100 </td>
   <td style="text-align:center;"> 0.046 </td>
   <td style="text-align:center;"> 0.155 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-HPG </td>
   <td style="text-align:center;"> 0.120 </td>
   <td style="text-align:center;"> 0.072 </td>
   <td style="text-align:center;"> 0.169 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-GNF </td>
   <td style="text-align:center;"> 0.069 </td>
   <td style="text-align:center;"> 0.007 </td>
   <td style="text-align:center;"> 0.130 </td>
   <td style="text-align:center;"> 0.0107 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-GNF </td>
   <td style="text-align:center;"> 0.080 </td>
   <td style="text-align:center;"> 0.019 </td>
   <td style="text-align:center;"> 0.141 </td>
   <td style="text-align:center;"> 0.0007 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-GNF </td>
   <td style="text-align:center;"> 0.082 </td>
   <td style="text-align:center;"> 0.014 </td>
   <td style="text-align:center;"> 0.150 </td>
   <td style="text-align:center;"> 0.0033 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-GNF </td>
   <td style="text-align:center;"> 0.085 </td>
   <td style="text-align:center;"> 0.022 </td>
   <td style="text-align:center;"> 0.148 </td>
   <td style="text-align:center;"> 0.0003 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-GNF </td>
   <td style="text-align:center;"> 0.087 </td>
   <td style="text-align:center;"> 0.018 </td>
   <td style="text-align:center;"> 0.155 </td>
   <td style="text-align:center;"> 0.0012 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-GNF </td>
   <td style="text-align:center;"> 0.107 </td>
   <td style="text-align:center;"> 0.043 </td>
   <td style="text-align:center;"> 0.170 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-CPR </td>
   <td style="text-align:center;"> 0.059 </td>
   <td style="text-align:center;"> 0.008 </td>
   <td style="text-align:center;"> 0.111 </td>
   <td style="text-align:center;"> 0.0061 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-CPR </td>
   <td style="text-align:center;"> 0.071 </td>
   <td style="text-align:center;"> 0.019 </td>
   <td style="text-align:center;"> 0.122 </td>
   <td style="text-align:center;"> 0.0002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-CPR </td>
   <td style="text-align:center;"> 0.073 </td>
   <td style="text-align:center;"> 0.014 </td>
   <td style="text-align:center;"> 0.132 </td>
   <td style="text-align:center;"> 0.0022 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-CPR </td>
   <td style="text-align:center;"> 0.076 </td>
   <td style="text-align:center;"> 0.022 </td>
   <td style="text-align:center;"> 0.129 </td>
   <td style="text-align:center;"> 0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-CPR </td>
   <td style="text-align:center;"> 0.077 </td>
   <td style="text-align:center;"> 0.018 </td>
   <td style="text-align:center;"> 0.136 </td>
   <td style="text-align:center;"> 0.0007 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-CPR </td>
   <td style="text-align:center;"> 0.098 </td>
   <td style="text-align:center;"> 0.044 </td>
   <td style="text-align:center;"> 0.151 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE-LAR </td>
   <td style="text-align:center;"> 0.040 </td>
   <td style="text-align:center;"> 0.001 </td>
   <td style="text-align:center;"> 0.079 </td>
   <td style="text-align:center;"> 0.0380 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR-LAR </td>
   <td style="text-align:center;"> 0.050 </td>
   <td style="text-align:center;"> 0.012 </td>
   <td style="text-align:center;"> 0.088 </td>
   <td style="text-align:center;"> 0.0005 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-LAR </td>
   <td style="text-align:center;"> 0.061 </td>
   <td style="text-align:center;"> 0.023 </td>
   <td style="text-align:center;"> 0.098 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT-LAR </td>
   <td style="text-align:center;"> 0.063 </td>
   <td style="text-align:center;"> 0.015 </td>
   <td style="text-align:center;"> 0.111 </td>
   <td style="text-align:center;"> 0.0006 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-LAR </td>
   <td style="text-align:center;"> 0.066 </td>
   <td style="text-align:center;"> 0.025 </td>
   <td style="text-align:center;"> 0.107 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP-LAR </td>
   <td style="text-align:center;"> 0.068 </td>
   <td style="text-align:center;"> 0.020 </td>
   <td style="text-align:center;"> 0.116 </td>
   <td style="text-align:center;"> 0.0001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-LAR </td>
   <td style="text-align:center;"> 0.088 </td>
   <td style="text-align:center;"> 0.047 </td>
   <td style="text-align:center;"> 0.129 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD-KNZ </td>
   <td style="text-align:center;"> 0.036 </td>
   <td style="text-align:center;"> 0.003 </td>
   <td style="text-align:center;"> 0.069 </td>
   <td style="text-align:center;"> 0.0184 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP-KNZ </td>
   <td style="text-align:center;"> 0.041 </td>
   <td style="text-align:center;"> 0.004 </td>
   <td style="text-align:center;"> 0.078 </td>
   <td style="text-align:center;"> 0.0107 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-KNZ </td>
   <td style="text-align:center;"> 0.063 </td>
   <td style="text-align:center;"> 0.026 </td>
   <td style="text-align:center;"> 0.100 </td>
   <td style="text-align:center;"> 0.0000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-SEV </td>
   <td style="text-align:center;"> 0.056 </td>
   <td style="text-align:center;"> 0.000 </td>
   <td style="text-align:center;"> 0.111 </td>
   <td style="text-align:center;"> 0.0469 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT-KAE </td>
   <td style="text-align:center;"> 0.048 </td>
   <td style="text-align:center;"> 0.009 </td>
   <td style="text-align:center;"> 0.087 </td>
   <td style="text-align:center;"> 0.0025 </td>
  </tr>
</tbody>
</table></div>

\



## Table set-up {.unnumbered .unlisted .hidden}


```r
Bac_gamma_Site.df <- (data.frame(
  "Site"=rownames(Bac_gamma_Site3temp),
  "n (# of samples per site)"=as.numeric(Bac_gamma_Site3temp$`n (# of samples per site)`),
  "# of grass hosts per site"=as.numeric(Bac_gamma_Site3temp$ngrass_persite),
  "Gamma (# total unique OTUs)"=as.numeric(Bac_gamma_Site3temp$`Gamma (# total unique OTUs)`),
  "Gamma / n" = as.numeric(Bac_gamma_Site3temp$Gamma_over_n),
  "Observed mean 𝝰" = as.numeric(Bac_gamma_Site3temp$`Observed mean 𝝰`),
  "mean prop. of gamma detected per sample" = as.numeric(round(Bac_gamma_Site3temp$`mean prop. of gamma / sample`,3)),
                       "SD prop. of gamma detected per sample" = as.numeric(round(Bac_gamma_Site3temp$`sd prop. of gamma / sample`,3))
  ,check.names=F))

Bac_gamma_Site.df$Site_unordered <- as.factor(Bac_gamma_Site.df$Site)
Bac_gamma_Site.df$Site <- as.factor(Bac_gamma_Site.df$Site)
Bac_gamma_Site.df$Site <- factor(Bac_gamma_Site.df$Site,levels=c(site_levels),ordered = T)


Fun_gamma_Site.df <- (data.frame(
  "Site"=rownames(Fun_gamma_Site3temp),
  "n (# of samples per site)"=as.numeric(Fun_gamma_Site3temp$`n (# of samples per site)`),
  "# of grass hosts per site"=as.numeric(Fun_gamma_Site3temp$ngrass_persite),
  "Gamma (# total unique OTUs)"=as.numeric(Fun_gamma_Site3temp$`Gamma (# total unique OTUs)`),
  "Gamma / n" = as.numeric(Fun_gamma_Site3temp$Gamma_over_n),
  "Observed mean 𝝰" = as.numeric(Fun_gamma_Site3temp$`Observed mean 𝝰`),
  "mean prop. of gamma detected per sample" = as.numeric(round(Fun_gamma_Site3temp$`mean prop. of gamma / sample`,3)),
                       "SD prop. of gamma detected per sample" = as.numeric(round(Fun_gamma_Site3temp$`sd prop. of gamma / sample`,3))
  ,check.names=F))

Fun_gamma_Site.df$Site_unordered <- as.factor(Fun_gamma_Site.df$Site)
Fun_gamma_Site.df$Site <- as.factor(Fun_gamma_Site.df$Site)
Fun_gamma_Site.df$Site <- factor(Fun_gamma_Site.df$Site,levels=c(site_levels),ordered = T)
```


## Tables: Gamma diversity and beta dispersion {.tabset}

\

### Bac


```r
Bac_gamma_Site.df$BetaDisp <- round(betadisp_Site_Bac_addC$group.distances,3)
Bac_gamma_Site.df[,c(1:8,10)]
```

\

### Fun


```r
Fun_gamma_Site.df$BetaDisp <- round(betadisp_Site_Fun_addC$group.distances,3)
Fun_gamma_Site.df[,c(1:8,10)]
```

\

## ANOSIM

[TBD]



\

# Tables: alpha beta gamma diversity of sites {.tabset}

\


\

## Bac


\

## Fun 



\
\

# Statistical testing

\

## normality and density plot of site gamma {.tabset}

\

### Bac


```r
shapiro.test(Bac_gamma_Site.df$`Gamma (# total unique OTUs)`)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  Bac_gamma_Site.df$`Gamma (# total unique OTUs)`
## W = 0.95319, p-value = 0.3648
```

```r
ggqqplot(Bac_gamma_Site.df$`Gamma (# total unique OTUs)`)
ggdensity(Bac_gamma_Site.df$`Gamma (# total unique OTUs)`, 
          main = "Density plot of site gamma diversity (Bacteria)",
          xlab = "Size of regional species pool",
          add = "mean",xlim = c(0, 1450),rug=T)
```

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_AlphaBetaGamma_BySite_files/figure-html/unnamed-chunk-18-1.png" width="40%" /><img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_AlphaBetaGamma_BySite_files/figure-html/unnamed-chunk-18-2.png" width="40%" />

\

### Fun


```r
shapiro.test(Fun_gamma_Site.df$`Gamma (# total unique OTUs)`)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  Fun_gamma_Site.df$`Gamma (# total unique OTUs)`
## W = 0.96265, p-value = 0.5447
```

```r
ggqqplot(Fun_gamma_Site.df$`Gamma (# total unique OTUs)`)
ggdensity(Fun_gamma_Site.df$`Gamma (# total unique OTUs)`, 
          main = "Density plot of site gamma diversity (Fungi)",
          xlab = "Size of regional species pool",
          add = "mean",xlim = c(0, 1450),rug=T)
```

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_AlphaBetaGamma_BySite_files/figure-html/unnamed-chunk-19-1.png" width="40%" /><img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_AlphaBetaGamma_BySite_files/figure-html/unnamed-chunk-19-2.png" width="40%" />

\

## kruskal.test

[in-progress]

Predictor: # of grass hosts per site



```r
# does sample alpha vary by ngrass_persite
kruskal.test(fwc_alpha_Site$Observed~fwc_alpha_Site$ngrass_persite)
```

```
## 
## 	Kruskal-Wallis rank sum test
## 
## data:  fwc_alpha_Site$Observed by fwc_alpha_Site$ngrass_persite
## Kruskal-Wallis chi-squared = 38.431, df = 3, p-value = 2.291e-08
```



```r
# does site gamma vary by ngrass_persite
kruskal.test(Fun_gamma_Site2[,1]~Fun_gamma_Site3temp$ngrass_persite)
```

```
## 
## 	Kruskal-Wallis rank sum test
## 
## data:  Fun_gamma_Site2[, 1] by Fun_gamma_Site3temp$ngrass_persite
## Kruskal-Wallis chi-squared = 3.1963, df = 3, p-value = 0.3623
```

```r
# does site gamma/n vary by ngrass_persite
kruskal.test(Fun_gamma_Site3temp$`Gamma_over_n`~Fun_gamma_Site3temp$ngrass_persite)
```

```
## 
## 	Kruskal-Wallis rank sum test
## 
## data:  Fun_gamma_Site3temp$Gamma_over_n by Fun_gamma_Site3temp$ngrass_persite
## Kruskal-Wallis chi-squared = 1.2121, df = 3, p-value = 0.7501
```

```r
# does site obs_mean_alpha vary by ngrass_persite
kruskal.test(Fun_gamma_Site.df$`Observed mean 𝝰`~Fun_gamma_Site.df$`# of grass hosts per site`)
```

```
## 
## 	Kruskal-Wallis rank sum test
## 
## data:  Fun_gamma_Site.df$`Observed mean 𝝰` by Fun_gamma_Site.df$`# of grass hosts per site`
## Kruskal-Wallis chi-squared = 0.59157, df = 3, p-value = 0.8984
```

```r
# does site mean prop. of gamma detected per sample vary by ngrass_persite YES
kruskal.test(Fun_gamma_Site.df$`mean prop. of gamma detected per sample`~Fun_gamma_Site.df$`# of grass hosts per site`)
```

```
## 
## 	Kruskal-Wallis rank sum test
## 
## data:  Fun_gamma_Site.df$`mean prop. of gamma detected per sample` by Fun_gamma_Site.df$`# of grass hosts per site`
## Kruskal-Wallis chi-squared = 14.787, df = 3, p-value = 0.002008
```



# aov gamma {.hidden .unlisted}



# plot alpha obs v exp {.hidden .unlisted}


```r
ggplot(aes(x=Bac_gamma_Site.df$`Observed mean 𝝰`,y=Fun_gamma_Site.df$`Observed mean 𝝰`,color=Site),data=Bac_gamma_Site.df)+
  geom_point(size=3)+
  scale_color_manual(values = latlong_cols)+
  # geom_abline(aes(slope = 1,intercept=0),data=Fun_gamma_Site.df, color="black")+
 labs(y="Fungi: Obs mean alpha",x="Bacteria: Obs mean alpha",color="Site")+
  theme_bw() +
  theme(legend.position="right",
    axis.text = element_text(color="black", size=10),
    axis.title = element_text(color="black", size=12),
    legend.text = element_text(color="black", size=8),legend.title = element_text(color="black", size=10),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

ggplot(aes(x=Bac_gamma_Site.df$`Observed mean 𝝰`,y=Bac_gamma_Site.df$`Expected mean 𝝰`,color=Site),data=Bac_gamma_Site.df)+
  geom_point(size=3)+
  scale_color_manual(values = latlong_cols)+
  scale_x_continuous(limits = c(0,2000))+
  scale_y_continuous(limits = c(0,750))+
  geom_abline(aes(slope = 1,intercept=0),data=Fun_gamma_Site.df, color="black")+
  labs(y="Gamma_over_n",x="Observed mean alpha",color="Site",title = "Bacteria")+
  theme_bw() +
  theme(legend.position="right",
    axis.text = element_text(color="black", size=10),
    axis.title = element_text(color="black", size=12),
    legend.text = element_text(color="black", size=8),legend.title = element_text(color="black", size=10),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())


ggplot(aes(x=Fun_gamma_Site.df$`Observed mean 𝝰`,y=Fun_gamma_Site.df$`Expected mean 𝝰`,color=Site),data=Fun_gamma_Site.df)+
  geom_point(size=3)+
  scale_x_continuous(limits = c(0,300))+
  scale_y_continuous(limits = c(0,100))+
  scale_color_manual(values = latlong_cols)+
  geom_abline(aes(slope = 1,intercept=0),data=Fun_gamma_Site.df, color="black")+
  labs(y="Gamma_over_n",x="Observed mean alpha",color="Site",title = "Fungi")+
  theme_bw() +
  theme(legend.position="right",
    axis.text = element_text(color="black", size=10),
    axis.title = element_text(color="black", size=12),
    legend.text = element_text(color="black", size=8),legend.title = element_text(color="black", size=10),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

ggplot(aes(x=Fun_gamma_Site.df$`Observed mean 𝝰`,y=Fun_gamma_Site.df$`Expected mean 𝝰`,color=Site),data=Fun_gamma_Site.df)+
  geom_point(size=3)+
  scale_x_continuous(limits = c(0,300))+
  scale_y_continuous(limits = c(0,100))+
  scale_color_manual(values = latlong_cols)+
  geom_abline(aes(slope = 1,intercept=0),data=Fun_gamma_Site.df, color="black")+
  labs(y="Gamma_over_n",x="Observed mean alpha",color="Site",title = "Fungi")+
  theme_bw() +
  theme(legend.position="right",
    axis.text = element_text(color="black", size=10),
    axis.title = element_text(color="black", size=12),
    legend.text = element_text(color="black", size=8),legend.title = element_text(color="black", size=10),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())
```

# beta disp by grass landscape {.hidden .unlisted}


