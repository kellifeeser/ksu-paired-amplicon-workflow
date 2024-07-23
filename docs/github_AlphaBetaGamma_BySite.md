---
title: "Alpha beta gamma by Site"
author: "Kelli Feeser"
date: "2024-07-23"
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

Document last updated: 2024-07-23

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
  scroll_box(width = "90%", height = "550px")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:550px; overflow-x: scroll; width:90%; "><table class="table" style="margin-left: auto; margin-right: auto;">
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
   <td style="text-align:center;"> 203.9 </td>
   <td style="text-align:center;"> 924.7 </td>
   <td style="text-align:center;"> 0.197 </td>
   <td style="text-align:center;"> 0.029 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:center;"> 4,547 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 303.1 </td>
   <td style="text-align:center;"> 964.1 </td>
   <td style="text-align:center;"> 0.212 </td>
   <td style="text-align:center;"> 0.033 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:center;"> 8,620 </td>
   <td style="text-align:center;"> 38 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 226.8 </td>
   <td style="text-align:center;"> 1,419.1 </td>
   <td style="text-align:center;"> 0.165 </td>
   <td style="text-align:center;"> 0.031 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:center;"> 5,427 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 201 </td>
   <td style="text-align:center;"> 931.7 </td>
   <td style="text-align:center;"> 0.172 </td>
   <td style="text-align:center;"> 0.041 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR </td>
   <td style="text-align:center;"> 2,719 </td>
   <td style="text-align:center;"> 11 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 247.2 </td>
   <td style="text-align:center;"> 814.4 </td>
   <td style="text-align:center;"> 0.3 </td>
   <td style="text-align:center;"> 0.045 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:center;"> 5,801 </td>
   <td style="text-align:center;"> 26 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 223.1 </td>
   <td style="text-align:center;"> 942.7 </td>
   <td style="text-align:center;"> 0.163 </td>
   <td style="text-align:center;"> 0.022 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:center;"> 6,362 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 235.6 </td>
   <td style="text-align:center;"> 1,154.5 </td>
   <td style="text-align:center;"> 0.181 </td>
   <td style="text-align:center;"> 0.026 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:center;"> 4,076 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 271.7 </td>
   <td style="text-align:center;"> 922.6 </td>
   <td style="text-align:center;"> 0.226 </td>
   <td style="text-align:center;"> 0.026 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:center;"> 4,362 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 229.6 </td>
   <td style="text-align:center;"> 1,010.6 </td>
   <td style="text-align:center;"> 0.232 </td>
   <td style="text-align:center;"> 0.034 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF </td>
   <td style="text-align:center;"> 2,711 </td>
   <td style="text-align:center;"> 7 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 387.3 </td>
   <td style="text-align:center;"> 964.9 </td>
   <td style="text-align:center;"> 0.356 </td>
   <td style="text-align:center;"> 0.03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:center;"> 6,631 </td>
   <td style="text-align:center;"> 37 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 179.2 </td>
   <td style="text-align:center;"> 1,058.9 </td>
   <td style="text-align:center;"> 0.16 </td>
   <td style="text-align:center;"> 0.028 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:center;"> 4,043 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 269.5 </td>
   <td style="text-align:center;"> 1,061.3 </td>
   <td style="text-align:center;"> 0.263 </td>
   <td style="text-align:center;"> 0.035 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:center;"> 6,909 </td>
   <td style="text-align:center;"> 32 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 215.9 </td>
   <td style="text-align:center;"> 875.5 </td>
   <td style="text-align:center;"> 0.127 </td>
   <td style="text-align:center;"> 0.061 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:center;"> 7,892 </td>
   <td style="text-align:center;"> 42 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 187.9 </td>
   <td style="text-align:center;"> 1,390.3 </td>
   <td style="text-align:center;"> 0.176 </td>
   <td style="text-align:center;"> 0.019 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:center;"> 4,516 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 167.3 </td>
   <td style="text-align:center;"> 785.2 </td>
   <td style="text-align:center;"> 0.174 </td>
   <td style="text-align:center;"> 0.032 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:center;"> 7,876 </td>
   <td style="text-align:center;"> 34 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 231.6 </td>
   <td style="text-align:center;"> 1,217.4 </td>
   <td style="text-align:center;"> 0.155 </td>
   <td style="text-align:center;"> 0.026 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:center;"> 5,964 </td>
   <td style="text-align:center;"> 20 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 298.2 </td>
   <td style="text-align:center;"> 1,325.1 </td>
   <td style="text-align:center;"> 0.222 </td>
   <td style="text-align:center;"> 0.031 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:center;"> 5,569 </td>
   <td style="text-align:center;"> 22 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 253.1 </td>
   <td style="text-align:center;"> 1,127.8 </td>
   <td style="text-align:center;"> 0.203 </td>
   <td style="text-align:center;"> 0.034 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNF </td>
   <td style="text-align:center;"> 2,517 </td>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 419.5 </td>
   <td style="text-align:center;"> 1,007.5 </td>
   <td style="text-align:center;"> 0.4 </td>
   <td style="text-align:center;"> 0.055 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:center;"> 2,505 </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 250.5 </td>
   <td style="text-align:center;"> 712.3 </td>
   <td style="text-align:center;"> 0.284 </td>
   <td style="text-align:center;"> 0.031 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFA </td>
   <td style="text-align:center;"> 5,456 </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 545.6 </td>
   <td style="text-align:center;"> 1,471.5 </td>
   <td style="text-align:center;"> 0.27 </td>
   <td style="text-align:center;"> 0.021 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:center;"> 8,020 </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 381.9 </td>
   <td style="text-align:center;"> 1,711.6 </td>
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
  scroll_box(width = "90%", height = "550px")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:550px; overflow-x: scroll; width:90%; "><table class="table" style="margin-left: auto; margin-right: auto;">
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
   <td style="text-align:center;"> 42.7 </td>
   <td style="text-align:center;"> 181.3 </td>
   <td style="text-align:center;"> 0.184 </td>
   <td style="text-align:center;"> 0.029 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:center;"> 633 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 42.2 </td>
   <td style="text-align:center;"> 83.2 </td>
   <td style="text-align:center;"> 0.131 </td>
   <td style="text-align:center;"> 0.04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:center;"> 1,341 </td>
   <td style="text-align:center;"> 38 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 35.3 </td>
   <td style="text-align:center;"> 120 </td>
   <td style="text-align:center;"> 0.09 </td>
   <td style="text-align:center;"> 0.021 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:center;"> 923 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 34.2 </td>
   <td style="text-align:center;"> 173.3 </td>
   <td style="text-align:center;"> 0.188 </td>
   <td style="text-align:center;"> 0.019 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR </td>
   <td style="text-align:center;"> 430 </td>
   <td style="text-align:center;"> 11 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 39.1 </td>
   <td style="text-align:center;"> 94.1 </td>
   <td style="text-align:center;"> 0.219 </td>
   <td style="text-align:center;"> 0.031 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:center;"> 1,044 </td>
   <td style="text-align:center;"> 26 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 40.2 </td>
   <td style="text-align:center;"> 93.3 </td>
   <td style="text-align:center;"> 0.089 </td>
   <td style="text-align:center;"> 0.024 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:center;"> 1,169 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 43.3 </td>
   <td style="text-align:center;"> 120.5 </td>
   <td style="text-align:center;"> 0.103 </td>
   <td style="text-align:center;"> 0.03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:center;"> 522 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 34.8 </td>
   <td style="text-align:center;"> 71.4 </td>
   <td style="text-align:center;"> 0.137 </td>
   <td style="text-align:center;"> 0.023 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:center;"> 646 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 34 </td>
   <td style="text-align:center;"> 189 </td>
   <td style="text-align:center;"> 0.293 </td>
   <td style="text-align:center;"> 0.022 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF </td>
   <td style="text-align:center;"> 256 </td>
   <td style="text-align:center;"> 7 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 36.6 </td>
   <td style="text-align:center;"> 74 </td>
   <td style="text-align:center;"> 0.289 </td>
   <td style="text-align:center;"> 0.059 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:center;"> 1,315 </td>
   <td style="text-align:center;"> 37 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 35.5 </td>
   <td style="text-align:center;"> 129.4 </td>
   <td style="text-align:center;"> 0.098 </td>
   <td style="text-align:center;"> 0.025 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:center;"> 717 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 47.8 </td>
   <td style="text-align:center;"> 165.3 </td>
   <td style="text-align:center;"> 0.23 </td>
   <td style="text-align:center;"> 0.052 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:center;"> 1,202 </td>
   <td style="text-align:center;"> 32 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 37.6 </td>
   <td style="text-align:center;"> 119.5 </td>
   <td style="text-align:center;"> 0.099 </td>
   <td style="text-align:center;"> 0.018 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:center;"> 1,337 </td>
   <td style="text-align:center;"> 42 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 31.8 </td>
   <td style="text-align:center;"> 141 </td>
   <td style="text-align:center;"> 0.105 </td>
   <td style="text-align:center;"> 0.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:center;"> 694 </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 25.7 </td>
   <td style="text-align:center;"> 90.8 </td>
   <td style="text-align:center;"> 0.131 </td>
   <td style="text-align:center;"> 0.027 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:center;"> 1,442 </td>
   <td style="text-align:center;"> 34 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 42.4 </td>
   <td style="text-align:center;"> 218.6 </td>
   <td style="text-align:center;"> 0.152 </td>
   <td style="text-align:center;"> 0.025 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:center;"> 1,007 </td>
   <td style="text-align:center;"> 20 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 50.4 </td>
   <td style="text-align:center;"> 219.3 </td>
   <td style="text-align:center;"> 0.218 </td>
   <td style="text-align:center;"> 0.021 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:center;"> 1,068 </td>
   <td style="text-align:center;"> 22 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 48.5 </td>
   <td style="text-align:center;"> 203.3 </td>
   <td style="text-align:center;"> 0.19 </td>
   <td style="text-align:center;"> 0.019 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNF </td>
   <td style="text-align:center;"> 443 </td>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 73.8 </td>
   <td style="text-align:center;"> 179.7 </td>
   <td style="text-align:center;"> 0.406 </td>
   <td style="text-align:center;"> 0.035 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:center;"> 379 </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 37.9 </td>
   <td style="text-align:center;"> 73.5 </td>
   <td style="text-align:center;"> 0.194 </td>
   <td style="text-align:center;"> 0.055 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFA </td>
   <td style="text-align:center;"> 817 </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 81.7 </td>
   <td style="text-align:center;"> 188.4 </td>
   <td style="text-align:center;"> 0.231 </td>
   <td style="text-align:center;"> 0.051 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:center;"> 936 </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 44.6 </td>
   <td style="text-align:center;"> 212 </td>
   <td style="text-align:center;"> 0.226 </td>
   <td style="text-align:center;"> 0.024 </td>
  </tr>
</tbody>
</table></div>

\

# Beta dispersion by site

## Calculate multivariate dispersions {.tabset}





### Bac {.unnumbered}

\
range of site dispersions:


```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.3596  0.3912  0.4175  0.4162  0.4360  0.5076
```

\


```
## 
## 	Homogeneity of multivariate dispersions
## 
## Call: betadisper(d = Bac_wc_sorensen_dist, group =
## phylo2vegan_sd(Bac_wholecommunity)$Site, type = "median", bias.adjust = T,
## sqrt.dist = FALSE, add = "lingoes")
## 
## No. of Positive Eigenvalues: 482
## No. of Negative Eigenvalues: 0
## 
## Average distance to median:
##    BLM    BNP    CAD    CNF    CPR    DMT    FCP    FMT    GMT    GNF    HAR    HPG 
## 0.4160 0.4380 0.4190 0.4509 0.3763 0.4599 0.4302 0.4410 0.3890 0.3820 0.4251 0.3778 
##    KAE    KNZ    LAR    LBJ    NWP    ONF    RNF    SEV    SFA    UHC 
## 0.5076 0.3898 0.4232 0.4421 0.3957 0.4041 0.3596 0.4091 0.4193 0.4011 
## 
## Eigenvalues for PCoA axes:
## (Showing 8 of 482 eigenvalues)
##  PCoA1  PCoA2  PCoA3  PCoA4  PCoA5  PCoA6  PCoA7  PCoA8 
## 17.234  9.227  5.236  5.106  3.033  2.479  1.895  1.831
```

\

#### Perform ANOVA

probably removing in favor of perm F test (following)

`betadisp_Site_Bac.aov <- perform_anova_betadisper(betadisp_Site_Bac_addC, "Site")`


```r
betadisp_Site_Bac.aov<-perform_anova_betadisper(betadisp_Site_Bac_addC, "Site")
```


```r
betadisp_Site_Bac.aov %>% kbl() %>% kable_styling()
```

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Term </th>
   <th style="text-align:right;"> df </th>
   <th style="text-align:right;"> SumSq </th>
   <th style="text-align:right;"> MeanSq </th>
   <th style="text-align:right;"> F.statistic </th>
   <th style="text-align:right;"> R_squared </th>
   <th style="text-align:left;"> p.value </th>
   <th style="text-align:left;"> P.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Site </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 0.50 </td>
   <td style="text-align:right;"> 0.024 </td>
   <td style="text-align:right;"> 14.1 </td>
   <td style="text-align:right;"> 39.07 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> 8.8e-38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Residuals </td>
   <td style="text-align:right;"> 462 </td>
   <td style="text-align:right;"> 0.78 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 60.93 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
  </tr>
</tbody>
</table>
\

#### Permutation test for F with post-hoc Tukey's HSD {.tabset}

\
`vegan::permutest(betadisp_Site_Bac_addC, permutations = 999, pairwise = F)`




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
bdHSDBacs %>%
  kbl(caption = "Bacteria: sites with significantly different beta dispersion, subset to p.adj < 0.05 (Tukey HSD)",
            align = 'c',
      digits = c(3,3,3,4)
      # col.names = c("Number of OTUs","Number of samples")
      # format.args = format(list(big.mark = ',', digit))
      ) %>%
  kable_styling() %>%
  scroll_box(width = "60%", height = "350px")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:350px; overflow-x: scroll; width:60%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-9)Bacteria: sites with significantly different beta dispersion, subset to p.adj &lt; 0.05 (Tukey HSD)</caption>
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


```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.5467  0.5955  0.6675  0.6628  0.7292  0.7698
```

\


```
## 
## 	Homogeneity of multivariate dispersions
## 
## Call: betadisper(d = Fun_wc_sorensen_dist, group =
## phylo2vegan_sd(Fun_wholecommunity)$Site, type = "median", bias.adjust = T,
## sqrt.dist = FALSE, add = "lingoes")
## 
## No. of Positive Eigenvalues: 482
## No. of Negative Eigenvalues: 0
## 
## Average distance to median:
##    BLM    BNP    CAD    CNF    CPR    DMT    FCP    FMT    GMT    GNF    HAR    HPG 
## 0.6057 0.7496 0.7428 0.5813 0.6723 0.7698 0.7479 0.7450 0.5467 0.6628 0.7317 0.6494 
##    KAE    KNZ    LAR    LBJ    NWP    ONF    RNF    SEV    SFA    UHC 
## 0.7217 0.7067 0.6819 0.5967 0.5859 0.5951 0.5836 0.7140 0.6288 0.5630 
## 
## Eigenvalues for PCoA axes:
## (Showing 8 of 482 eigenvalues)
##  PCoA1  PCoA2  PCoA3  PCoA4  PCoA5  PCoA6  PCoA7  PCoA8 
## 27.298 11.999  8.004  5.871  4.597  4.072  3.594  3.280
```

\

#### Perform ANOVA

probably removing in favor of perm F test (following)

`betadisp_Site_Fun.aov <- perform_anova_betadisper(betadisp_Site_Fun_addC, "Site")`


```r
betadisp_Site_Fun.aov<-perform_anova_betadisper(betadisp_Site_Fun_addC, "Site")
```


```r
betadisp_Site_Fun.aov %>% kbl() %>% kable_styling()
```

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Term </th>
   <th style="text-align:right;"> df </th>
   <th style="text-align:right;"> SumSq </th>
   <th style="text-align:right;"> MeanSq </th>
   <th style="text-align:right;"> F.statistic </th>
   <th style="text-align:right;"> R_squared </th>
   <th style="text-align:left;"> p.value </th>
   <th style="text-align:left;"> P.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Site </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 2.46 </td>
   <td style="text-align:right;"> 0.117 </td>
   <td style="text-align:right;"> 68.94 </td>
   <td style="text-align:right;"> 75.81 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> 9.5e-128 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Residuals </td>
   <td style="text-align:right;"> 462 </td>
   <td style="text-align:right;"> 0.79 </td>
   <td style="text-align:right;"> 0.002 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 24.19 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
  </tr>
</tbody>
</table>
\

#### Permutation test for F with post-hoc Tukey's HSD {.tabset}

\
`vegan::permutest(betadisp_Site_Fun_addC, permutations = 999, pairwise = F)`




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
bdHSDFuns %>%
  kbl(caption = "Fungi: sites with significantly different beta dispersion, subset to p.adj < 0.05 (Tukey HSD)",
            align = 'c',
      digits = c(3,3,3,4)
      # col.names = c("Number of OTUs","Number of samples")
      # format.args = format(list(big.mark = ',', digit))
      ) %>%
  kable_styling() %>%
  scroll_box(width = "60%", height = "350px")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:350px; overflow-x: scroll; width:60%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-16)Fungi: sites with significantly different beta dispersion, subset to p.adj &lt; 0.05 (Tukey HSD)</caption>
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




## Tables: Gamma diversity and beta dispersion {.tabset}

\

### Bac

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:350px; overflow-x: scroll; width:95%; "><table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> Site </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> n (# of samples per site) </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> # of grass hosts per site </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Gamma (# total unique OTUs) </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Gamma / n </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Observed mean 𝝰 </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> mean prop. of gamma detected per sample </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> SD prop. of gamma detected per sample </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> BetaDisp </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> BLM </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4689 </td>
   <td style="text-align:right;"> 203.9 </td>
   <td style="text-align:right;"> 924.7 </td>
   <td style="text-align:right;"> 0.197 </td>
   <td style="text-align:right;"> 0.029 </td>
   <td style="text-align:right;"> 0.4160 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4547 </td>
   <td style="text-align:right;"> 303.1 </td>
   <td style="text-align:right;"> 964.1 </td>
   <td style="text-align:right;"> 0.212 </td>
   <td style="text-align:right;"> 0.033 </td>
   <td style="text-align:right;"> 0.4380 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 8620 </td>
   <td style="text-align:right;"> 226.8 </td>
   <td style="text-align:right;"> 1419.1 </td>
   <td style="text-align:right;"> 0.165 </td>
   <td style="text-align:right;"> 0.031 </td>
   <td style="text-align:right;"> 0.4190 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 5427 </td>
   <td style="text-align:right;"> 201.0 </td>
   <td style="text-align:right;"> 931.7 </td>
   <td style="text-align:right;"> 0.172 </td>
   <td style="text-align:right;"> 0.041 </td>
   <td style="text-align:right;"> 0.4509 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2719 </td>
   <td style="text-align:right;"> 247.2 </td>
   <td style="text-align:right;"> 814.4 </td>
   <td style="text-align:right;"> 0.300 </td>
   <td style="text-align:right;"> 0.045 </td>
   <td style="text-align:right;"> 0.3763 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 5801 </td>
   <td style="text-align:right;"> 223.1 </td>
   <td style="text-align:right;"> 942.7 </td>
   <td style="text-align:right;"> 0.163 </td>
   <td style="text-align:right;"> 0.022 </td>
   <td style="text-align:right;"> 0.4599 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 6362 </td>
   <td style="text-align:right;"> 235.6 </td>
   <td style="text-align:right;"> 1154.5 </td>
   <td style="text-align:right;"> 0.181 </td>
   <td style="text-align:right;"> 0.026 </td>
   <td style="text-align:right;"> 0.4302 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4076 </td>
   <td style="text-align:right;"> 271.7 </td>
   <td style="text-align:right;"> 922.6 </td>
   <td style="text-align:right;"> 0.226 </td>
   <td style="text-align:right;"> 0.026 </td>
   <td style="text-align:right;"> 0.4410 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4362 </td>
   <td style="text-align:right;"> 229.6 </td>
   <td style="text-align:right;"> 1010.6 </td>
   <td style="text-align:right;"> 0.232 </td>
   <td style="text-align:right;"> 0.034 </td>
   <td style="text-align:right;"> 0.3890 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2711 </td>
   <td style="text-align:right;"> 387.3 </td>
   <td style="text-align:right;"> 964.9 </td>
   <td style="text-align:right;"> 0.356 </td>
   <td style="text-align:right;"> 0.030 </td>
   <td style="text-align:right;"> 0.3820 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 6631 </td>
   <td style="text-align:right;"> 179.2 </td>
   <td style="text-align:right;"> 1058.9 </td>
   <td style="text-align:right;"> 0.160 </td>
   <td style="text-align:right;"> 0.028 </td>
   <td style="text-align:right;"> 0.4251 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4043 </td>
   <td style="text-align:right;"> 269.5 </td>
   <td style="text-align:right;"> 1061.3 </td>
   <td style="text-align:right;"> 0.263 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.3778 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 6909 </td>
   <td style="text-align:right;"> 215.9 </td>
   <td style="text-align:right;"> 875.5 </td>
   <td style="text-align:right;"> 0.127 </td>
   <td style="text-align:right;"> 0.061 </td>
   <td style="text-align:right;"> 0.5076 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:right;"> 42 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 7892 </td>
   <td style="text-align:right;"> 187.9 </td>
   <td style="text-align:right;"> 1390.3 </td>
   <td style="text-align:right;"> 0.176 </td>
   <td style="text-align:right;"> 0.019 </td>
   <td style="text-align:right;"> 0.3898 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4516 </td>
   <td style="text-align:right;"> 167.3 </td>
   <td style="text-align:right;"> 785.2 </td>
   <td style="text-align:right;"> 0.174 </td>
   <td style="text-align:right;"> 0.032 </td>
   <td style="text-align:right;"> 0.4232 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:right;"> 34 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 7876 </td>
   <td style="text-align:right;"> 231.6 </td>
   <td style="text-align:right;"> 1217.4 </td>
   <td style="text-align:right;"> 0.155 </td>
   <td style="text-align:right;"> 0.026 </td>
   <td style="text-align:right;"> 0.4421 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 5964 </td>
   <td style="text-align:right;"> 298.2 </td>
   <td style="text-align:right;"> 1325.1 </td>
   <td style="text-align:right;"> 0.222 </td>
   <td style="text-align:right;"> 0.031 </td>
   <td style="text-align:right;"> 0.3957 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 5569 </td>
   <td style="text-align:right;"> 253.1 </td>
   <td style="text-align:right;"> 1127.8 </td>
   <td style="text-align:right;"> 0.203 </td>
   <td style="text-align:right;"> 0.034 </td>
   <td style="text-align:right;"> 0.4041 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNF </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2517 </td>
   <td style="text-align:right;"> 419.5 </td>
   <td style="text-align:right;"> 1007.5 </td>
   <td style="text-align:right;"> 0.400 </td>
   <td style="text-align:right;"> 0.055 </td>
   <td style="text-align:right;"> 0.3596 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2505 </td>
   <td style="text-align:right;"> 250.5 </td>
   <td style="text-align:right;"> 712.3 </td>
   <td style="text-align:right;"> 0.284 </td>
   <td style="text-align:right;"> 0.031 </td>
   <td style="text-align:right;"> 0.4091 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFA </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 5456 </td>
   <td style="text-align:right;"> 545.6 </td>
   <td style="text-align:right;"> 1471.5 </td>
   <td style="text-align:right;"> 0.270 </td>
   <td style="text-align:right;"> 0.021 </td>
   <td style="text-align:right;"> 0.4193 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 8020 </td>
   <td style="text-align:right;"> 381.9 </td>
   <td style="text-align:right;"> 1711.6 </td>
   <td style="text-align:right;"> 0.213 </td>
   <td style="text-align:right;"> 0.021 </td>
   <td style="text-align:right;"> 0.4011 </td>
  </tr>
</tbody>
</table></div>

\

### Fun


```r
Fun_gamma_Site.df$BetaDisp <- round(Fun_gamma_Site.df$Fun_Site_betadisp,4)
Fun_gamma_Site.df[,c(1:8,11)] %>% kbl() %>% kable_styling() %>%
  scroll_box(width = "95%", height = "350px")
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:350px; overflow-x: scroll; width:95%; "><table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;"> Site </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> n (# of samples per site) </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> # of grass hosts per site </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Gamma (# total unique OTUs) </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Gamma / n </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> Observed mean 𝝰 </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> mean prop. of gamma detected per sample </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> SD prop. of gamma detected per sample </th>
   <th style="text-align:right;position: sticky; top:0; background-color: #FFFFFF;"> BetaDisp </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> BLM </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 983 </td>
   <td style="text-align:right;"> 42.7 </td>
   <td style="text-align:right;"> 181.3 </td>
   <td style="text-align:right;"> 0.184 </td>
   <td style="text-align:right;"> 0.029 </td>
   <td style="text-align:right;"> 0.6057 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNP </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 633 </td>
   <td style="text-align:right;"> 42.2 </td>
   <td style="text-align:right;"> 83.2 </td>
   <td style="text-align:right;"> 0.131 </td>
   <td style="text-align:right;"> 0.040 </td>
   <td style="text-align:right;"> 0.7496 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CAD </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1341 </td>
   <td style="text-align:right;"> 35.3 </td>
   <td style="text-align:right;"> 120.0 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.021 </td>
   <td style="text-align:right;"> 0.7428 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CNF </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 923 </td>
   <td style="text-align:right;"> 34.2 </td>
   <td style="text-align:right;"> 173.3 </td>
   <td style="text-align:right;"> 0.188 </td>
   <td style="text-align:right;"> 0.019 </td>
   <td style="text-align:right;"> 0.5813 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CPR </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 430 </td>
   <td style="text-align:right;"> 39.1 </td>
   <td style="text-align:right;"> 94.1 </td>
   <td style="text-align:right;"> 0.219 </td>
   <td style="text-align:right;"> 0.031 </td>
   <td style="text-align:right;"> 0.6723 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DMT </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1044 </td>
   <td style="text-align:right;"> 40.2 </td>
   <td style="text-align:right;"> 93.3 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.024 </td>
   <td style="text-align:right;"> 0.7698 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCP </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1169 </td>
   <td style="text-align:right;"> 43.3 </td>
   <td style="text-align:right;"> 120.5 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.030 </td>
   <td style="text-align:right;"> 0.7479 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FMT </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 522 </td>
   <td style="text-align:right;"> 34.8 </td>
   <td style="text-align:right;"> 71.4 </td>
   <td style="text-align:right;"> 0.137 </td>
   <td style="text-align:right;"> 0.023 </td>
   <td style="text-align:right;"> 0.7450 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GMT </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 646 </td>
   <td style="text-align:right;"> 34.0 </td>
   <td style="text-align:right;"> 189.0 </td>
   <td style="text-align:right;"> 0.293 </td>
   <td style="text-align:right;"> 0.022 </td>
   <td style="text-align:right;"> 0.5467 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GNF </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 256 </td>
   <td style="text-align:right;"> 36.6 </td>
   <td style="text-align:right;"> 74.0 </td>
   <td style="text-align:right;"> 0.289 </td>
   <td style="text-align:right;"> 0.059 </td>
   <td style="text-align:right;"> 0.6628 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HAR </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1315 </td>
   <td style="text-align:right;"> 35.5 </td>
   <td style="text-align:right;"> 129.4 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.025 </td>
   <td style="text-align:right;"> 0.7317 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HPG </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 717 </td>
   <td style="text-align:right;"> 47.8 </td>
   <td style="text-align:right;"> 165.3 </td>
   <td style="text-align:right;"> 0.230 </td>
   <td style="text-align:right;"> 0.052 </td>
   <td style="text-align:right;"> 0.6494 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KAE </td>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1202 </td>
   <td style="text-align:right;"> 37.6 </td>
   <td style="text-align:right;"> 119.5 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.018 </td>
   <td style="text-align:right;"> 0.7217 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KNZ </td>
   <td style="text-align:right;"> 42 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1337 </td>
   <td style="text-align:right;"> 31.8 </td>
   <td style="text-align:right;"> 141.0 </td>
   <td style="text-align:right;"> 0.105 </td>
   <td style="text-align:right;"> 0.020 </td>
   <td style="text-align:right;"> 0.7067 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LAR </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 694 </td>
   <td style="text-align:right;"> 25.7 </td>
   <td style="text-align:right;"> 90.8 </td>
   <td style="text-align:right;"> 0.131 </td>
   <td style="text-align:right;"> 0.027 </td>
   <td style="text-align:right;"> 0.6819 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LBJ </td>
   <td style="text-align:right;"> 34 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1442 </td>
   <td style="text-align:right;"> 42.4 </td>
   <td style="text-align:right;"> 218.6 </td>
   <td style="text-align:right;"> 0.152 </td>
   <td style="text-align:right;"> 0.025 </td>
   <td style="text-align:right;"> 0.5967 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWP </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1007 </td>
   <td style="text-align:right;"> 50.4 </td>
   <td style="text-align:right;"> 219.3 </td>
   <td style="text-align:right;"> 0.218 </td>
   <td style="text-align:right;"> 0.021 </td>
   <td style="text-align:right;"> 0.5859 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONF </td>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1068 </td>
   <td style="text-align:right;"> 48.5 </td>
   <td style="text-align:right;"> 203.3 </td>
   <td style="text-align:right;"> 0.190 </td>
   <td style="text-align:right;"> 0.019 </td>
   <td style="text-align:right;"> 0.5951 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNF </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 443 </td>
   <td style="text-align:right;"> 73.8 </td>
   <td style="text-align:right;"> 179.7 </td>
   <td style="text-align:right;"> 0.406 </td>
   <td style="text-align:right;"> 0.035 </td>
   <td style="text-align:right;"> 0.5836 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEV </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 379 </td>
   <td style="text-align:right;"> 37.9 </td>
   <td style="text-align:right;"> 73.5 </td>
   <td style="text-align:right;"> 0.194 </td>
   <td style="text-align:right;"> 0.055 </td>
   <td style="text-align:right;"> 0.7140 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFA </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 817 </td>
   <td style="text-align:right;"> 81.7 </td>
   <td style="text-align:right;"> 188.4 </td>
   <td style="text-align:right;"> 0.231 </td>
   <td style="text-align:right;"> 0.051 </td>
   <td style="text-align:right;"> 0.6288 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UHC </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 936 </td>
   <td style="text-align:right;"> 44.6 </td>
   <td style="text-align:right;"> 212.0 </td>
   <td style="text-align:right;"> 0.226 </td>
   <td style="text-align:right;"> 0.024 </td>
   <td style="text-align:right;"> 0.5630 </td>
  </tr>
</tbody>
</table></div>

\

## ANOSIM {.tabset}

\

### Bac


```r
Bac_Site.anosim <- with(phylo2vegan_sd(Bac_wholecommunity), anosim(Bac_wc_sorensen_distmat, Site))
Bac_Site.anosim
```

```
## 
## Call:
## anosim(x = Bac_wc_sorensen_distmat, grouping = Site) 
## Dissimilarity: user supplied square matrix 
## 
## ANOSIM statistic R: 0.7502 
##       Significance: 0.001 
## 
## Permutation: free
## Number of permutations: 999
```

![](../docs/figures/ANOSIM/Bacterial_Site_ANOSIM.png){width="100%"} 

\

### Fun


```r
Fun_Site.anosim <- with(phylo2vegan_sd(Fun_wholecommunity), anosim(Fun_wc_sorensen_distmat, Site))
Fun_Site.anosim
```

```
## 
## Call:
## anosim(x = Fun_wc_sorensen_distmat, grouping = Site) 
## Dissimilarity: user supplied square matrix 
## 
## ANOSIM statistic R: 0.6272 
##       Significance: 0.001 
## 
## Permutation: free
## Number of permutations: 999
```

![](../docs/figures/ANOSIM/Fungal_Site_ANOSIM.png){width="100%"} 

\




\

# Tables: alpha beta gamma diversity of sites {.tabset}

\
\

## Bac

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:500px; overflow-x: scroll; width:95%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-21)Bacteria: alpha beta gamma diversity of sites</caption>
 <thead>
  <tr>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Site </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> n (# of samples per site) </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> # of grass hosts per site </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Gamma (# total unique OTUs) </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Gamma / n </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Observed mean 𝝰 </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> mean prop. of gamma detected per sample </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> SD prop. of gamma detected per sample </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> BetaDisp </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> BLM </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 4,689 </td>
   <td style="text-align:center;"> 203.9 </td>
   <td style="text-align:center;"> 924.7 </td>
   <td style="text-align:center;"> 0.197 </td>
   <td style="text-align:center;"> 0.029 </td>
   <td style="text-align:center;"> 0.4160 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> BNP </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 4,547 </td>
   <td style="text-align:center;"> 303.1 </td>
   <td style="text-align:center;"> 964.1 </td>
   <td style="text-align:center;"> 0.212 </td>
   <td style="text-align:center;"> 0.033 </td>
   <td style="text-align:center;"> 0.4380 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> CAD </td>
   <td style="text-align:center;"> 38 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 8,620 </td>
   <td style="text-align:center;"> 226.8 </td>
   <td style="text-align:center;"> 1,419.1 </td>
   <td style="text-align:center;"> 0.165 </td>
   <td style="text-align:center;"> 0.031 </td>
   <td style="text-align:center;"> 0.4190 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> CNF </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 5,427 </td>
   <td style="text-align:center;"> 201.0 </td>
   <td style="text-align:center;"> 931.7 </td>
   <td style="text-align:center;"> 0.172 </td>
   <td style="text-align:center;"> 0.041 </td>
   <td style="text-align:center;"> 0.4509 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> CPR </td>
   <td style="text-align:center;"> 11 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 2,719 </td>
   <td style="text-align:center;"> 247.2 </td>
   <td style="text-align:center;"> 814.4 </td>
   <td style="text-align:center;"> 0.300 </td>
   <td style="text-align:center;"> 0.045 </td>
   <td style="text-align:center;"> 0.3763 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> DMT </td>
   <td style="text-align:center;"> 26 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 5,801 </td>
   <td style="text-align:center;"> 223.1 </td>
   <td style="text-align:center;"> 942.7 </td>
   <td style="text-align:center;"> 0.163 </td>
   <td style="text-align:center;"> 0.022 </td>
   <td style="text-align:center;"> 0.4599 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> FCP </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 6,362 </td>
   <td style="text-align:center;"> 235.6 </td>
   <td style="text-align:center;"> 1,154.5 </td>
   <td style="text-align:center;"> 0.181 </td>
   <td style="text-align:center;"> 0.026 </td>
   <td style="text-align:center;"> 0.4302 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> FMT </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 4,076 </td>
   <td style="text-align:center;"> 271.7 </td>
   <td style="text-align:center;"> 922.6 </td>
   <td style="text-align:center;"> 0.226 </td>
   <td style="text-align:center;"> 0.026 </td>
   <td style="text-align:center;"> 0.4410 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> GMT </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 4,362 </td>
   <td style="text-align:center;"> 229.6 </td>
   <td style="text-align:center;"> 1,010.6 </td>
   <td style="text-align:center;"> 0.232 </td>
   <td style="text-align:center;"> 0.034 </td>
   <td style="text-align:center;"> 0.3890 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> GNF </td>
   <td style="text-align:center;"> 7 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 2,711 </td>
   <td style="text-align:center;"> 387.3 </td>
   <td style="text-align:center;"> 964.9 </td>
   <td style="text-align:center;"> 0.356 </td>
   <td style="text-align:center;"> 0.030 </td>
   <td style="text-align:center;"> 0.3820 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> HAR </td>
   <td style="text-align:center;"> 37 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 6,631 </td>
   <td style="text-align:center;"> 179.2 </td>
   <td style="text-align:center;"> 1,058.9 </td>
   <td style="text-align:center;"> 0.160 </td>
   <td style="text-align:center;"> 0.028 </td>
   <td style="text-align:center;"> 0.4251 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> HPG </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 4,043 </td>
   <td style="text-align:center;"> 269.5 </td>
   <td style="text-align:center;"> 1,061.3 </td>
   <td style="text-align:center;"> 0.263 </td>
   <td style="text-align:center;"> 0.035 </td>
   <td style="text-align:center;"> 0.3778 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> KAE </td>
   <td style="text-align:center;"> 32 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 6,909 </td>
   <td style="text-align:center;"> 215.9 </td>
   <td style="text-align:center;"> 875.5 </td>
   <td style="text-align:center;"> 0.127 </td>
   <td style="text-align:center;"> 0.061 </td>
   <td style="text-align:center;"> 0.5076 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> KNZ </td>
   <td style="text-align:center;"> 42 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 7,892 </td>
   <td style="text-align:center;"> 187.9 </td>
   <td style="text-align:center;"> 1,390.3 </td>
   <td style="text-align:center;"> 0.176 </td>
   <td style="text-align:center;"> 0.019 </td>
   <td style="text-align:center;"> 0.3898 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> LAR </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 4,516 </td>
   <td style="text-align:center;"> 167.3 </td>
   <td style="text-align:center;"> 785.2 </td>
   <td style="text-align:center;"> 0.174 </td>
   <td style="text-align:center;"> 0.032 </td>
   <td style="text-align:center;"> 0.4232 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> LBJ </td>
   <td style="text-align:center;"> 34 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 7,876 </td>
   <td style="text-align:center;"> 231.6 </td>
   <td style="text-align:center;"> 1,217.4 </td>
   <td style="text-align:center;"> 0.155 </td>
   <td style="text-align:center;"> 0.026 </td>
   <td style="text-align:center;"> 0.4421 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> NWP </td>
   <td style="text-align:center;"> 20 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 5,964 </td>
   <td style="text-align:center;"> 298.2 </td>
   <td style="text-align:center;"> 1,325.1 </td>
   <td style="text-align:center;"> 0.222 </td>
   <td style="text-align:center;"> 0.031 </td>
   <td style="text-align:center;"> 0.3957 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> ONF </td>
   <td style="text-align:center;"> 22 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 5,569 </td>
   <td style="text-align:center;"> 253.1 </td>
   <td style="text-align:center;"> 1,127.8 </td>
   <td style="text-align:center;"> 0.203 </td>
   <td style="text-align:center;"> 0.034 </td>
   <td style="text-align:center;"> 0.4041 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> RNF </td>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 2,517 </td>
   <td style="text-align:center;"> 419.5 </td>
   <td style="text-align:center;"> 1,007.5 </td>
   <td style="text-align:center;"> 0.400 </td>
   <td style="text-align:center;"> 0.055 </td>
   <td style="text-align:center;"> 0.3596 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> SEV </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 2,505 </td>
   <td style="text-align:center;"> 250.5 </td>
   <td style="text-align:center;"> 712.3 </td>
   <td style="text-align:center;"> 0.284 </td>
   <td style="text-align:center;"> 0.031 </td>
   <td style="text-align:center;"> 0.4091 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> SFA </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 5,456 </td>
   <td style="text-align:center;"> 545.6 </td>
   <td style="text-align:center;"> 1,471.5 </td>
   <td style="text-align:center;"> 0.270 </td>
   <td style="text-align:center;"> 0.021 </td>
   <td style="text-align:center;"> 0.4193 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> UHC </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 8,020 </td>
   <td style="text-align:center;"> 381.9 </td>
   <td style="text-align:center;"> 1,711.6 </td>
   <td style="text-align:center;"> 0.213 </td>
   <td style="text-align:center;"> 0.021 </td>
   <td style="text-align:center;"> 0.4011 </td>
  </tr>
</tbody>
</table></div>

\

## Fun 

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:500px; overflow-x: scroll; width:95%; "><table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-22)Fungi: alpha beta gamma diversity of sites</caption>
 <thead>
  <tr>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Site </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> n (# of samples per site) </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> # of grass hosts per site </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Gamma (# total unique OTUs) </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Gamma / n </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> Observed mean 𝝰 </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> mean prop. of gamma detected per sample </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> SD prop. of gamma detected per sample </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #FFFFFF;"> BetaDisp </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> BLM </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 983 </td>
   <td style="text-align:center;"> 42.7 </td>
   <td style="text-align:center;"> 181.3 </td>
   <td style="text-align:center;"> 0.184 </td>
   <td style="text-align:center;"> 0.029 </td>
   <td style="text-align:center;"> 0.6057 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> BNP </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 633 </td>
   <td style="text-align:center;"> 42.2 </td>
   <td style="text-align:center;"> 83.2 </td>
   <td style="text-align:center;"> 0.131 </td>
   <td style="text-align:center;"> 0.040 </td>
   <td style="text-align:center;"> 0.7496 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> CAD </td>
   <td style="text-align:center;"> 38 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 1,341 </td>
   <td style="text-align:center;"> 35.3 </td>
   <td style="text-align:center;"> 120 </td>
   <td style="text-align:center;"> 0.090 </td>
   <td style="text-align:center;"> 0.021 </td>
   <td style="text-align:center;"> 0.7428 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> CNF </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 923 </td>
   <td style="text-align:center;"> 34.2 </td>
   <td style="text-align:center;"> 173.3 </td>
   <td style="text-align:center;"> 0.188 </td>
   <td style="text-align:center;"> 0.019 </td>
   <td style="text-align:center;"> 0.5813 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> CPR </td>
   <td style="text-align:center;"> 11 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 430 </td>
   <td style="text-align:center;"> 39.1 </td>
   <td style="text-align:center;"> 94.1 </td>
   <td style="text-align:center;"> 0.219 </td>
   <td style="text-align:center;"> 0.031 </td>
   <td style="text-align:center;"> 0.6723 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> DMT </td>
   <td style="text-align:center;"> 26 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1,044 </td>
   <td style="text-align:center;"> 40.2 </td>
   <td style="text-align:center;"> 93.3 </td>
   <td style="text-align:center;"> 0.089 </td>
   <td style="text-align:center;"> 0.024 </td>
   <td style="text-align:center;"> 0.7698 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> FCP </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1,169 </td>
   <td style="text-align:center;"> 43.3 </td>
   <td style="text-align:center;"> 120.5 </td>
   <td style="text-align:center;"> 0.103 </td>
   <td style="text-align:center;"> 0.030 </td>
   <td style="text-align:center;"> 0.7479 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> FMT </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 522 </td>
   <td style="text-align:center;"> 34.8 </td>
   <td style="text-align:center;"> 71.4 </td>
   <td style="text-align:center;"> 0.137 </td>
   <td style="text-align:center;"> 0.023 </td>
   <td style="text-align:center;"> 0.7450 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> GMT </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 646 </td>
   <td style="text-align:center;"> 34.0 </td>
   <td style="text-align:center;"> 189 </td>
   <td style="text-align:center;"> 0.293 </td>
   <td style="text-align:center;"> 0.022 </td>
   <td style="text-align:center;"> 0.5467 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> GNF </td>
   <td style="text-align:center;"> 7 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 256 </td>
   <td style="text-align:center;"> 36.6 </td>
   <td style="text-align:center;"> 74 </td>
   <td style="text-align:center;"> 0.289 </td>
   <td style="text-align:center;"> 0.059 </td>
   <td style="text-align:center;"> 0.6628 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> HAR </td>
   <td style="text-align:center;"> 37 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 1,315 </td>
   <td style="text-align:center;"> 35.5 </td>
   <td style="text-align:center;"> 129.4 </td>
   <td style="text-align:center;"> 0.098 </td>
   <td style="text-align:center;"> 0.025 </td>
   <td style="text-align:center;"> 0.7317 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> HPG </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 717 </td>
   <td style="text-align:center;"> 47.8 </td>
   <td style="text-align:center;"> 165.3 </td>
   <td style="text-align:center;"> 0.230 </td>
   <td style="text-align:center;"> 0.052 </td>
   <td style="text-align:center;"> 0.6494 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> KAE </td>
   <td style="text-align:center;"> 32 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1,202 </td>
   <td style="text-align:center;"> 37.6 </td>
   <td style="text-align:center;"> 119.5 </td>
   <td style="text-align:center;"> 0.099 </td>
   <td style="text-align:center;"> 0.018 </td>
   <td style="text-align:center;"> 0.7217 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> KNZ </td>
   <td style="text-align:center;"> 42 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 1,337 </td>
   <td style="text-align:center;"> 31.8 </td>
   <td style="text-align:center;"> 141 </td>
   <td style="text-align:center;"> 0.105 </td>
   <td style="text-align:center;"> 0.020 </td>
   <td style="text-align:center;"> 0.7067 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> LAR </td>
   <td style="text-align:center;"> 27 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 694 </td>
   <td style="text-align:center;"> 25.7 </td>
   <td style="text-align:center;"> 90.8 </td>
   <td style="text-align:center;"> 0.131 </td>
   <td style="text-align:center;"> 0.027 </td>
   <td style="text-align:center;"> 0.6819 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> LBJ </td>
   <td style="text-align:center;"> 34 </td>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 1,442 </td>
   <td style="text-align:center;"> 42.4 </td>
   <td style="text-align:center;"> 218.6 </td>
   <td style="text-align:center;"> 0.152 </td>
   <td style="text-align:center;"> 0.025 </td>
   <td style="text-align:center;"> 0.5967 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> NWP </td>
   <td style="text-align:center;"> 20 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 1,007 </td>
   <td style="text-align:center;"> 50.4 </td>
   <td style="text-align:center;"> 219.3 </td>
   <td style="text-align:center;"> 0.218 </td>
   <td style="text-align:center;"> 0.021 </td>
   <td style="text-align:center;"> 0.5859 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> ONF </td>
   <td style="text-align:center;"> 22 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 1,068 </td>
   <td style="text-align:center;"> 48.5 </td>
   <td style="text-align:center;"> 203.3 </td>
   <td style="text-align:center;"> 0.190 </td>
   <td style="text-align:center;"> 0.019 </td>
   <td style="text-align:center;"> 0.5951 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> RNF </td>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 443 </td>
   <td style="text-align:center;"> 73.8 </td>
   <td style="text-align:center;"> 179.7 </td>
   <td style="text-align:center;"> 0.406 </td>
   <td style="text-align:center;"> 0.035 </td>
   <td style="text-align:center;"> 0.5836 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> SEV </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 379 </td>
   <td style="text-align:center;"> 37.9 </td>
   <td style="text-align:center;"> 73.5 </td>
   <td style="text-align:center;"> 0.194 </td>
   <td style="text-align:center;"> 0.055 </td>
   <td style="text-align:center;"> 0.7140 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> SFA </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 817 </td>
   <td style="text-align:center;"> 81.7 </td>
   <td style="text-align:center;"> 188.4 </td>
   <td style="text-align:center;"> 0.231 </td>
   <td style="text-align:center;"> 0.051 </td>
   <td style="text-align:center;"> 0.6288 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> UHC </td>
   <td style="text-align:center;"> 21 </td>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 936 </td>
   <td style="text-align:center;"> 44.6 </td>
   <td style="text-align:center;"> 212 </td>
   <td style="text-align:center;"> 0.226 </td>
   <td style="text-align:center;"> 0.024 </td>
   <td style="text-align:center;"> 0.5630 </td>
  </tr>
</tbody>
</table></div>

\
\

# Statistical testing

\

## normality and density plot of site gamma {.tabset}

\

### Bac


```
## 
## 	Shapiro-Wilk normality test
## 
## data:  Bac_gamma_Site.df$`Gamma (# total unique OTUs)`
## W = 0.95319, p-value = 0.3648
```

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_AlphaBetaGamma_BySite_files/figure-html/unnamed-chunk-23-1.png" width="40%" /><img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_AlphaBetaGamma_BySite_files/figure-html/unnamed-chunk-23-2.png" width="40%" />

\

### Fun


```
## 
## 	Shapiro-Wilk normality test
## 
## data:  Fun_gamma_Site.df$`Gamma (# total unique OTUs)`
## W = 0.96265, p-value = 0.5447
```

<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_AlphaBetaGamma_BySite_files/figure-html/unnamed-chunk-24-1.png" width="40%" /><img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_AlphaBetaGamma_BySite_files/figure-html/unnamed-chunk-24-2.png" width="40%" />

\

## kruskal.test

[in-progress]

Predictor: # of grass hosts per site



```
## 
## 	Kruskal-Wallis rank sum test
## 
## data:  fwc_alpha_Site$Observed by fwc_alpha_Site$ngrass_persite
## Kruskal-Wallis chi-squared = 38.431, df = 3, p-value = 2.291e-08
```



```
## 
## 	Kruskal-Wallis rank sum test
## 
## data:  Fun_gamma_Site2[, 1] by Fun_gamma_Site3temp$ngrass_persite
## Kruskal-Wallis chi-squared = 3.1963, df = 3, p-value = 0.3623
```

```
## 
## 	Kruskal-Wallis rank sum test
## 
## data:  Fun_gamma_Site3temp$Gamma_over_n by Fun_gamma_Site3temp$ngrass_persite
## Kruskal-Wallis chi-squared = 5.9091, df = 3, p-value = 0.1161
```

```
## 
## 	Kruskal-Wallis rank sum test
## 
## data:  Fun_gamma_Site.df$`Observed mean 𝝰` by Fun_gamma_Site.df$`# of grass hosts per site`
## Kruskal-Wallis chi-squared = 0.59157, df = 3, p-value = 0.8984
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



# beta disp by grass landscape {.hidden .unlisted}


