## exams ----------------------------------------------------------------------------

## load package
library("exams")

## exam with a simple vector of exercises in R/Markdown (.Rmd) format
## -> alternatively try a list of vectors of more exercises
myexam <- list("unpaired_confidence_interval_approx_df.Rmd")
## note that the currency exercise is in UTF-8 encoding


## exams2pdf ------------------------------------------------------------------------
## PDF output (1 file per exam)
## -> typically used for quickly checking if an exercise can be converted to PDF
## -> or customized via suitable templates

## generate the PDF version of a single exercise (shown in PDF viewer)
## with default settings
#exams2pdf("exercises/tstat.Rmd")

## generate a single PDF exam (shown in PDF viewer)
## with specification of a template (for an exam) %s encoding
#exams2pdf(myexam, n = 1,
#  encoding = "UTF-8",
#  edir = "exercises",
#  template = "templates/solution.tex")

## generate three PDF exams and corresponding solutions in output directory
## (with the header used to set a custom Date and ID for the exam)

set.seed(1234)
exams2pdf(myexam, n = 30, name = c("unpaired_wksht", "unpaired_sol"),
  encoding = "UTF-8",
  dir = "unpaired_wkshts",
  template = c("../../templates/small.tex", "../../templates/small_sol.tex"),
  header = list(
    ID = function(i) formatC(i, width = 3, flag = "0")
  ))


## ----------------------------------------------------------------------------------
