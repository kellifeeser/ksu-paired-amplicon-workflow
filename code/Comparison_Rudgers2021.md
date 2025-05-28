---
title: "**Comparison of fungal analyses**"
subtitle: "Current KSU fungal analyses vs. Rudgers 2021"
author: "Kelli Feeser"
date: '2023-09-20'
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

**Previous manuscript** \
Rudgers, J.A., Fox, S., Porras‐Alfaro, A., Herrera, J., Reazin, C., Kent, D.R., Souza, L., Chung, Y.A., & Jumpponen, A. (2022). Biogeography of root‐associated fungi in foundation grasses of North American plains. Journal of Biogeography, 49(1), 22-37. doi/10.1111/jbi.14260 
\
<object data="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/JournalofBiogeography2021_Rudgers_BiogeographyOfRootAssociatedFungiInFoundationGrassesOfNorthAmericanPlains.pdf" type="application/pdf" width="100%" height="400px">
      <p>Unable to display PDF file. <a href="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/JournalofBiogeography2021_Rudgers_BiogeographyOfRootAssociatedFungiInFoundationGrassesOfNorthAmericanPlains.pdf">Download</a> instead.</p></object>
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

*Note*: I did further cleaning of the dataset reducing the number of clean reads to 5,149,044, however I am reporting the value that corresponds to the processing steps by Rudgers et al. 


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

\
\

# NMDS by Grass Host (Figure 1B)
\



![](../figures/Rudgers2021_comparison/fig1b_comparison.png){width="80%" height="64%"}

*Note:* Rudgers 2021 reports a stress of 0.26 which I would strongly consider to be too high (guidelines: >0.2 is poor (risks for false interpretation), 0.1 - 0.2 is fair (some distances can be misleading for interpretation), 0.05 - 0.1 is good (can be confident in inferences from plot), and <0.05 is excellent (this can be rare)). I created this ordination with a higher *k* value of 5 and resulting stress of 0.11.
\
\

# Relationships between fungal OTU richness against latitude for each of five grass species (Figure 2)

