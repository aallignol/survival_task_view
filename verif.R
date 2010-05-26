require(ctv)

aa <- read.ctv("/home/arthur/surv_task_view/Survival.ctv")
ctv2html(aa, file = "/home/arthur/surv_task_view/Survival.html")

bb <- as.vector(available.packages()[,1])

## test
all(aa$packagelist$name %in% bb)
## should be TRUE

## setwd("/home/arthur/surv_task_view/")
## system("mkdir test_download")
## bb <- download.packages(aa$packagelist$name, "/home/arthur/surv_task_view/test_download/")

## length(aa$packagelist$name) == length(bb[, 1])
## ## Should be TRUE :-)

## system("rm -r test_download")
