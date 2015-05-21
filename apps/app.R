require(shiny)

MMI<- function (feel) {
        returnMessage <- "Nothing entered yet"
        if (identical(feel,"Barely sensed only by a very few people.")){
                returnMessage<-"I - Imperceptible"
        }
        else if (identical(feel,"Felt only by a few people at rest in houses or on upper floors.")){
                returnMessage<-"II - Scarcely felt"
        }
        else if (identical(feel, "Felt indoors as a light vibration. Hanging objects may swing slightly.")){
                returnMessage<-"III - Weak"
        }
        else if (identical(feel, "Generally noticed indoors, but not outside, as a moderate vibration or jolt. Light sleepers may be awakened. Walls may creak, and glassware, crockery, doors or windows rattle.")){
                returnMessage<-"IV - Largely observed"
        }
        else if(identical(feel,"Generally felt outside and by almost everyone indoors. Most sleepers are awakened and a few people alarmed. Small objects are shifted or overturned, and pictures knock against the wall. Some glassware and crockery may break, and loosely secured doors may swing open and shut.")){
                returnMessage<-"V - Strong"
        }
        else if(identical(feel,"Felt by all. People and animals are alarmed, and many run outside. Walking steadily is difficult. Furniture and appliances may move on smooth surfaces, and objects fall from walls and shelves. Glassware and crockery break. Slight non-structural damage to buildings may occur.")){
                returnMessage<-"VI - Slightly damaging"
        }
        else if(identical(feel,"People experience difficulty standing. Furniture and appliances are shifted. Substantial damage to fragile or unsecured objects. A few weak buildings are damaged.")){
                returnMessage<-"VII - Damaging [GENERAL ALARM]"
        }
        else if(identical(feel,"A few buildings are damaged and some weak buildings are destroyed.")){
                returnMessage<-"VIII - Heavily damaging [ALARM]"
        }
        else if(identical(feel, "Some buildings are damaged and many weak buildings are destroyed.")){
                returnMessage<-"IX - Destructive"
        }
        else if(identical(feel, "Many buildings are damaged and most weak buildings are destroyed.")){
                returnMessage<-"X - Very destructive"
        }
        else if(identical(feel, "Most buildings are damaged and many buildings are destroyed.")){
                returnMessage<-"XI - Devastating"
        }
        else if (identical(feel, "All buildings are damaged and most buildings are destroyed.")){
                returnMessage<-"XII - Completely devastating"
        }
        returnMessage
}


output$inputValue<-renderPrint({input$feel})
output$prediction<-renderPrint({MMI(input$feel)})
output$image<-renderImage({ 
        filename <- normalizePath(file.path('./assets/img',paste(MMI(input$feel),'.png', sep='')))
        list(src = filename, alt = paste("Image for ", MMI(input$feel)))
},deleteFile = FALSE)
