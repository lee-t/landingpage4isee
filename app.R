library("BiocFileCache")
library("shiny")
library("iSEEindex")
##
# BiocFileCache ----
##

bfc <- BiocFileCache(cache = tempdir())

##
# iSEEindex ----
##

dataset_fun <- function() {
    x <- yaml::read_yaml(system.file(package = "iSEEindex", "example.yaml"))
    x$datasets
}

initial_fun <- function() {
    x <- yaml::read_yaml(system.file(package = "iSEEindex", "example.yaml"))
    x$initial
}


addResourcePath("imgs", "www")

header <- fluidRow(shinydashboard::box(width = 12L, 
                                       column(width = 10,
                                              p(strong("Welcome to this demonstration app!")),
                                              p(
                                                  "This is an example header that demonstrate how to use the functionality.",
                                                  "A great place for branding and intros.",
                                              ),
                                              p("On the right, we demonstrate how other content such as images can be added to this header.")
                                       ),
                                       column(width = 2, img(src="imgs/Splenden.png", width = "100px", height = "120px"))
))
footer <- fluidRow(shinydashboard::box(width = 12L,
                                       p("This is a example footer. A great place for copyright statements and outros.", style="text-align: center;"),
                                       p(
                                           "© 2023 iSEE.",
                                           a("Artistic-2.0", href = "https://opensource.org/license/artistic-2-0/"),
                                           style="text-align: center;")
))

app <- iSEEindex(bfc, dataset_fun, initial_fun,
                 body.header = header, body.footer = footer
)


runApp(app, port = 1234)
