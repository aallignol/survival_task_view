aa <- read.ctv("/home/arthur/surv_task_view/Survival.ctv")
ctv2html(aa, file = "/home/arthur/surv_task_view/Survival.html")

system("mkdir surv_task_view/test_download")
bb <- download.packages(aa$packagelist$name, "/home/arthur/surv_task_view/test_download/")

length(aa$packagelist$name) == length(bb[, 1])
## Should be TRUE :-)

system("rm -r surv_task_view/test_download")
