# reactive outputs are created with a two step process:
# 1. Add an R objec to the user-interface with ui.R
# 2. Tell Shiny how to build th eobject in server.R. 
# The object will be reactive if the code that builds it calls a widget value.

# Step 2 after telling shiny where to display the R object in the ui
# server.R need to tell shiny how to build the object.

# This is an unnamed function, it has a special role
# It builds a list-like object named output 
# the output object contains all of the code needed to update the R objects in your app
# each R object needs to have its own entry in the list.

shinyServer(function(input,output){

# An entry can be created in the output list by defining a new element for output
# The element name should match the name of the reactive element created in ui.R
  
#output$text1 matches textOutput("text1") in ui.R  
  output$text1 <- renderText({ 
    "You have selected this"
  })
  
  # You do not need to arrange for unname function to return output in its last line of code.
  # R automatically updates output through reference class semantics
  
  # Each entry to output should contain the output of one of shiny's render* functions
  # These functions capture an R expression and do some light pre-processing on the expression
  # Use the render* function that corresponds to the type of reactive object you are making
  
  #render function          creates
  #renderImage              images (saved as link to a source file)
  #renderPlot               plots
  #renderPrint              any printed output
  #renderTable              dataframe, matrix, other table like structures
  #renderUI                 a Shiny tag object or HTML
  
  
  # each render* function takes a single argumentL an R expression surrounded by braces {}
  # The expression can be one line of simple text or involve many lines of code.
  
  # Think of this R expression as a set of instructions that you give shiny to store for later
  # Shiny will run the instructions when you first launch your app
  # and then Shiny will re-run them every time it needs to update your object.
  # For this to work, your expression should return the object you have in mind (a piece of test, a plot etc.)
  # There will be an error if the expression does not return an object or it if returns the wrong kind of object
  
  # the unnamed function mentions two arguments input and output.
  # input is a second list-like object. It stores the current values of all the widgets in your app.
  # These values will be saved under the name that you gave the widgets in ui.R
  # and referenced by input$widgetname
  
  #shiny will automatically make an object reactive if the object uses an input value.
  
  output$text1 <- renderText({ 
    paste("You have selected this", input$var)
  })
  
  #Shiny tracks which output depend on which widgets. 
  #When a user changes a widget, shiny will rebuild all of the outputs that depend on the widget
  
  # reactive apps are build by connecting the values of input to the objects in output
  
  output$range <- renderText({
    paste("you have chosen a range that goes from ", input$range[1], "to", input$range[2] )
  })
  
})