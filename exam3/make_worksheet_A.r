library("exams")

set.seed(12345)


p1 = "exercises/s01_single_mean/mean_sampling_right.Rmd"
p2 = "exercises/s01_single_mean/mean_ci.Rmd"
p3 = "exercises/s01_single_mean/mean_pvalue.Rmd"
p4 = "exercises/s01_single_mean/mean_test_twotail.Rmd"
p5 = "exercises/s03_difference_of_means/unpaired_confidence_interval_approx_df.Rmd"
p6 = "exercises/s04_single_proportion/p_get_n.Rmd"
p7 = "exercises/s04_single_proportion/p_get_n_conservative.Rmd"
p8 = "exercises/s05_difference_of_proportions/diff_p_ci.Rmd"
p9 = "exercises/s05_difference_of_proportions/diff_p_test.Rmd"

myexam <- list(p1,p2,p3,p4,p5,p6,p7,p8,p9)


set.seed(12345)

exams2pdf(myexam, 
  n = 1,
  name = "ch5-6review",
  dir = "output",
  resolution = 300,
  template = "templates/worksheet.tex"
  )
  

