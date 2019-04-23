library("exams")

set.seed(12345)

p1 = c("probs/phat_sampling_central_probability.Rmd",
       "probs/phat_sampling_left_probability.Rmd",
       "probs/phat_sampling_right_probability.Rmd",
       "probs/phat_sampling_outer_probability.Rmd")
p2 = c("probs/p_CI.Rmd")
p3 = c("probs/p_get_n_conservative.Rmd",
       "probs/p_get_n.Rmd")
p4 = c("probs/p_single_test_left.Rmd",
       "probs/p_single_test_right.Rmd",
       "probs/p_single_test_twotail.Rmd")

p5 = c("diff_of_p/exercises/diff_p_sampling_left_prob.Rmd",
       "diff_of_p/exercises/diff_p_sampling_right_prob.Rmd",
       "diff_of_p/exercises/diff_p_sampling_central_prob.Rmd",
       "diff_of_p/exercises/diff_p_sampling_twotail_prob.Rmd")   
p6 = c("diff_of_p/exercises/diff_p_ci.Rmd")
p7 = c("diff_of_p/exercises/diff_p_test.Rmd")


myexam <- list(p7,p6,p5,p4,p3,p2,p1)

#myexam2 = rep(myexam,3)
                 
exams2pdf(myexam, 
  n = 1,
  name = "ch6review_short",
  dir = "output",
  texdir = "tex",
  resolution = 300,
  template = "templates/worksheet_short.tex"
  )
  
set.seed(12345)

exams2pdf(myexam, 
  n = 1,
  name = "ch6review",
  dir = "output",
  texdir = "tex",
  resolution = 300,
  template = "templates/worksheet.tex"
  )
  
set.seed(12345)

exams2pdf(myexam, 
  n = 1,
  name = "ch6review_answers",
  dir = "output",
  texdir = "tex",
  resolution = 300,
  template = "templates/answers.tex"
  )
