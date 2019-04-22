library("rmarkdown")

rmarkdown::render('worksheet.Rmd', output_format = 'html_document', output_file = "preview.html")
rmarkdown::render('worksheet.Rmd', output_format = 'pdf_document', output_file = "worksheet.pdf")
rmarkdown::render('worksheet.Rmd', output_format = 'beamer_presentation', output_file = "pres.pdf")

