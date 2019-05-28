library("exams")

q1 = "q1_cards.Rmd"
q2 = "q2_cards_reverse_conditional.Rmd"
q3 = "q3_sampling_toothpicks.Rmd"
q4 = "q4_binom_both.Rmd"
q5 = "q5_mean_ci.Rmd"
q6 = "q6_unpaired_easy.Rmd"
q7 = "q7_p_ci.Rmd"
q8 = "q8_diff_p_test.Rmd"

probs = c(q1,q2,q3,q4,q5,q6,q7,q8)

#set.seed(12)
#exams2html(probs,
#    n=30,
#    name="final",
#    dir="html",
#    solution = FALSE
#    )


set.seed(12)
exams2pdf(probs,
  n=30,
  name = c("final","ans_final"),
  dir = "output",
  resolution = 300,
  texdir = "tex",
  template = c("exam.tex","examans.tex"),
  header = list(
    Date = "2019-05-02",
    ID = function(i) formatC(i, width = 3, flag = "0")
  )
  )


