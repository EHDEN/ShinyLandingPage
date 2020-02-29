#' Add a custom thumbnail with a label and button
#'
#' @param image a object of class character (optional)
#' @param label a object of class character
#' @param content a object of class character
#' @param button_link a object of class character
#' @param button_label a object of class characters
#' @param lastUpdate the date of the last update 
#' '
#' @return a HTML object to be included in the ui section of a shiny app
#' @import shiny
#' @seealso \href{http://getbootstrap.com/components/#thumbnails-custom-content}{Thumbnails}
#' @examples  thumbnail_label(image = 'Rlogo.png', label = 'App 1', content = 'here we go again',
#'  button_link = 'http://getbootstrap.com/', button_label = 'Click me')
#' @export
infoPanel <- function(image=NULL, label, content, button_link, button_label,lastUpdate){
  if (is.null(image)){
    div(class = "row",
        div(class = "col-sm-14 col-md-12",
            div(class = "thumbnail",
                    div(class = "caption", h3(label), p(content), p(paste0("Last update: ",lastUpdate)),p(a(href = button_link, class = 'btn btn-primary', role = 'button', button_label))))))
    
  } else {
    div(class = "row",
        div(class = "col-sm-14 col-md-12",
            div(class = "thumbnail",
                img(src = image, alt = "...",
                    div(class = "caption", h3(label), p(content), p(paste0("Last update: ",lastUpdate)),p(a(href = button_link, class = 'btn btn-primary', role = 'button', button_label)))))))
    
  }
}

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
showcaseComponent <- function(image = NULL, header, content,  ...){
  
  button_label = c(...)
  
  html = "div(class = 'jumbotron'"
  if (!is.null(image)){
      html <- div(align="center", class = "jumbotron", img(src = image, alt = "..."),h1(header), p(content))
  } else {
      html <- div(align="center", class = "jumbotron", h1(header), p(content))
  }
    
  return(html)
}

