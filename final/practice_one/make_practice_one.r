library("exams")



q1 = "p1_cards.Rmd"
q2 = "p2_cards_reverse_conditional.Rmd"
q3 = "p3_binom_exact.Rmd"
q4 = "p4_binom_norm_approx3.Rmd"
q5 = "p5_sampling_distro.Rmd"
q7 = "p7_diff_p_test.Rmd"

probs = c(q1,q2,q3,q4,q5,q7)


set.seed(12)
exams2pdf(probs, 
  n = 1,
  name = "final_practice_one",
  dir = "output",
  resolution = 300,
  template = "worksheet.tex",
  )

