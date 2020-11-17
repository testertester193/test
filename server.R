#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#system("pip install markovify")


library(shiny)
#library(markovifyR)
#library(tidyverse)
library(jsonlite)
library(httr)

#set source file for NLP and next word prediction
source("WordPred_file.R")

#source("markovify.R")
#quote <- readLines("quotes.txt")
#markov_model <-
 #   generate_markovify_model(
  #      input_text = quote,
   #     markov_state_size = 2L,
    #    max_overlap_total = 25,
     #   max_overlap_ratio = .85
    #)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

    output$selected_var <- renderPrint({
     #   t <- markovify_text(
      #      markov_model = markov_model,
       #     maximum_sentence_length = NULL,
         #   output_column_name = 'val',
        #    start_words = unlist(str_split(input$text," ")),
          #  count = 25,
           # tries = 100,
            #only_distinct = TRUE,
            #return_message = FALSE
        #)
        
        #test <- unlist(t$val)
        #test
        #t$val
        unlist(wordpred(input$text))
    })
    
    output$selected_var1 <- renderText({
      x <- input$text
      body = jsonlite::toJSON(list(input_sentences = quote, 
                   sentences_to_generate = 2))
        content = httr::content(
               httr::POST(
                     url = "https://nlg-markovify-api.herokuapp.com/generate", 
                     body = body
                 )
           )
        unlist(content)

    })

})
