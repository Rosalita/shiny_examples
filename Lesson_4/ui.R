# reactive outputs are created with a two step process:
# 1. Add an R objec to the user-interface with ui.R
# 2. Tell Shiny how to build th eobject in server.R. 
# The object will be reactive if the code that builds it calls a widget value.


# Step 1 add an R object to the ui

# each of the following functions create a specific type of output

#Output function	      creates
#htmlOutput	            raw HTML
#imageOutput	          image
#plotOutput	            plot
#tableOutput	          table
#textOutput	            text
#uiOutput	              raw HTML
#verbatimTextOutput	    text


shinyUI(fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
               information from the 2010 US Census."),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Percent White", "Percent Black",
                              "Percent Hispanic", "Percent Asian"),
                  selected = "Percent White"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100))
      ),
    
    mainPanel(
      
      # (1) This is an R object that creates text output
      textOutput("text1"),
      # this code tells Shiny where to display my R object
      # textOutput takes an argument, the string "text1".
      # each of the *Output functions require a single argument
      # which is a character string that Shiny uses as the name of your reactive element

      textOutput("range")
      
    )
  )
))