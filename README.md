
<!-- README.md is generated from README.Rmd. Please edit that file -->
externalrdata
-------------

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip) [![Travis-CI Build Status](https://travis-ci.org/jsta/externalrdata.svg?branch=master)](https://travis-ci.org/jsta/externalrdata) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/externalrdata)](https://cran.r-project.org/package=externalrdata) [![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/externalrdata)](https://cran.r-project.org/package=externalrdata)

This package is a template R package to fetch, cache, and serve data from external sources. The typical workflow would be to fork this package and rename the project-specific pieces including:

-   `temp_get`
    -   *baseurl*
    -   *files*
-   `cache_path`
    -   *appname*
    -   *appauthor*
-   function prefixes (e.g. change `temp_get` to `myspecificproject_get`)

Installation
------------

``` r
# install devtools if not found
# install.packages(devtools)
devtools::install_github("jsta/externalrdata")
```

Usage
-----

``` r
library(externalrdata)
```

### Download external data and store in file system

``` r
temp_get("1")
#> A local copy of ftp://climb.genomics.cn/pub/10.5524/100001_101000/100244/Cirflux_ScalingAndModeling_canopyLevelData_GigaScience.csv already exists on disk
#> A local copy of ftp://climb.genomics.cn/pub/10.5524/100001_101000/100244/Cirflux_ScalingAndModeling_leafLevelData_GigaScience.csv already exists on disk
#> temp compiled to /home/jose/.local/share/externalrdata//data_1.rds
```

### Load data

``` r
lapply(temp_load("1"), head)
#> $Cirflux_ScalingAndModeling_canopyLevelData_GigaScience
#>   doy    HM Mac       CF         E    doyHM       RH       Ca     Temp
#> 1 243 12.25   1 19.78839        NA 243.5104 57.63879 399.9181 27.94726
#> 2 243 12.50   1 19.72713 0.6034133 243.5208 57.40352 399.6133 27.89828
#> 3 243 12.50   3 26.87623 0.5732674 243.5208 57.95871 399.5078 27.87452
#> 4 243 12.50   5 25.45082 0.9285982 243.5208 57.43124 399.1546 28.07193
#> 5 243 12.75   1 19.56377 0.5966896 243.5312 57.05452 399.7737 27.98397
#> 6 243 12.75   3 27.07823 0.5784423 243.5312 55.69227 399.1530 27.56341
#>        VPD
#> 1 1.602927
#> 2 1.607231
#> 3 1.584086
#> 4 1.622530
#> 5 1.628518
#> 6 1.639416
#> 
#> $Cirflux_ScalingAndModeling_leafLevelData_GigaScience
#>   Phase Round Mac doy hour_minute    doyHM     edoyHM     Photo      Cond
#> 1   BCL     1   8 225    13.36333 224.5568 -0.4431944 17.467428 0.5245078
#> 2   BCL     1  10 225    12.76148 224.5317 -0.4682716 16.995131 0.4855805
#> 3   BCL     1  12 225    12.23556 224.5098 -0.4901852 18.187724 0.4249060
#> 4   BCL     2   8 225    17.39722 224.7249 -0.2751157  9.344222 0.1351165
#> 5   BCL     2  10 225    16.71083 224.6963 -0.3037153 10.434296 0.1255458
#> 6   BCL     2  12 225    15.98333 224.6660 -0.3340278 10.942486 0.1708158
#>         Ci   Trmmol     VpdL    Tleaf     TBlk     CO2R     CO2S     PARi
#> 1 327.6547 6.554678 1.296498 27.45328 27.97338 400.0453 392.0341 498.2016
#> 2 315.2004 6.081539 1.392726 27.78813 27.97477 400.1950 392.4465 496.6033
#> 3 312.9400 5.473191 1.323274 27.63768 27.97567 401.0077 392.8763 499.9037
#> 4 262.1855 2.402542 1.813357 27.93825 27.97679 399.2937 395.1784 301.9572
#> 5 250.6209 2.326804 1.841009 28.49788 27.97636 399.2225 394.6837 301.8735
#> 6 279.9796 2.881306 1.683198 27.98449 27.97748 399.5314 394.7020 299.9138
#>    Photo.SE    Cond.SE     Ci.SE Trmmol.SE    VpdL.SE   Tleaf.SE
#> 1 0.7031462 0.04619687  6.247383 0.3885585 0.05465049 0.24630806
#> 2 0.9458701 0.13348989 20.329685 1.0603156 0.18948384 0.65541659
#> 3 0.8577592 0.04075373  7.604148 0.3015672 0.04605242 0.07294734
#> 4 0.8592941 0.03885917 19.457671 0.5457852 0.08881719 0.33510276
#> 5 1.5070798 0.01700748  3.149908 0.2589011 0.05565919 0.15341785
#> 6 1.0152064 0.02373249  3.777135 0.3355953 0.03568582 0.15803726
#>       TBlk.SE   CO2R.SE   CO2S.SE   PARi.SE
#> 1 0.001442048 0.2591711 0.4555071 1.5448862
#> 2 0.001994697 0.1366632 0.4716765 0.7736556
#> 3 0.000510694 0.2537938 0.4434148 0.1052906
#> 4 0.000559052 0.2784596 0.1790262 0.1442307
#> 5 0.000874372 0.1418536 0.7376289 0.1275327
#> 6 0.001087110 0.3937202 0.8308930 1.2680722
```
