require(ctv)
require(XML)

myTaskView <- read.ctv("Survival.ctv")
ctv2html(myTaskView, file = "Survival.html")

##
check_ctv_packages("Survival.ctv")

cran_packages <- as.vector(available.packages()[,1])

## compare package list in task view to available packages on CRAN
all(myTaskView$packagelist$name %in% cran_packages)


### same test but in the whole document, including <info>
doc <- xmlTreeParse("Survival.ctv",
                    useInternalNode = TRUE)

x <- getNodeSet(doc, "//*/pkg")
all_packages <- unique(sapply(x, xmlValue))

all(all_packages %in% cran_packages)

