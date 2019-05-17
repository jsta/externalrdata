
<!-- README.md is generated from README.Rmd. Please edit that file -->

## externalrdata

[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Travis-CI Build
Status](https://travis-ci.org/jsta/externalrdata.svg?branch=master)](https://travis-ci.org/jsta/externalrdata)

This package is a template R package to fetch, cache, and serve data
from external sources. All data sources are assumed to be `csv` files.
The typical workflow would be to fork this package and rename the
project-specific pieces including:

  - `temp_get`
      - *baseurl*
      - *files*
  - `cache_path`
      - *appname*
      - *appauthor*
  - function prefixes (e.g. change `temp_get` to
    `myspecificproject_get`)

## Installation

``` r
# install devtools if not found
# install.packages(devtools)
devtools::install_github("jsta/externalrdata")
```

## Usage

``` r
library(externalrdata)
```

### Download external data and store in file system

``` r
# for demonstration purposes we will set on-the-fly compilation to FALSE
temp_get(version_id = "1", compile = FALSE)
```

### List files

``` r
temp_ls(version_id = "1")
#> [1] "rows.csv"
```

### Compile version

``` r
# these files have metadata headers that need to be skipped
temp_compile(version_id = "1", skip = c(16, 38))
#> data compiled to /home/jose/.local/share/externalrdata//data_1.rds
```

### List versions

``` r
temp_versions()
#> [1] "1"
```

### Load data

``` r
dt <- temp_load(version_id = "1")
names(dt)
#> [1] "rows"
lapply(dt, head)
#> $rows
#>   S.MARTIN.LUTHER.KING.JR.BLVD...W.PRATT.ST S.B  MLK.Jr..Blvd..
#> 1                ORLEANS ST & N LINWOOD AVE E/B         Orleans
#> 2          E NORTHERN PKWY & SPRINGLAKE WAY W/B Northern Pkwy\n
#> 3             W COLD SPRING LN & ROLAND AVE E/B   Cold Spring\n
#> 4                 E NORTHERN PKWY & YORK RD W/B Northern Pkwy\n
#> 5                 N CHARLES ST & E LAKE AVE S/B         Charles
#> 6               W FAYETTE ST & N LIBERTY ST W/B       Fayette\n
#>              Pratt.St         MLK.Jr..Blvd.....Pratt.St
#> 1         Linwood Ave           Orleans   & Linwood Ave
#> 2      Springlake Way Northern Pkwy\n  & Springlake Way
#> 3          Roland Ave       Cold Spring\n  & Roland Ave
#> 4           York Road      Northern Pkwy\n  & York Road
#> 5            Lake Ave                Charles & Lake Ave
#> 6 Liberty Heights Ave  Fayette\n  & Liberty Heights Ave
#>   X.39.286027...76.627846. X11 X168 X27953
#> 1  (39.295866, -76.576427) 141  123  27935
#> 2  (39.364311, -76.617699) 116  271  14009
#> 3  (39.343906, -76.635426) 214  236  14004
#> 4  (39.365146, -76.609922) 132  257  14009
#> 5  (39.369054, -76.625827) 235  272  14009
#> 6  (39.290504, -76.617661)  65    6  13642
```

## Examples

### Uses this template

  - <https://github.com/jsta/nesRdata>
  - <https://github.com/jsta/nsws>

### Uses as similar strategy

  - <https://github.com/jsta/nhdR>

## Contributing

Contributions welcome in the form of issues and pull requests.
