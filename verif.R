require(ctv)

myTaskView <- read.ctv("Survival.ctv")
ctv2html(myTaskView, file = "Survival.html")

cran_packages <- as.vector(available.packages()[,1])

## compare package list in task view to available packages on CRAN
all(myTaskView$packagelist$name %in% cran_packages)


### same test but in the whole document
doc <- xmlTreeParse("Survival.ctv",
                    useInternalNode = TRUE)

x <- getNodeSet(doc, "//*/pkg")
all_packages <- unique(sapply(x, xmlValue))

all(all_packages %in% cran_packages)

## setwd("/home/arthur/surv_task_view/")
## system("mkdir test_download")
## bb <- download.packages(aa$packagelist$name, "/home/arthur/surv_task_view/test_download/")

## length(aa$packagelist$name) == length(bb[, 1])
## ## Should be TRUE :-)

## system("rm -r test_download")

## x <- readLines("Survival.ctv")
## aa <- grep("/<pkg[^>]*>(.*)<\\/pkg>", x, perl = TRUE)

## doc <- readLines("/misc/devR/surv_task_view/Survival.ctv")

doc <- xmlTreeParse("/misc/devR/surv_task_view/Survival.ctv",
                    useInternalNode = TRUE)

x <- getNodeSet(doc, "//*/pkg")
all_packages <- unique(sapply(x, xmlValue))

aa <- x[[1]]


newlineSub <- function(x) {
    for (i in c(":", ",", ";", ")", ".", "?", "!")) x <- gsub(paste("\n[ ]*\\", 
                                                                    i, sep = ""), i, x)
    x <- gsub("(\n<a", "(<a", x, fixed = TRUE)
    return(x)
}

name <- function(x) xmlValue(x$name)
topic <- function(x) xmlValue(x$topic)
maintainer <- function(x) xmlValue(x$maintainer)
email <- function(x) as.vector(xmlAttrs(x$maintainer)["email"])
ctvversion <- function(x) xmlValue(x$version)
info <- function(x) newlineSub(xmlPaste(x$info, indent = "    "))
