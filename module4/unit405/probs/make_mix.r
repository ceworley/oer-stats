library("exams")


set.seed(12345)
## exam with a simple vector of exercises in R/Markdown (.Rmd) format
## -> alternatively try a list of vectors of more exercises

p1 = c("phat_sampling_central_probability.Rmd",
       "phat_sampling_left_probability.Rmd",
       "phat_sampling_right_probability.Rmd",
       "phat_sampling_outer_probability.Rmd")
p2 = c("p_CI.Rmd")
p3 = c("p_get_n_conservative.Rmd","p_get_n.Rmd")
p4 = c("p_single_test_left.Rmd",
       "p_single_test_right.Rmd",
       "p_single_test_twotail.Rmd")

myexam <- list(p1,p1,p2,p2,p3,p3,p4,p4,p1,p2,p3,p4,p1,p2,p3,p4,p1,p2,p3,p4)

#myexam2 = rep(myexam,3)
                 
exams2pdf(myexam, n = 1, name = c("ch6review"),
  dir = "output",
  template = c("templates/ch6_review.tex")
  )
