library("exams")

seed = 123
set.seed(seed)

probs = c("diff_p_sampling_left_prob.Rmd",
          "diff_p_sampling_right_prob.Rmd",
          "diff_p_sampling_central_prob.Rmd",
          "diff_p_sampling_twotail_prob.Rmd",
          "diff_p_ci.Rmd",
          "diff_p_ci.Rmd",
          "diff_p_test.Rmd",
          "diff_p_test.Rmd")
            
exams2pdf(probs, name = paste0("diff_p_worksheet_seed_",seed,"_version_",sep=""),
  encoding = "UTF-8",
  dir = "output",
  edir = "exercises",
  template = "templates/worksheet.tex",
  )
