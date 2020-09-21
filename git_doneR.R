#! /usr/bin/Rscript
library("gert")

args = commandArgs(trailingOnly = TRUE)

if (length(args) == 0) {
  print("No message given... exiting")
}

git_add(".")
git_commit(args[1])
git_pull()
git_push()
