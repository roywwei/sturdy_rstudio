Untitled
================
roywei

# 调用要使用的R包

``` r
require(pedquant)
require(tidytable)
require(purrr)
require(ggplot2)
```

\#获取数据整理数据

    ##  1/10 510050.ss
    ##  2/10 510300.ss
    ##  3/10 159919.sz
    ##  4/10 000300.ss
    ##  5/10 000852.ss
    ##  6/10 510500.ss
    ##  7/10 159915.sz
    ##  8/10 159922.sz
    ##  9/10 159901.sz
    ## 10/10 000016.ss

    ## Warning: `select.()` was deprecated in tidytable v0.10.0.
    ## ℹ Please use `select()` instead.
    ## ℹ Please note that all `verb.()` syntax has now been deprecated.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
    ## generated.

    ## Registered S3 method overwritten by 'quantmod':
    ##   method            from
    ##   as.zoo.data.frame zoo

|       Period       | 510050.SS | 510300.SS | 159919.SZ | 000300.SS | 000852.SS | 510500.SS | 159915.SZ | 159922.SZ | 159901.SZ | 000016.SS |
|:------------------:|:---------:|:---------:|:---------:|:---------:|:---------:|:---------:|:---------:|:---------:|:---------:|:---------:|
| 2020/03/20 0:00:00 |     0     |     0     |     0     |     0     |     0     |     0     |     0     |     0     |     0     |     0     |
| 2020/03/23 0:00:00 | -0.02743  | -0.03292  | -0.03206  | -0.03422  | -0.04581  | -0.04083  | -0.04768  | -0.04248  | -0.04483  | -0.02652  |
| 2020/03/24 0:00:00 |  0.02857  |  0.02382  |  0.02122  |  0.0265   |  0.01842  |  0.0141   |  0.02523  |  0.0161   |  0.02581  |  0.03069  |
| 2020/03/25 0:00:00 |  0.02258  |  0.02597  |  0.02557  |  0.02652  |  0.02318  |  0.02389  |  0.02946  |  0.02294  |  0.0377   |  0.02278  |
| 2020/03/26 0:00:00 | -0.003729 | -0.006225 | -0.004528 | -0.006595 | -0.009109 | -0.009633 | -0.003771 | -0.007467 | -0.007873 | -0.004049 |
| 2020/03/27 0:00:00 | 0.005588  | 0.004605  | 0.003996  | 0.003242  | -0.007502 | -0.004311 | -0.01249  | -0.005132 | -0.002232 | 0.004511  |

数据整理宽数据变长数据，并绘制图 \## 数据描述统计

``` r
ret1 %>% 
  psych::describe()
```

    ##           vars   n mean   sd median trimmed  mad   min  max range   skew
    ## 510050.SS    1 727    0 0.01      0       0 0.01 -0.05 0.08  0.14   0.29
    ## 510300.SS    2 727    0 0.01      0       0 0.01 -0.05 0.07  0.12  -0.01
    ## 159919.SZ    3 727    0 0.01      0       0 0.01 -0.05 0.07  0.12   0.07
    ## 000300.SS    4 727    0 0.01      0       0 0.01 -0.05 0.06  0.11  -0.18
    ## 000852.SS    5 727    0 0.01      0       0 0.01 -0.08 0.05  0.13  -0.59
    ## 510500.SS    6 727    0 0.01      0       0 0.01 -0.14 0.05  0.18  -2.02
    ## 159915.SZ    7 726    0 0.02      0       0 0.02 -0.06 0.05  0.12  -0.12
    ## 159922.SZ    8 727    0 0.01      0       0 0.01 -0.10 0.05  0.15  -1.25
    ## 159901.SZ    9 726    0 0.03      0       0 0.01 -0.71 0.05  0.76 -17.88
    ## 000016.SS   10 727    0 0.01      0       0 0.01 -0.05 0.07  0.12   0.04
    ##           kurtosis se
    ## 510050.SS     3.99  0
    ## 510300.SS     2.76  0
    ## 159919.SZ     3.00  0
    ## 000300.SS     1.77  0
    ## 000852.SS     2.19  0
    ## 510500.SS    17.82  0
    ## 159915.SZ     0.64  0
    ## 159922.SZ     8.22  0
    ## 159901.SZ   417.23  0
    ## 000016.SS     2.44  0

``` r
ret1 %>% 
  summarytools::descr()
```

    ## Descriptive Statistics  
    ## 
    ##                     000016.SS   000300.SS   000852.SS   159901.SZ   159915.SZ   159919.SZ
    ## ----------------- ----------- ----------- ----------- ----------- ----------- -----------
    ##              Mean        0.00        0.00        0.00        0.00        0.00        0.00
    ##           Std.Dev        0.01        0.01        0.01        0.03        0.02        0.01
    ##               Min       -0.05       -0.05       -0.08       -0.71       -0.06       -0.05
    ##                Q1       -0.01       -0.01       -0.01       -0.01       -0.01       -0.01
    ##            Median        0.00        0.00        0.00        0.00        0.00        0.00
    ##                Q3        0.01        0.01        0.01        0.01        0.01        0.01
    ##               Max        0.07        0.06        0.05        0.05        0.05        0.07
    ##               MAD        0.01        0.01        0.01        0.01        0.02        0.01
    ##               IQR        0.01        0.01        0.02        0.02        0.02        0.01
    ##                CV   139607.48      110.46       59.80      -43.15       67.15      107.96
    ##          Skewness        0.04       -0.18       -0.59      -17.88       -0.12        0.07
    ##       SE.Skewness        0.09        0.09        0.09        0.09        0.09        0.09
    ##          Kurtosis        2.44        1.77        2.19      417.23        0.64        3.00
    ##           N.Valid      727.00      727.00      727.00      726.00      726.00      727.00
    ##         Pct.Valid      100.00      100.00      100.00       99.86       99.86      100.00
    ## 
    ## Table: Table continues below
    ## 
    ##  
    ## 
    ##                     159922.SZ   510050.SS   510300.SS   510500.SS
    ## ----------------- ----------- ----------- ----------- -----------
    ##              Mean        0.00        0.00        0.00        0.00
    ##           Std.Dev        0.01        0.01        0.01        0.01
    ##               Min       -0.10       -0.05       -0.05       -0.14
    ##                Q1       -0.01       -0.01       -0.01       -0.01
    ##            Median        0.00        0.00        0.00        0.00
    ##                Q3        0.01        0.01        0.01        0.01
    ##               Max        0.05        0.08        0.07        0.05
    ##               MAD        0.01        0.01        0.01        0.01
    ##               IQR        0.01        0.01        0.01        0.01
    ##                CV       67.92     1845.84      108.95      101.95
    ##          Skewness       -1.25        0.29       -0.01       -2.02
    ##       SE.Skewness        0.09        0.09        0.09        0.09
    ##          Kurtosis        8.22        3.99        2.76       17.82
    ##           N.Valid      727.00      727.00      727.00      727.00
    ##         Pct.Valid      100.00      100.00      100.00      100.00

``` r
ret1 %>% 
  summarytools::dfSummary()
```

    ## . was converted to a data frame

    ## Data Frame Summary  
    ## .  
    ## Dimensions: 727 x 10  
    ## Duplicates: 0  
    ## 
    ## -----------------------------------------------------------------------------------------------------------
    ## No   Variable    Stats / Values            Freqs (% of Valid)    Graph                 Valid      Missing  
    ## ---- ----------- ------------------------- --------------------- --------------------- ---------- ---------
    ## 1    510050.SS   Mean (sd) : 0 (0)         715 distinct values         :               727        0        
    ##      [numeric]   min < med < max:                                      : .             (100.0%)   (0.0%)   
    ##                  -0.1 < 0 < 0.1                                        : :                                 
    ##                  IQR (CV) : 0 (1845.8)                               . : :                                 
    ##                                                                      : : : :                               
    ## 
    ## 2    510300.SS   Mean (sd) : 0 (0)         722 distinct values         . :             727        0        
    ##      [numeric]   min < med < max:                                      : :             (100.0%)   (0.0%)   
    ##                  0 < 0 < 0.1                                           : :                                 
    ##                  IQR (CV) : 0 (108.9)                                  : : .                               
    ##                                                                      : : : : .                             
    ## 
    ## 3    159919.SZ   Mean (sd) : 0 (0)         715 distinct values         : :             727        0        
    ##      [numeric]   min < med < max:                                      : :             (100.0%)   (0.0%)   
    ##                  0 < 0 < 0.1                                           : :                                 
    ##                  IQR (CV) : 0 (108)                                    : : .                               
    ##                                                                      : : : :                               
    ## 
    ## 4    000300.SS   Mean (sd) : 0 (0)         727 distinct values           :             727        0        
    ##      [numeric]   min < med < max:                                        : .           (100.0%)   (0.0%)   
    ##                  -0.1 < 0 < 0.1                                          : :                               
    ##                  IQR (CV) : 0 (110.5)                                  : : : .                             
    ##                                                                      . : : : : .                           
    ## 
    ## 5    000852.SS   Mean (sd) : 0 (0)         727 distinct values               :         727        0        
    ##      [numeric]   min < med < max:                                            :         (100.0%)   (0.0%)   
    ##                  -0.1 < 0 < 0.1                                            : :                             
    ##                  IQR (CV) : 0 (59.8)                                       : : :                           
    ##                                                                        . : : : : .                         
    ## 
    ## 6    510500.SS   Mean (sd) : 0 (0)         721 distinct values                 :       727        0        
    ##      [numeric]   min < med < max:                                              :       (100.0%)   (0.0%)   
    ##                  -0.1 < 0 < 0                                                  :                           
    ##                  IQR (CV) : 0 (101.9)                                          :                           
    ##                                                                              : : :                         
    ## 
    ## 7    159915.SZ   Mean (sd) : 0 (0)         719 distinct values             :           726        1        
    ##      [numeric]   min < med < max:                                        : : .         (99.9%)    (0.1%)   
    ##                  -0.1 < 0 < 0.1                                          : : :                             
    ##                  IQR (CV) : 0 (67.2)                                   . : : : :                           
    ##                                                                      . : : : : : .                         
    ## 
    ## 8    159922.SZ   Mean (sd) : 0 (0)         718 distinct values               . :       727        0        
    ##      [numeric]   min < med < max:                                            : :       (100.0%)   (0.0%)   
    ##                  -0.1 < 0 < 0                                                : :                           
    ##                  IQR (CV) : 0 (67.9)                                         : :                           
    ##                                                                            : : : :                         
    ## 
    ## 9    159901.SZ   Mean (sd) : 0 (0)         719 distinct values                     :   726        1        
    ##      [numeric]   min < med < max:                                                  :   (99.9%)    (0.1%)   
    ##                  -0.7 < 0 < 0                                                      :                       
    ##                  IQR (CV) : 0 (-43.2)                                              :                       
    ##                                                                                    :                       
    ## 
    ## 10   000016.SS   Mean (sd) : 0 (0)         727 distinct values           :             727        0        
    ##      [numeric]   min < med < max:                                        :             (100.0%)   (0.0%)   
    ##                  -0.1 < 0 < 0.1                                        . : .                               
    ##                  IQR (CV) : 0 (139607.5)                               : : :                               
    ##                                                                      . : : : .                             
    ## -----------------------------------------------------------------------------------------------------------

``` r
ret1 %>% 
  skimr::skim()
```

|                                                  |            |
|:-------------------------------------------------|:-----------|
| Name                                             | Piped data |
| Number of rows                                   | 727        |
| Number of columns                                | 10         |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |            |
| Column type frequency:                           |            |
| numeric                                          | 10         |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |            |
| Group variables                                  | None       |

Data summary

**Variable type: numeric**

| skim_variable | n_missing | complete_rate | mean |   sd |    p0 |   p25 | p50 |  p75 | p100 | hist  |
|:--------------|----------:|--------------:|-----:|-----:|------:|------:|----:|-----:|-----:|:------|
| 510050.SS     |         0 |             1 |    0 | 0.01 | -0.05 | -0.01 |   0 | 0.01 | 0.08 | ▁▇▆▁▁ |
| 510300.SS     |         0 |             1 |    0 | 0.01 | -0.05 | -0.01 |   0 | 0.01 | 0.07 | ▁▆▇▁▁ |
| 159919.SZ     |         0 |             1 |    0 | 0.01 | -0.05 | -0.01 |   0 | 0.01 | 0.07 | ▁▇▇▁▁ |
| 000300.SS     |         0 |             1 |    0 | 0.01 | -0.05 | -0.01 |   0 | 0.01 | 0.06 | ▁▂▇▂▁ |
| 000852.SS     |         0 |             1 |    0 | 0.01 | -0.08 | -0.01 |   0 | 0.01 | 0.05 | ▁▁▅▇▁ |
| 510500.SS     |         0 |             1 |    0 | 0.01 | -0.14 | -0.01 |   0 | 0.01 | 0.05 | ▁▁▁▇▂ |
| 159915.SZ     |         1 |             1 |    0 | 0.02 | -0.06 | -0.01 |   0 | 0.01 | 0.05 | ▁▂▇▅▁ |
| 159922.SZ     |         0 |             1 |    0 | 0.01 | -0.10 | -0.01 |   0 | 0.01 | 0.05 | ▁▁▁▇▁ |
| 159901.SZ     |         1 |             1 |    0 | 0.03 | -0.71 | -0.01 |   0 | 0.01 | 0.05 | ▁▁▁▁▇ |
| 000016.SS     |         0 |             1 |    0 | 0.01 | -0.05 | -0.01 |   0 | 0.01 | 0.07 | ▁▃▇▁▁ |

``` r
ret1 %>% 
  pastecs::stat.desc(norm = T)
```

    ##                  510050.SS     510300.SS     159919.SZ     000300.SS
    ## nbr.val       7.270000e+02  7.270000e+02  7.270000e+02  7.270000e+02
    ## nbr.null      1.000000e+01  6.000000e+00  1.000000e+01  1.000000e+00
    ## nbr.na        0.000000e+00  0.000000e+00  0.000000e+00  0.000000e+00
    ## min          -5.255785e-02 -4.937696e-02 -4.978692e-02 -5.068431e-02
    ## max           8.478633e-02  7.080112e-02  7.448666e-02  5.512915e-02
    ## range         1.373442e-01  1.201781e-01  1.242736e-01  1.058135e-01
    ## sum           4.942036e-03  8.164575e-02  8.178379e-02  8.033703e-02
    ## median        0.000000e+00  0.000000e+00  0.000000e+00  1.933695e-04
    ## mean          6.797849e-06  1.123050e-04  1.124949e-04  1.105049e-04
    ## SE.mean       4.653711e-04  4.537810e-04  4.504192e-04  4.527197e-04
    ## CI.mean.0.95  9.136338e-04  8.908797e-04  8.842796e-04  8.887961e-04
    ## var           1.574466e-04  1.497018e-04  1.474919e-04  1.490024e-04
    ## std.dev       1.254777e-02  1.223527e-02  1.214462e-02  1.220665e-02
    ## coef.var      1.845845e+03  1.089468e+02  1.079571e+02  1.104626e+02
    ## skewness      2.907983e-01 -5.048130e-03  7.061350e-02 -1.816300e-01
    ## skew.2SE      1.603788e+00 -2.784104e-02  3.894419e-01 -1.001711e+00
    ## kurtosis      3.986435e+00  2.764862e+00  2.997821e+00  1.771052e+00
    ## kurt.2SE      1.100780e+01  7.634653e+00  8.277927e+00  4.890432e+00
    ## normtest.W    9.643125e-01  9.712393e-01  9.712838e-01  9.812740e-01
    ## normtest.p    2.588299e-12  9.248267e-11  9.479276e-11  5.054029e-08
    ##                  000852.SS     510500.SS     159915.SZ     159922.SZ
    ## nbr.val       7.270000e+02  7.270000e+02  7.260000e+02  7.270000e+02
    ## nbr.null      1.000000e+00  6.000000e+00  5.000000e+00  9.000000e+00
    ## nbr.na        0.000000e+00  0.000000e+00  1.000000e+00  0.000000e+00
    ## min          -8.132766e-02 -1.363053e-01 -6.448925e-02 -1.023826e-01
    ## max           5.074896e-02  4.644455e-02  5.352141e-02  4.506149e-02
    ## range         1.320766e-01  1.827499e-01  1.180107e-01  1.474441e-01
    ## sum           1.722492e-01  9.323203e-02  1.875416e-01  1.335314e-01
    ## median        1.136615e-03  7.935879e-04 -4.179155e-04  9.168905e-04
    ## mean          2.369315e-04  1.282421e-04  2.583218e-04  1.836745e-04
    ## SE.mean       5.255200e-04  4.848780e-04  6.437843e-04  4.626919e-04
    ## CI.mean.0.95  1.031720e-03  9.519304e-04  1.263904e-03  9.083739e-04
    ## var           2.007765e-04  1.709226e-04  3.008967e-04  1.556390e-04
    ## std.dev       1.416956e-02  1.307374e-02  1.734637e-02  1.247553e-02
    ## coef.var      5.980447e+01  1.019457e+02  6.715025e+01  6.792196e+01
    ## skewness     -5.881505e-01 -2.015512e+00 -1.164628e-01 -1.253303e+00
    ## skew.2SE     -3.243721e+00 -1.111579e+01 -6.418663e-01 -6.912115e+00
    ## kurtosis      2.186960e+00  1.782336e+01  6.413730e-01  8.218467e+00
    ## kurt.2SE      6.038885e+00  4.921589e+01  1.769822e+00  2.269377e+01
    ## normtest.W    9.749724e-01  8.881644e-01  9.935264e-01  9.268605e-01
    ## normtest.p    8.018226e-10  1.632694e-22  3.205968e-03  2.483404e-18
    ##                  159901.SZ     000016.SS
    ## nbr.val       7.260000e+02  7.270000e+02
    ## nbr.null      7.000000e+00  1.000000e+00
    ## nbr.na        1.000000e+00  0.000000e+00
    ## min          -7.140083e-01 -5.367165e-02
    ## max           4.599049e-02  6.583431e-02
    ## range         7.599987e-01  1.195060e-01
    ## sum          -5.106890e-01  6.467555e-05
    ## median       -3.336164e-04  0.000000e+00
    ## mean         -7.034284e-04  8.896224e-08
    ## SE.mean       1.126584e-03  4.606246e-04
    ## CI.mean.0.95  2.211756e-03  9.043153e-04
    ## var           9.214329e-04  1.542513e-04
    ## std.dev       3.035511e-02  1.241979e-02
    ## coef.var     -4.315309e+01  1.396075e+05
    ## skewness     -1.788122e+01  3.666313e-02
    ## skew.2SE     -9.854951e+01  2.022015e-01
    ## kurtosis      4.172315e+02  2.439411e+00
    ## kurt.2SE      1.151320e+03  6.735981e+00
    ## normtest.W    3.452921e-01  9.753771e-01
    ## normtest.p    7.132403e-45  1.025290e-09

## 数据变化及展示

### 宽变长

``` r
ret1 %>%timetk::tk_tbl(rename_index = 'Date') %>% 
    tidytable::pivot_longer(cols = -Date,names_to = 'stock',values_to = 'return')->ret_long
ggplot2::ggplot(ret_long,mapping = aes(x=Date,y=return,color=stock))+geom_path(stat = "identity") +
    facet_grid(stock ~ .) + theme_minimal() + labs(x = "Date", y = "returns")
```

![](options_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

## GitHub Documents

This is an R Markdown format used for publishing markdown documents to
GitHub. When you click the **Knit** button all R code chunks are run and
a markdown file (.md) suitable for publishing to GitHub is generated.

## Including Code

You can include R code in the document as follows:

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

## Including Plots

You can also embed plots, for example:

![](options_files/figure-gfm/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.