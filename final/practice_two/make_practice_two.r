library("exams")



q1 = "q1_cards_reverse_conditional.Rmd"
q2 = "q2_unpaired_easy.Rmd"
q3 = "q3_sampling_distro2.Rmd"
q4 = "q4_normal_get_x_lt.Rmd"
q5 = "q5_binom_norm_approx4.Rmd"
q6 = "q6_mean_ci.Rmd"
q7 = "q7_binom_exact.Rmd"

probs = c(q1,q2,q3,q4,q5,q6,q7)


set.seed(12)
exams2pdf(probs, 
  name = "final_practice_two",
  dir = "output",
  resolution = 300,
  template = "worksheet.tex",
  )

