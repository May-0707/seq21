library(shiny)
ui<-fluidPage(
  
  # App title ----
  titlePanel(div(style="text-align: center;","Count Sequence Scores")),
  navbarPage(title = "Seq type",
             tabPanel("Seq21", 
                      
                      div(imageOutput("countabimg")),
                      div(tags$strong("Calculation rules:"),tags$br(),
                          "In A sequence of 21bp length, the position of the", tags$strong("G"),
                          "letter is counted as the first, 
                          and the 18th and 19th digits of the following number have at least one A or T, then the score is calculated as follows:",
tags$br(),
"If the two digits in front of G are both A, then add 2 to the count;",
tags$br(),
"If the bit before the position of G is A, then add 1 to the calculation;",
tags$br(),
"The third place after the position of G is A, then the count is increased by 1;",
tags$br(),
"The sixth position after G is A, then add 2 to the count;",
tags$br(),
"If the 10th position after G is U or T, then the count is increased by 1;",
tags$br(),
"The 13th place after the position of G is G, then the count is reduced by 1;",
tags$br(),
"The 19th position after G is A, then the count is increased by 1;",
tags$br(),
"If the 18th and 19th digits after the position of G are both A, then the count is increased by 2;",
tags$br(),
"If the 19th place after the position of G is G or C, the count is reduced by 2;",
tags$br(),
"If AAA or TTT appears in a sequence of length 19 after G, subtract 3, and if it appears twice, subtract 6, increasing with the number of occurrences."

                      ),
tags$br(),
                      div(textInput("seqlen21", "Input your sequence (length=21)", width  =  "15%",),
                          actionButton("runcount", "Count Score", width  =  "15%"),
                      ),
                      tags$br(),
                      tags$br(),
                      div(textOutput("scoreValue",container=h1), style="text-align:center;margin-left:10px;"),#;overflow:scroll

tags$br(),
             )
  )
)






    