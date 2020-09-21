#! /usr/bin/Rscript

library("gert")

args = commandArgs(trailingOnly = TRUE)

if (length(args) == 0) {
  cat("No message given... exiting\n")
  q("no")
}

if (nrow(git_status()) == 0) {
  cat("Nothing to commit... exiting\n")
  q("no")
} else {
  git_add(".")
  git_commit(args[1])
}

tryCatch(
  {
    git_pull()
    cat("Successfully pulled!\n")
    git_push()
    cat("Successfully pushed!\n")
  },
  error = function() {
    cat("Problem with pushing... exiting")
  }
)
