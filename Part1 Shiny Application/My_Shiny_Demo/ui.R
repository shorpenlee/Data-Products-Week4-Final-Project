library(shiny)

shinyUI(
    navbarPage("My Shiny Demo",
               tabPanel("Analysis",
                        fluidPage(
                            titlePanel("Relation between the selected variable and price"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c(
                                                    "cut" = "cut",
                                                    "color" = "color",
                                                    "clarity" = "clarity",
                                                    "carat" = "carat",
                                                    "depth" = "depth",
                                                    "table" = "table",
                                                    "x" = "x",
                                                    "y" = "y",
                                                    "z" = "z"
                                                )),
                                    
                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                                ),
                                
                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("Scattor plot", plotOutput("mpgPlot_1")),
                                                tabPanel("Regression model", 
                                                         plotOutput("mpgPlot"),
                                                         verbatimTextOutput("fit")
                                                )
                                    )
                                )
                            )
                        )
               ),
               tabPanel("Help",
                        h2("Usage about this application"),
                        hr(),
                        h3("Here is the supporting material about how to use this application"),
                        helpText("This application is required by the Coursera Developing Data Products Week 4. This is a Shiny application and is deployed on Rstudio's server. The application has two main parts:"),
                        helpText("1. On the left side, you can choose one variable to look into. The first sheet is to print a box plot, which you can have a rough idea about the relation between the two."),
                        helpText("2. Then, the second sheet is to fit a linear model and print a fitted line based on the linera regression model. In the below, you can also find the detailed parameters and conduct model diagnostics."),
                        h3("Important"),
                        p("A data frame with 53940 observations on 10 variables."),
                        
                        a("https://www.coursera.org/learn/data-products")
               ),
               tabPanel("Data dictionary",
                        h2("Prices of over 50,000 round cut diamonds"),
                        hr(),
                        h3("Description"),
                        helpText("A dataset containing the prices and other attributes of almost 54,000 diamonds.",
                                 "The variables are as follows:"),
                        h3("Format"),
                        p("A data frame with 53940 rows and 10 variables:"),
                        
                        p("  [, 1]   price  price in US dollars ($326–$18,823)"),
                        p("  [, 2]	 carat	 weight of the diamond (0.2–5.01)"),
                        p("  [, 3]	 cut	 quality of the cut (Fair, Good, Very Good, Premium, Ideal)"),
                        p("  [, 4]	 color	 diamond colour, from D (best) to J (worst)"),
                        p("  [, 5]	 clarity	 a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best))"),
                        p("  [, 6]	 x	 length in mm (0–10.74)"),
                        p("  [, 7]	 y	 width in mm (0–58.9)"),
                        p("  [, 8]	 z	 depth in mm (0–31.8)"),
                        p("  [, 9]	 depth	 total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43–79)"),
                        p("  [,10]	 table	 width of top of diamond relative to widest point (43–95)"),
                        
                        h3("Source"),
                        
                        p("[Package ggplot2 version 3.3.0 Index]")
               ),
               tabPanel("Github repository",
                        a("https://github.com/shorpenlee/Data-Products-Week4-Final-Project"),
                        hr(),
                        h4("Author: Shaopeng Li"),
                        h4("Email: lishaopeng2019@gmail.com")
               )
    )
)