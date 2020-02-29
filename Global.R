source("./R/DashboardComponents.R")

#' Add a Jumbotron to showcase key content
#'
#' @param header a object of class character, indicating header title
#' @param content a object of class character, indicating text content
#' @param button a object of class logical, to include a button or not
#' @param ... optional parameters for including a button label if needed
#'
#' @return a HTML object to be included in the ui section of a shiny app
#' @import shiny
#' @seealso \href{http://getbootstrap.com/components/#jumbotron}{Jumbotron}
#' @examples  jumbotron("Hi Shiny!", "text to show", buttonLabel = "Click Me")
#' @export
showcaseComponent <- function(image = NULL, width="100%",header, content, url=NULL, text=NULL, ...){
  
  button_label = c(...)
  
  html = "div(class = 'jumbotron'"
  if (!is.null(image)){
    html <- div(align="center", class = "jumbotron", img(src = image, width=width, alt = "..."),h1(header), p(content),
                p(HTML(paste0("<a href='",url,"'>",text,"</a>"))))
  } else {
    html <- div(align="center", class = "jumbotron", h1(header), p(content),p(HTML(paste0("<a href='",url,"'>",text,"</a>"))))
  }
  
  return(html)
}

hyperlink <- function(text,url=text){
  html<-HTML(paste0("<a href='",url,"'> '",text,"'<a>"))
  return(html)
}