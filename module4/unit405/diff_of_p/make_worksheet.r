library("exams")

probs = c("diff_p_sampling_left_prob.Rmd",
          "diff_p_sampling_right_prob.Rmd",
          "diff_p_sampling_central_prob.Rmd",
          "diff_p_sampling_twotail_prob.Rmd",
          "diff_p_ci.Rmd",
          "diff_p_ci.Rmd",
          "diff_p_test.Rmd",
          "diff_p_test.Rmd")
            
exams2pdf(probs, n = 1, name = "diff_p_worksheet",
  encoding = "UTF-8",
  dir = "output",
  template = "worksheet.tex",
  header = list(
    Date = "2015-01-01",
    ID = function(i) formatC(i, width = 5, flag = "0")
  ))
