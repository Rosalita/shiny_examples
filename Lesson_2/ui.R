shinyUI(fluidPage(

  # fluidPage is used to create a display that automatically adjusts to the dimensions of the user's browser window.
  # The app is laid out by placing elements in the fluidPage function.
  
  # titlePanel and sidebarLayout are two popular elements to add to fluidPage.
  # They create a basic app with a side bar.

  titlePanel("This is my title"),
  
  # Each element inside the fluidPage function must be followed by a , exception being the final element.
  
  sidebarLayout( position = "right",
    
    # SidebarLayout always takes two arguments; sidebarPanel function output and mainPanel function output
    
    # Each element inside the sidebarLayout function must be followed by a , exception being the final element.
    
    sidebarPanel("sidebar panel"),
    mainPanel(
    
    # The sidebarPanel and mainPanel functions place content on the page.
    
    # sidebarPanel appears on the left by default unless the optional arg position = "right" is added.
    
    # navbarPage can be used to give your app a multi-page user-interface that includes a navigation bar.
    # http://shiny.rstudio.com/gallery/navbar-example.html
    # fluidRow and column can be used to build a layout from a grid system.
    
    # HTML content can be added to your shiny app by placing it inside a *Panel function.
    # Shiny using html tags without the <>'s
    
    h1("this is a first level header", align = "center"),
    h2("this is a second level header", align = "center"),
    h3("this is a third level header", align = "center"),
    
    a ("This is a link to my blog", href = "http://testingfuntime.blogspot.co.uk/"),
    
    p("p creates a paragraph of text."),
    p("A new p() command starts a new paragraph. Supply a style attribute to change the format of the entire paragraph.", style = "font-family: 'times'; font-si16pt"),
    
    strong("strong() makes bold text."),
    
    em("em() creates italicized (i.e, emphasized) text."),
    
    br(),
    
    code("code displays your text similar to computer code"),
    
    div("div creates segments of text with a similar style. This division of text is all blue because I passed the argument 'style = color:blue' to div", style = "color:blue"),
    
    br(),
    
    p("span does the same thing as div, but it works with",
      span("groups of words", style = "color:blue"),
      "that appear inside a paragraph."),
    
    #images can be added but image file must be inside a folder called www in the same directory as ui.R
    img(src = "cat.jpg")
    
    
    )
    
  )
    
))