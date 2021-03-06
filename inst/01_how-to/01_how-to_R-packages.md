---
title: "How to build and maintain an R package"
author: "Ashley Bonner"
date: "18 April, 2021"
output: 
  html_document:
    number_sections: yes
    toc: yes
    toc_depth: 4
    toc_float:
      collapsed: no
    highlight: tango
    theme: cerulean
    keep_md: yes
    fig_caption: yes
editor_options: 
  chunk_output_type: inline
---



# Introduction

Building an R package can be tedious and frustrating if you don't have the right tools. This document summarizes the key tools I have learned to use while building and maintaining our own R package `esPIPD`. While learning to develop an R package, I found the following resources extremely helpful. You may prefer to use these:

- <https://r-pkgs.org/>
- <https://github.com/rstudio/cheatsheets/raw/master/package-development.pdf>

# Key R packages

There are a few key R packages you should become familiar with when developing your own R package. They are:

- `devtools`
- `usethis`
- `roxygen`

# Core workflow and Hotkeys

Once you get going, these are the routine steps to updating your functions and documentation, and testing your R package still works:

1. _Edit functions, tests, roxygen documentation, vignettes, etc._
1. `devtools::document()` (or `CTRL + SHIFT + D`) to update documentation files in `man/`
1. `devtools::load_all()` (or `CTRL + SHIFT + L`) to build, test, and attach R package
1. `devtools::check()` (or `CTRL + SHIFT + E`) to check for errors, warnings, and notes
1. `devtools::test()` (or `CTRL + ALT + F7`) to run all 
1. ... repeat!

# Initiating an R package

_Under construction_

You can initiate an R package like this:


```r
usethis::create_package(path = "<path-to-package>/<package-name>")
```

This has created an R project named `<package-name>` at the location `<path-to-package>` and initiated the necessary files to be considered an R package.

You can make your R package a git repository like this:


```r
usethis::use_git()
```

This has added the `.git` directory to your R package and you can now use git for version control. Make sure to set up a remote repository if collaboration is important.

# Structure of an R package

_Under construction_

An R package will tend to have the following files and folders:

- `R/` (mandatory) stores core R functions
- `data/` (mandatory) stores the core data files to come with your R package
- `man/` (mandatory) stores documentation (manuals) for your R functions and data
- `tests/` (mandatory) stores tests you create to check whether your R packages works as intended; compiled during build
- `vignettes/` (optional) stores more vignettes you create to 
- `inst/` (optional) stores any miscellaneous files
- `.Rbuildignore` (mandatory) lists files to ignore when building the R package
- `DESCRIPTION` (mandatory) provides meta-data about the R package
- `NAMESPACE` (mandatory) ...

# Functions

All functions go into the `R/` directory.

You can initiate an R function like this:


```r
usethis::use_r(name = "<name-of-function>")
```

This will create an R script named `<name-of-function>`.

You can initiate a matching test file like this:


```r
usethis::use_test(name = "<name-of-function>")
```

This will create a matching test R script in the `tests/testthat/` directory.

# Building, testing, and checking your R package

You can build and test out your R package like this:


```r
devtools::load_all()
```

This simulates the process of building, installing, and attaching (loading) your R package.

You can check that your R package is in "full working order" by using `R CMD check` in the terminal, or like this:


```r
devtools::check()
```

This flags any errors, warnings, and notes you should resolve, refine, or be aware of.

# Documentation

You can create a `roxygen2` skeleton by selecting _Code > Insert roxygen skeleton_, editing the template, then doing this:


```r
devtools::document()
```

This adds an `.Rd` document to the `man/` directory for each function that has roxygen syntax written above it.

# Data

You can add binary data available to the user like this:


```r
x <- 1:100
usethis::use_data(x)
```

This adds a `.Rda` file to the `data/` folder.

You can add parsed data not available to the user like this:


```r
x <- 101:200
usethis::use_data(x, internal = TRUE)
```

This adds a `sysdata.Rda` file to the `R/` folder.

You can add raw data like this:


```r
x <- 201:300
usethis::use_data_raw(x)
```

Note that if your `DESCRIPTION` file contains the line `LazyData: true` then datasets will be lazily loaded, which means they won't occupy memory until you use them.

# Imported packages

You can add an R package to your list of imports like this:


```r
usethis::use_package("dplyr")
```

This adds the package to the `Imports` field of your `DESCRIPTION` file.

# Vignettes

The `usethis::` package has a function called `use_vignette` that will help you create a vignette for your package:


```r
usethis::use_vignette("<my-vignette>")
```

Supportive content like data and figures that otherwise do not need to be accessed by users can be stored in the `vignettes/` folder.

# Specific imports

You can add the *pipe* (`%>%`) operator from `magrittr` to your package, like this:


```r
usethis::use_pipe()
```

This will create an R script in `R/` called `utils-pipe` with `roxygen2` syntax. Make sure to then run:


```r
devtools::document()
```

This will add the `magrittr` *pipe* to your R package.

# Other

This explains how to get rid of certain notes from `devtools::check()` <https://www.r-bloggers.com/2019/08/no-visible-binding-for-global-variable/>

# Goodbye!

See you later!
