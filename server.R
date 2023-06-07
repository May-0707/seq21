server <- function(input,output){
  output$countabimg <- renderImage({
    list(src = "./sh_countTable.jpg",
         width = "400px",height="400px")
  },deleteFile = FALSE)
  ###### run  ######
  observeEvent(input$runcount,{
    myfunction <- function(x){
      seq <- ""
      score <- 0
      outscore <- ""
      outscore2 <- ""
      outscore3 <- ""
      # 定义序列，自己输入序列
      seq <- x
      library(stringr)
      # 判断序列长度是否为21
      if (nchar(seq) != 21) {
        print("序列长度不为21")
      } else {
        # 判断序列以G开头
        if (substr(seq, 1, 1) == "G" && (substr(seq, 18, 18) == "A" ||
                                         substr(seq, 18, 18) == "T" || substr(seq, 19, 19) == "A" ||
                                         substr(seq, 19, 19) == "T")) {
          score <- 0
          if (substr(seq, 3, 3) == "A") {
            score <- score + 1
          }
          if (substr(seq, 6, 6) == "A") {
            score <- score + 2
          }
          if (substr(seq, 10, 10) == "U" || substr(seq, 10, 10) == "T") {
            score <- score + 1
          }
          if (substr(seq, 13, 13) == "G") {
            score <- score - 1
          }
          if (substr(seq, 18, 18) != "A" && substr(seq, 19, 19) == "A") {
            score <- score + 1
          }
          if (substr(seq, 18, 19) == "AA") {
            score <- score + 2
          }
          if (substr(seq, 19, 19) == "G" || substr(seq, 19, 19) == "C") {
            score <- score - 2
          }
          if (grepl("AAA|TTT", substr(seq,1,19))) {
            countAT = str_count(seq,"TTT|AAA")
            score <- score - 3*countAT
          }
          outscore = paste(outscore,"以第一个G开头，序列得分为：", score)
          #return(outscore)
          #print(paste("以第一个G开头，序列得分为：", score))
        }
        if (substr(seq, 2, 2) == "G" && (substr(seq, 19, 19) == "A"|| substr(seq, 19, 19) == "T" || substr(seq, 20, 20) == "A" || substr(seq, 20, 20) == "T")){
          score <- 0
          # 判断前面第一位是否是A
          if (substr(seq, 1, 1) == "A"){
            score <- score + 1
          }
          if (substr(seq, 4, 4) == "A"){
            score <- score + 1
          }
          if (substr(seq, 7, 7) == "A") {
            score <- score + 2
          }
          if (substr(seq, 11, 11) == "U" || substr(seq, 11, 11) == "T") {
            score <- score + 1
          }
          if (substr(seq, 14, 14) == "G") {
            score <- score - 1
          }
          if (substr(seq, 19, 19) != "A" && substr(seq, 20, 20) == "A") {
            score <- score + 1
          }
          if (substr(seq, 19, 20) == "AA") {
            score <- score + 2
          }
          if (substr(seq, 20, 20) == "G" || substr(seq, 20, 20) == "C") {
            score <- score - 2
          }
          if (grepl("AAA|TTT", substr(seq,2,20))) {
            countAT = str_count(substr(seq,2,20),"TTT|AAA")
            score <- score - 3*countAT
          }
          outscore2 = paste("以第二个G开头，序列得分为：",score)
          #return(outscore2)
          #print(paste("以第2个G开头，序列得分为：", score))
        }
        if (substr(seq, 3, 3) == "G" && (substr(seq, 20, 20) == "A"|| substr(seq, 20, 20) == "T" || substr(seq, 21, 21) == "A" || substr(seq, 21, 21) == "T")){
          score <- 0 
          # 判断前面第一位是否是A
          if (substr(seq, 1, 1) != "A" && substr(seq, 2, 2) == "A"){
            score <- score + 1
          }
          # 判断前面第2位是否都是A
          if (substr(seq, 1, 2) == "AA"){
            score <- score + 2
          }
          if (substr(seq, 5, 5) == "A"){
            score <- score + 1
          }
          if (substr(seq, 8, 8) == "A") {
            score <- score + 2
          }
          if (substr(seq, 12, 12) == "U" || substr(seq, 12, 12) == "T") {
            score <- score + 1
          }
          if (substr(seq, 15, 15) == "G") {
            score <- score - 1
          }
          if (substr(seq, 20, 20) != "A" && substr(seq, 21, 21) == "A") {
            score <- score + 1
          }
          if (substr(seq, 20, 21) == "AA") {
            score <- score + 2
          }
          if (substr(seq, 21, 21) == "G" || substr(seq, 21, 21) == "C") {
            score <- score - 2
          }
          if (grepl("AAA|TTT", substr(seq,3,21))) {
            countAT = str_count(substr(seq,3,21),"TTT|AAA")
            score <- score - 3*countAT
          }
          outscore3 = paste("以第三个G开头，序列得分为：",score)
         # return(outscore3)
          #print(paste("以第3个G开头，序列得分为：", score))
        }
        outall = paste(outscore, outscore2, outscore3, sep = ";\n",collapse = "\n")
        return(outall)
      }
      
    }
    
    ##
    ### Process progress prompt
   # withProgress(message = 'Calculation in progress',
  #               detail = 'This may take a while...', value = 0, 
                 #expr = {
                 #  myfunction(input$seqlen21)
                 #}
 # )
    
    ### get sequence
    seq = input$seqlen21
    
    output$scoreValue <- renderText({
      #datatable({ },options = list(dom = "lftipr",ordering = F),rownames = T)
      myfunction(input$seqlen21)
      
    })
  })
}