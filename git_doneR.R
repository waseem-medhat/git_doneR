#! /usr/bin/Rscript
library("gert")

args = commandArgs(trailingOnly = TRUE)

if (length(args) == 0) {
  cat("No message given... exiting\n")
  q("no")
}

git_add(".")
git_commit(args[1])
git_pull()
git_push()
