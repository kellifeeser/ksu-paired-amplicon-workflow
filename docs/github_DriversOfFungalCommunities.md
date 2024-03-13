---
title: '**KSU: Drivers of Fungal Community Dynamics**'
author: "Kelli Feeser"
date: "2024-03-12"
output:
  bookdown::html_document2:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
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
    toc: yes
    toc_depth: '4'
    fig.caption: yes
    df_print: paged
editor_options:
  chunk_output_type: inline
---

\

::: homelink
<a href="https://kellifeeser.github.io/ksu-paired-amplicon-workflow/index.html" target="_blank" style="text-align:right">Back to Home</a>
:::

\
\

# Prep data {.unlisted .unnumbered .hidden}







# Map of sites and samples



## Prior mislabeling of samples from ONF

\

The Kansas site ONF was labeled as 'South Middle' in previous manuscripts.








```{=html}
<div id="htmlwidget-a25f5b90a9479e6672dc" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-a25f5b90a9479e6672dc">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],15,null,null,{"interactive":true,"className":"","stroke":true,"color":["#6ABEF9","#FFC25B","#FFFA6C","#6ABEF9","#6BE9FF","#FFC25B","#6ABEF9","#FFFA6C","#FFC25B","#FFC25B","#FFFA6C","#6BE9FF","#6BE9FF","#FFFA6C","#6BE9FF","#6BE9FF","#FFC25B","#6ABEF9","#FFFA6C","#6ABEF9","#FFFA6C","#FFC25B"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#6ABEF9","#FFC25B","#FFFA6C","#6ABEF9","#6BE9FF","#FFC25B","#6ABEF9","#FFFA6C","#FFC25B","#FFC25B","#FFFA6C","#6BE9FF","#6BE9FF","#FFFA6C","#6BE9FF","#6BE9FF","#FFC25B","#6ABEF9","#FFFA6C","#6ABEF9","#FFFA6C","#FFC25B"],"fillOpacity":0.9},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#6BE9FF","#6ABEF9","#FFFA6C","#FFC25B"],"labels":["North","North Central","South Central","South"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"factor","title":"Bin","extra":null,"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

Map of sites colored by latitudinal bin.\
\
\
\

## Mapping metadata

\

### Combining lat and long {.tabset .tabset-pills}




Coloring by both lat and long gradients\
\

#### Map {.unnumbered}

\


```{=html}
<div id="htmlwidget-811f08e29af218c41c46" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-811f08e29af218c41c46">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#25B480","#580080","#C05780","#229680","#40F880","#4C1880","#969280","#0C3C80","#FD2880","#403B80","#004B80","#A4D380","#44FF80","#C27B80","#D2D380","#A9F580","#BC1480","#F39280","#FFE380","#20C080","#1E6E80","#EF0380"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#25B480","#580080","#C05780","#229680","#40F880","#4C1880","#969280","#0C3C80","#FD2880","#403B80","#004B80","#A4D380","#44FF80","#C27B80","#D2D380","#A9F580","#BC1480","#F39280","#FFE380","#20C080","#1E6E80","#EF0380"],"fillOpacity":0.8},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#25B480","#580080","#C05780","#229680","#40F880","#4C1880","#969280","#0C3C80","#403B80","#004B80","#A4D380","#44FF80","#C27B80","#D2D380","#A9F580","#BC1480","#F39280","#FFE380","#20C080","#1E6E80","#FD2880","#EF0380"],"labels":["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","SFA","UHC"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"factor","title":"Site","extra":null,"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

#### on a plot {.unnumbered}

\

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_DriversOfFungalCommunities_files/figure-html/unnamed-chunk-3-1.png)<!-- -->



### Edaphic {.tabset .tabset-pills}

\

#### pH {.unnumbered}


```{=html}
<div id="htmlwidget-fd5f45e4e23fbde5f6ad" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-fd5f45e4e23fbde5f6ad">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#3F4788","#48186A","#414387","#472E7C","#C0DF25","#424186","#20938C","#2A778E","#228B8D","#440154","#3E4C8A","#404588","#2B758E","#81D34D","#1F9A8A","#453781","#94D741","#3CBB75","#FDE725","#33628D","#1F948C","#1E9C89"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#3F4788","#48186A","#414387","#472E7C","#C0DF25","#424186","#20938C","#2A778E","#228B8D","#440154","#3E4C8A","#404588","#2B758E","#81D34D","#1F9A8A","#453781","#94D741","#3CBB75","#FDE725","#33628D","#1F948C","#1E9C89"],"fillOpacity":0.8},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#FDE725 , #D1E21B 6.84039087947883%, #67CC5C 23.1270358306189%, #23A983 39.413680781759%, #26828E 55.700325732899%, #375A8C 71.9869706840391%, #472A7A 88.2736156351792%, #440154 "],"labels":["5.5","6.0","6.5","7.0","7.5","8.0"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"numeric","title":"pH","extra":{"p_1":0.06840390879478828,"p_n":0.8827361563517917},"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

\

#### soil moisture {.unnumbered}


```{=html}
<div id="htmlwidget-fab08640eb8d2e5d1227" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-fab08640eb8d2e5d1227">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#C8DCF0","#E6F0FA","#69ADD5","#F0F7FD","#F1F7FD","#9AC8E0","#F5F9FE","#EBF4FB","#88BDDC","#D3E4F3","#B8D5EA","#A6CDE4","#135CA5","#91C2DE","#87BDDC","#F1F7FD","#09478D","#67ABD4","#B5D4E9","#B5D4E9","#F7FBFF","#08306B"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#C8DCF0","#E6F0FA","#69ADD5","#F0F7FD","#F1F7FD","#9AC8E0","#F5F9FE","#EBF4FB","#88BDDC","#D3E4F3","#B8D5EA","#A6CDE4","#135CA5","#91C2DE","#87BDDC","#F1F7FD","#09478D","#67ABD4","#B5D4E9","#B5D4E9","#F7FBFF","#08306B"],"fillOpacity":0.8},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#08306B , #09468C 8.58125664789847%, #206FB4 24.4052534960621%, #4C98C9 40.2292503442258%, #85BBDB 56.0532471923894%, #BCD7EB 71.8772440405531%, #DEEBF7 87.7012408887167%, #F7FBFF "],"labels":["0.70","0.75","0.80","0.85","0.90","0.95"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"numeric","title":"soil_moisture","extra":{"p_1":0.08581256647898468,"p_n":0.8770124088871667},"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

\

#### SOM {.unnumbered}


```{=html}
<div id="htmlwidget-e74bdd4cb23ea7eb6f58" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-e74bdd4cb23ea7eb6f58">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#8C6AB0","#86308F","#F7FCFD","#50004D","#852A8B","#852B8C","#8D79B8","#740A70","#88429D","#8B57A7","#7B0D76","#9CB7D8","#97ACD2","#863593","#DCE9F2","#4D004B","#E6F0F6","#D7E5F0","#EDF5F9","#8A55A6","#680664","#A2BFDC"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#8C6AB0","#86308F","#F7FCFD","#50004D","#852A8B","#852B8C","#8D79B8","#740A70","#88429D","#8B57A7","#7B0D76","#9CB7D8","#97ACD2","#863593","#DCE9F2","#4D004B","#E6F0F6","#D7E5F0","#EDF5F9","#8A55A6","#680664","#A2BFDC"],"fillOpacity":0.8},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#4D004B , #6A0767 7.22599683997051%, #863291 20.3839376469185%, #8B5EAB 33.5418784538665%, #8D8BC0 46.6998192608146%, #9AB4D6 59.8577600677626%, #BACFE4 73.0157008747106%, #DDE9F3 86.1736416816586%, #F6FBFD 99.3315824886066%, #F7FCFD "],"labels":["1","2","3","4","5","6","7","8"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"numeric","title":"SOM","extra":{"p_1":0.07225996839970515,"p_n":0.993315824886066},"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

\

#### ammonium {.unnumbered}


```{=html}
<div id="htmlwidget-10dbfe4bb0a82417c43f" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-10dbfe4bb0a82417c43f">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#EB6627","#F1ED6F","#F2741C","#F2E65F","#F5F992","#FA9307","#F98A0B","#FBFEA3","#EF6E21","#FBBE23","#FAC026","#FA9207","#6A176E","#F78311","#F78212","#F3F588","#5B116E","#EC6726","#59106E","#FC9F07","#FCFFA4","#000004"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#EB6627","#F1ED6F","#F2741C","#F2E65F","#F5F992","#FA9307","#F98A0B","#FBFEA3","#EF6E21","#FBBE23","#FAC026","#FA9207","#6A176E","#F78311","#F78212","#F3F588","#5B116E","#EC6726","#59106E","#FC9F07","#FCFFA4","#000004"],"fillOpacity":0.8},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#FCFFA4 , #F1F179 4.29528546875055%, #FA9008 24.2518627903328%, #CF4446 44.208440111915%, #83206C 64.1650174334972%, #300A5B 84.1215947550795%, #000004 "],"labels":["0.9","1.0","1.1","1.2","1.3"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"numeric","title":"ammonium","extra":{"p_1":0.0429528546875055,"p_n":0.8412159475507947},"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

\

#### phosphorous {.unnumbered}


```{=html}
<div id="htmlwidget-908665a3c0f430b09452" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-908665a3c0f430b09452">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#F4695C","#FED597","#FA815F","#FDDA9C","#FCFBBD","#FC8E64","#FA7F5E","#FCF6B8","#F66E5C","#FEB87F","#FEB77E","#FEA06E","#57157E","#F9795D","#F3655C","#FCEFB1","#53137D","#EB5760","#621980","#FE9F6D","#FCFDBF","#000004"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#F4695C","#FED597","#FA815F","#FDDA9C","#FCFBBD","#FC8E64","#FA7F5E","#FCF6B8","#F66E5C","#FEB87F","#FEB77E","#FEA06E","#57157E","#F9795D","#F3655C","#FCEFB1","#53137D","#EB5760","#621980","#FE9F6D","#FCFDBF","#000004"],"fillOpacity":0.8},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#FCFDBF , #FED093 9.62656801442395%, #F76F5C 29.930452394198%, #B5367A 50.2343367739721%, #621980 70.5382211537461%, #120D32 90.8421055335202%, #000004 "],"labels":["0.18","0.20","0.22","0.24","0.26"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"numeric","title":"phos","extra":{"p_1":0.09626568014423946,"p_n":0.9084210553352017},"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

\

### Climate {.tabset .tabset-pills}

\

#### Precipitation {.unnumbered}

ppt3yr = mean annual precipitation (determined over a 3-year window)\


```{=html}
<div id="htmlwidget-223c0fd46a21c96cc5ee" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-223c0fd46a21c96cc5ee">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#F7FBFF","#EBF3FB","#307EBC","#EBF3FB","#C3DAEE","#E1EDF8","#ACD0E6","#E1EDF8","#094A92","#ACD0E6","#D2E3F3","#95C5DF","#A9CFE5","#1F6DB2","#4393C6","#75B3D8","#094A91","#09488F","#1963AA","#DBE9F6","#DFECF7","#08306B"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#F7FBFF","#EBF3FB","#307EBC","#EBF3FB","#C3DAEE","#E1EDF8","#ACD0E6","#E1EDF8","#094A92","#ACD0E6","#D2E3F3","#95C5DF","#A9CFE5","#1F6DB2","#4393C6","#75B3D8","#094A91","#09488F","#1963AA","#DBE9F6","#DFECF7","#08306B"],"fillOpacity":0.9},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#F7FBFF , #F4F9FE 1.32331142115763%, #DEEBF7 12.7410087835174%, #C8DCF0 24.1587061458772%, #A4CDE3 35.576403508237%, #78B5D9 46.9941008705968%, #519BCB 58.4117982329566%, #317EBC 69.8294955953164%, #1761A8 81.2471929576762%, #094387 92.6648903200361%, #08306B "],"labels":["200","300","400","500","600","700","800","900","1,000"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"numeric","title":"ppt3yr","extra":{"p_1":0.01323311421157632,"p_n":0.9266489032003605},"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

\

#### Growing degree days {.unnumbered}

GDD3yr = growing degree days (determined over a 3-year window)\


```{=html}
<div id="htmlwidget-ef6bdfacada328006df6" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-ef6bdfacada328006df6">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#FDB52E","#3E049C","#5B01A5","#D45270","#E4695E","#A01A9C","#F9963F","#8C0BA5","#3E049C","#910EA3","#C23C81","#B12A90","#F58B47","#7E03A8","#B7318A","#D14E72","#260591","#9C179E","#CC4778","#F0F921","#BA3388","#0D0887"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#FDB52E","#3E049C","#5B01A5","#D45270","#E4695E","#A01A9C","#F9963F","#8C0BA5","#3E049C","#910EA3","#C23C81","#B12A90","#F58B47","#7E03A8","#B7318A","#D14E72","#260591","#9C179E","#CC4778","#F0F921","#BA3388","#0D0887"],"fillOpacity":0.8},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#F0F921 , #FDC827 11.4149622716462%, #F9983E 24.0528042695774%, #E76E5B 36.6906462675087%, #CC4977 49.3284882654399%, #AB2494 61.9663302633712%, #8004A8 74.6041722613024%, #4D02A2 87.2420142592337%, #0E0887 99.8798562571649%, #0D0887 "],"labels":["2,500","3,000","3,500","4,000","4,500","5,000","5,500","6,000"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"numeric","title":"GDD3yr","extra":{"p_1":0.1141496227164619,"p_n":0.998798562571649},"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

\

### Plant Traits {.tabset .tabset-pills}

\

#### Specific root length {.unnumbered}

avg_SRL = specific root length\


```{=html}
<div id="htmlwidget-d22b987e1c2c99ee15f4" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-d22b987e1c2c99ee15f4">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#EEF6FA","#A0BDDB","#E7F1F7","#C8D9EA","#B6CDE3","#A7C2DD","#88449F","#95AAD0","#8B5AA8","#8F9BC9","#C6D8E9","#F7FCFD","#4D004B","#8C6FB3","#D6E4F0","#F0F7FA","#8B5BA9","#9EBCDA","#F4FAFC","#92A2CC","#A0BDDB","#CBDCEB"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#EEF6FA","#A0BDDB","#E7F1F7","#C8D9EA","#B6CDE3","#A7C2DD","#88449F","#95AAD0","#8B5AA8","#8F9BC9","#C6D8E9","#F7FCFD","#4D004B","#8C6FB3","#D6E4F0","#F0F7FA","#8B5BA9","#9EBCDA","#F4FAFC","#92A2CC","#A0BDDB","#CBDCEB"],"fillOpacity":0.8},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#F7FCFD , #D8E6F0 15.7180924411707%, #9CB7D8 39.0466225732315%, #8C6BB1 62.3751527052922%, #821A81 85.703682837353%, #4D004B "],"labels":["1,500","2,000","2,500","3,000"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"numeric","title":"avg_SRL","extra":{"p_1":0.1571809244117066,"p_n":0.8570368283735305},"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

\

#### Specific leaf area {.unnumbered}

avg_SLA = specific leaf area\


```{=html}
<div id="htmlwidget-77f73dec4a6f59bc70b3" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-77f73dec4a6f59bc70b3">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#287F92","#7AC19C","#BADE95","#2A8394","#3AA2A3","#88C79A","#D9ED92","#61B59E","#184E77","#90CB99","#339FA3","#60B49F","#B5DC95","#61B59F","#83C49B","#45A8A2","#63B69E","#44A7A2","#6BBA9D","#2B8595","#26778D","#96CE99"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#287F92","#7AC19C","#BADE95","#2A8394","#3AA2A3","#88C79A","#D9ED92","#61B59E","#184E77","#90CB99","#339FA3","#60B49F","#B5DC95","#61B59F","#83C49B","#45A8A2","#63B69E","#44A7A2","#6BBA9D","#2B8595","#26778D","#96CE99"],"fillOpacity":0.9},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#D9ED92 , #D3EA92 1.70954848069666%, #AFD996 12.506406992151%, #8CC99A 23.3032655036054%, #68B89E 34.1001240150598%, #44A7A2 44.8969825265141%, #30969E 55.6938410379685%, #2A8495 66.4906995494229%, #24738B 77.2875580608773%, #1E6181 88.0844165723316%, #184F78 98.881275083786%, #184E77 "],"labels":["100","110","120","130","140","150","160","170","180","190"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"numeric","title":"avg_SLA","extra":{"p_1":0.01709548480696657,"p_n":0.98881275083786},"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

\

#### Herbivory percent {.unnumbered}

herbivory_perc = average site level damage estimate for herbivory, averaged over all species and individuals at the site; could be used to indicate herbivory pressure at the site level - ranges from 1:17 (%)\


```{=html}
<div id="htmlwidget-6e8557c0e3292337bfb7" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-6e8557c0e3292337bfb7">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#74409E","#B27DD6","#AD78D1","#9F6AC5","#E0AAFF","#AE79D2","#E0AAFF","#7743A1","#BD88E0","#A36EC8","#471476","#834FAC","#E0AAFF","#10002B","#CB96EC","#AA75CF","#7944A2","#B37ED7","#C28CE4","#B17CD5","#E0AAFF","#A26DC7"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#74409E","#B27DD6","#AD78D1","#9F6AC5","#E0AAFF","#AE79D2","#E0AAFF","#7743A1","#BD88E0","#A36EC8","#471476","#834FAC","#E0AAFF","#10002B","#CB96EC","#AA75CF","#7944A2","#B37ED7","#C28CE4","#B17CD5","#E0AAFF","#A26DC7"],"fillOpacity":0.8},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#E0AAFF , #E0AAFF 0%, #B984DC 11.7647058823529%, #925EB9 23.5294117647059%, #6C3897 35.2941176470588%, #451274 47.0588235294118%, #340760 58.8235294117647%, #290551 70.5882352941177%, #1F0341 82.3529411764706%, #150132 94.1176470588235%, #10002B "],"labels":["0","2","4","6","8","10","12","14","16"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"numeric","title":"herbivory_perc","extra":{"p_1":0,"p_n":0.9411764705882353},"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

\

### Factors {.tabset .tabset-pills}

\

#### Longitude (longitudinal 'gradients') {.unnumbered}

\


```{=html}
<div id="htmlwidget-2344de9ff60f5ce66e77" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-2344de9ff60f5ce66e77">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#3D91C6","#3D91C6","#6543A7","#3D91C6","#3D91C6","#3D91C6","#6543A7","#3D91C6","#FD3C76","#3D91C6","#3D91C6","#6543A7","#3D91C6","#6543A7","#FD3C76","#6543A7","#6543A7","#FD3C76","#FD3C76","#3D91C6","#3D91C6","#FD3C76"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#3D91C6","#3D91C6","#6543A7","#3D91C6","#3D91C6","#3D91C6","#6543A7","#3D91C6","#FD3C76","#3D91C6","#3D91C6","#6543A7","#3D91C6","#6543A7","#FD3C76","#6543A7","#6543A7","#FD3C76","#FD3C76","#3D91C6","#3D91C6","#FD3C76"],"fillOpacity":0.8},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLegend","args":[{"colors":["#3D91C6","#6543A7","#FD3C76"],"labels":["West","Middle","East"],"na_color":null,"na_label":"NA","opacity":0.5,"position":"bottomright","type":"factor","title":"Gradient","extra":null,"layerId":null,"className":"info legend","group":"circles"}]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```

\
\
\

------------------------------------------------------------------------

------------------------------------------------------------------------

\
\

# Fixing mislabeling {.hidden .unnumbered .unlisted}




# Ordinations/NMDS

Ordination Example on the Gap Statistic




![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_DriversOfFungalCommunities_files/figure-html/plot-gap-1.png)<!-- -->





## Lat/Long gradients

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_DriversOfFungalCommunities_files/figure-html/unnamed-chunk-4-1.png)<!-- -->![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_DriversOfFungalCommunities_files/figure-html/unnamed-chunk-4-2.png)<!-- -->![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_DriversOfFungalCommunities_files/figure-html/unnamed-chunk-4-3.png)<!-- -->![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_DriversOfFungalCommunities_files/figure-html/unnamed-chunk-4-4.png)<!-- -->
```{=html}
<div id="htmlwidget-54b382948f5da35820ce" style="width:600px;height:450px;" class="leaflet html-widget "></div>
<script type="application/json" data-for="htmlwidget-54b382948f5da35820ce">{"x":{"options":{"minZoom":4,"maxZoom":7,"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap<\/a> contributors"}]},{"method":"addCircleMarkers","args":[[37.627547,29.23005,33.307867,36.23189,40.81553,30.34736,36.0235,32.03624,31.09185,31.95908,32.74914,39.0878,41.122,34.9779,39.0745,40.66462,30.1847,36.0417,39.80954,38.188203,34.342141,29.39087],[-106.253289,-103.37832,-97.60541670000001,-106.37604,-104.7456,-104.046683,-99.9439,-107.64451,-94.26535,-104.76002,-108.2876,-99.1559,-104.5313,-97.5228,-96.6036,-98.9063,-97.86750000000001,-94.8137,-94.13184,-106.514975,-106.62261,-95.03443],10,null,null,{"interactive":true,"className":"","stroke":true,"color":["#25B480","#580080","#C05780","#229680","#40F880","#4C1880","#969280","#0C3C80","#FD2880","#403B80","#004B80","#A4D380","#44FF80","#C27B80","#D2D380","#A9F580","#BC1480","#F39280","#FFE380","#20C080","#1E6E80","#EF0380"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#25B480","#580080","#C05780","#229680","#40F880","#4C1880","#969280","#0C3C80","#FD2880","#403B80","#004B80","#A4D380","#44FF80","#C27B80","#D2D380","#A9F580","#BC1480","#F39280","#FFE380","#20C080","#1E6E80","#EF0380"],"fillOpacity":0.8},null,null,["BLM","BNP","CAD","CNF","CPR","DMT","FCP","FMT","SFA","GMT","GNF","HAR","HPG","KAE","KNZ","LAR","LBJ","NWP","ONF","RNF","SEV","UHC"],null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"setView":[[34.62755,-100.25329],5,[]],"limits":{"lat":[29.23005,41.122],"lng":[-108.2876,-94.13184]}},"evals":[],"jsHooks":[]}</script>
```


# in progress {.hidden .unlisted .unnumbered}

## all?


```r
# no facet

plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k3.ord, color = "Gradient") +
  geom_text(mapping = aes(label = Site_Grass), size = 4, vjust = 1.5) +
  scale_color_manual(values = fun_grad_cols_n3
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k3.ord, color = "Bin") +
  geom_text(mapping = aes(label = Site_Grass), size = 4, vjust = 1.5) +
  scale_color_manual(values = fun_bin_cols_n5
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k3.ord, color = "Grass") +
  geom_text(mapping = aes(label = Site_Grass), size = 4, vjust = 1.5) +
  scale_color_manual(values = fun_grass_cols
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

# facet Grass
plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k3.ord, color = "Gradient") +
  geom_text(mapping = aes(label = Site_Grass), size = 4.5, vjust = 1.5) +
  scale_color_manual(values = fun_grad_cols_n3
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  facet_wrap(.~Grass, scales = "free") +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k3.ord, color = "Bin") +
  geom_text(mapping = aes(label = Site_Grass), size = 4.5, vjust = 1.5) +
  scale_color_manual(values = fun_bin_cols_n5
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 4, alpha = 0.9) +
  # scale_size_manual(values = c(3,6)) +
  facet_wrap(.~Grass, scales = "free") +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3") +
  theme_bw() + #default is 11
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

# facet Bin
plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k3.ord, color = "Grass") +
  geom_text(mapping = aes(label = Site), size = 4.5, vjust = 1.5) +
  scale_color_manual(values = fun_grass_cols
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  facet_wrap(.~Bin, scales = "free") +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())
```


```r
# facet Bin*Gradient
plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k3.ord, color = "Grass") +
  geom_text(mapping = aes(label = Site), size = 4.5, vjust = 1.5) +
  scale_color_manual(values = fun_grass_cols
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  facet_wrap(.~Bin:Gradient) +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3, scales=fixed") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k3.ord, color = "Grass") +
  geom_text(mapping = aes(label = Site), size = 4, vjust = 1.5) +
  scale_color_manual(values = fun_grass_cols
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  facet_wrap(.~Bin:Gradient, scales = "free") +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3, scales=free") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

adonis2(phyloseq::distance(Fun_wholecommunity, method="bray") ~ Site*Grass, 
          data = (as(sample_data(Fun_wholecommunity), "data.frame")))
```



## long


```r
plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k3.ord, color = "Gradient", label = "Grass") +
  scale_color_manual(values = fun_grad_cols_n3
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k5.ord, color = "Gradient", label = "Grass") +
  scale_color_manual(values = fun_grad_cols_n3
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=5") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())
```


```r
plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k3.ord, color = "Gradient", label = "Site") +
  scale_color_manual(values = fun_grad_cols_n3
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  facet_wrap(.~Grass) +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k5.ord, color = "Gradient", label = "Site") +
  scale_color_manual(values = fun_grad_cols_n3
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  facet_wrap(.~Grass) +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=5") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())
```

## lat


```r
plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k3.ord, color = "Bin", label = "Grass") +
  scale_color_manual(values = fun_bin_cols_n5
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k5.ord, color = "Bin", label = "Grass") +
  scale_color_manual(values = fun_bin_cols_n5
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 3, alpha = 0.9) +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=5") +
  theme_bw() +
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())
```


```r
plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k3.ord, color = "Bin") +
  geom_text(mapping = aes(label = Site), size = 5, vjust = 1.5) +
  scale_color_manual(values = fun_bin_cols_n5
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 4, alpha = 0.9) +
  # scale_size_manual(values = c(3,6)) +
  facet_wrap(.~Grass, scales = "free") +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3") +
  theme_bw() + #default is 11
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

plot_ordination(Fun_wholecommunity, Fun_wholecommunity.k5.ord, color = "Bin") +
  geom_text(mapping = aes(label = Site), size = 5, vjust = 1.5) +
  scale_color_manual(values = fun_bin_cols_n5
                     # ,name="Grass Host"
                     ) +
  geom_point(size = 4, alpha = 0.9) +
  facet_wrap(.~Grass, scales = "free") +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=5") +
  theme_bw() + #default is 11
  theme(legend.position="right",
    axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())
```



\
\

# Clustering (TBD)

\

When performing microbiome sample clustering, both model-based methods and machine learning methods have been used. Machine learning methods, which rely on defined distance metrics, are used more frequently than model-based statistical methods, due to their efficient implementation and easy interpretation. In this paper, we focused on the partition around medoids (PAM) [14] clustering method, which is related to but considered more robust than K-means. In contrast to K-means, which can be sensitive to the effects of outliers, PAM’s optimization goal is to minimize the sum of distances to the medoids instead of minimizing the sum of the squared distances to the cluster centers. 


next:
http://joey711.github.io/phyloseq-demo/phyloseq-demo.html - bioenv


