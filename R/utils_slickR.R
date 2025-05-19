#' Gerar carrossel com gráficos
#'
#' Esta função cria um carrossel de gráficos utilizando a biblioteca `slickR`.
#'
#' @param ... Gráficos a serem incluídos no carrossel.
#' @param labels Vetor de caracteres com os rótulos a serem exibidos nos pontos do carrossel. O padrão é c("Área empilhada", "Linha").
#'
#' @return Um objeto `slickR` que representa o carrossel de gráficos.
#'
#' @examples
#' \dontrun{
#' p1 <- ggplot2::qplot(mpg, wt, data = mtcars)
#' p2 <- ggplot2::qplot(hp, wt, data = mtcars)
#' gerar_carrossel(p1, p2)
#' }
#'
#' @export
criar_carrossel <- function(..., lang = "pt", labels = NULL) {
  lista <- purrr::map(list(...), transformar_svg)

  if (lang == "pt") {
    labels <- c("Área empilhada", "Linha")
  } else if (lang == "en") {
    labels <- c("Stacked area", "Line")
  }

  dot_labels <- htmlwidgets::JS(
    glue::glue(
      "function(slick, index) {
        if (index == 0) {
          return '{{labels[1]}}';
        } else if (index == 1) {
          return '{{labels[2]}}';
        }
       }",
      .open = "{{",
      .close = "}}"
    )
  )

  slickR::slickR(lista, width = "90%", height = 550) +
    slickR::settings(dots = TRUE, customPaging = dot_labels)
}
