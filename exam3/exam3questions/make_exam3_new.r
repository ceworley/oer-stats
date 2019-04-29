library("exams")



q1 = "q1_mean_ci.Rmd"
q2 = "q2_mean_of_differences.Rmd"
q3 = "q3_diff_means_raw_equal_ns.Rmd"
q4 = "q4_p_ci.Rmd"
q5 = "q5_p_get_n_conservative.Rmd"
q6 = "q6_diff_p_test.Rmd"

probs = c(q1,q2,q3,q4,q5,q6)



set.seed(123)
exams2pdf(probs, 
  n = 1,
  name = c("Exam_3_new","inclass_projector"),
  dir = "output",
  resolution = 300,
  template = c("templates/inclass.tex","templates/inclass_projector.tex"),
  header = list(
    Date = "2019-04-25",
    ID = function(i) formatC(110+i, width = 3, flag = "0")
  )
  )

