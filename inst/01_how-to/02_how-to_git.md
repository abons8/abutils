---
title: "How to use Git"
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

Using `Git` can be a challenge at first. This document summarizes the key tips and tricks at the command line that make it easier, from the perspective of using `Git` in combination of `R` programming in `RStudio`. While learning to use `Git`, I found the following resources extremely helpful. You may prefer to use these:

- <https://happygitwithr.com/>
- A three-part tutorial series from David Mahler on YouTube:
  - <https://www.youtube.com/watch?v=uR6G2v_WsRA&t=416s>
  - <https://www.youtube.com/watch?v=FyAAIHHClqI&t=1136s>
  - <https://www.youtube.com/watch?v=Gg4bLk8cGNo&t=343s>

# Core workflow and Hotkeys

Once you get going, these are the routine steps for using `Git` effectively:

1. `git status` - to check your _working tree_
1. _Make changes to your files as needed_
1. `git add .` - to _add_ (or _stage_) any changes to the _staging area_
1. `git commit -m "<message>"` - to commit your staged changes to the _history_
1. `git push` (if using a _remote_) - to push your _history_ of _commits_ to the _remote_ 
1. ... repeat!

# Initiating `Git`

_Under construction_

# Using `git diff`

Here's how you check the difference between your working tree and staging area:


```bash
git diff --staged
```

Here's how you check the difference between your staging area and commit history:


```bash
git diff --staged
```

# Creating a new branch


```bash
git checkout -b <branch-name>
git push --set-upstream <remote-name> <branch-name>
```

# Merging a branch

First you ensure your feature branch has a commit history you want to pull, then you pull into the desired branch.

If working without a remote branch, starting on branch `<branch-you-want-to-pull-from>`:


```bash
git status # ensure your branch is at a state you'd like to pull from
git checkout <branch-you-want-to-pull-into>
git pull <branch-you-want-to-pull-from>
```

If working with a remote branch, starting on branch `<branch-you-want-to-pull-from>`:


```bash
git status # ensure your branch is at a state you'd like to pull from
git push # ensure remote branch is also up-to-date
git checkout <branch-you-want-to-pull-into>
git pull origin <branch-you-want-to-pull-from>
```

# Goodbye!

See you later!
