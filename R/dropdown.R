#' Cria um Elemento Dropdown Personalizado com Conteúdo Associado
#'
#' Esta função gera um elemento HTML dropdown que permite ao usuário selecionar entre várias opções,
#' cada uma associada a um elemento de conteúdo específico (por exemplo, gráficos SVG). O conteúdo é atualizado dinamicamente
#' com base na seleção do usuário. A função suporta conteúdo HTML e SVG, permitindo a personalização
#' da aparência do dropdown e das dimensões do conteúdo.
#'
#' @param elementos Uma lista de elementos de conteúdo a serem exibidos (por exemplo, SVGs ou tags HTML). Cada elemento corresponde a uma opção no dropdown.
#' @param id Um identificador único para o dropdown e os contêineres de conteúdo associados.
#' @param params Um vetor de valores de parâmetro correspondente a cada elemento em \code{elementos}. Usado como atributo value para cada opção do dropdown.
#' @param label Uma string de texto especificando o rótulo exibido acima do dropdown. O padrão é string vazia.
#' @param html Lógico; se \code{TRUE}, assume que \code{elementos} já são HTML. Se \code{FALSE}, aplica \code{transformar_svg()} a cada elemento. O padrão é \code{FALSE}.
#' @param fig_width Numérico; largura (em polegadas) para conteúdo SVG se \code{html = FALSE}. O padrão é 8.
#' @param fig_height Numérico; altura (em polegadas) para conteúdo SVG se \code{html = FALSE}. O padrão é 4.
#' @param dropdown_width Caracter; largura CSS para o elemento dropdown (por exemplo, "300px"). O padrão é "300px".
#'
#' @return Uma lista de tags HTML contendo o dropdown, um loader e os elementos de conteúdo associados, pronta para renderização em um app Shiny ou documento HTML.
#'
#' @details
#' A função verifica se os comprimentos de \code{elementos} e \code{params} coincidem. Se \code{html = FALSE},
#' aplica a função \code{transformar_svg()} a cada elemento para convertê-lo em HTML/SVG com as dimensões especificadas.
#' O dropdown é construído usando tags do pacote \code{htmltools}, e cada opção é vinculada a um elemento de conteúdo que 
#' é mostrado ou ocultado conforme a seleção do usuário.
#'
#' @export
create_dropdown <- function(elementos, id, params, label = "", html = FALSE,
                            fig_width = 8, fig_height = 4,
                            dropdown_width = "300px") {
  if (length(elementos) != length(params)) {
    stop("The number of elements must match the number of parameters")
  }

  if (!html) {
    elementos <- purrr::map(
      elementos,
      \(x) {
        transformar_svg(
          x,
          html = TRUE,
          width = fig_width,
          height = fig_height
        )
      }
    )
  }

  # Create a unique ID for the dropdown and plot container
  dropdown_id <- paste0("dropdown_", id)

  # Create the dropdown HTML
  select_html <- htmltools::tags$select(
    id = dropdown_id,
    class = "form-select",
    onchange = sprintf("updateElement('%s')", id),
    style = glue::glue("width: {dropdown_width};")
  )
  
  labels <- names(params)
  if (is.null(labels)) {
    labels <- params
  }

  for (i in seq_along(params)) {
    select_html <- htmltools::tagAppendChild(
      select_html,
      htmltools::tags$option(value = params[i], labels[i])
    )
  }

  dropdown_html <- htmltools::div(
    class = "dropdown-label form-group mb-3",
    htmltools::tags$label(label, `for` = dropdown_id),
    select_html
  )

  # Create the HTML for each plot
  element_html <- lapply(seq_along(elementos), function(i) {
    element_id <- glue::glue("element_{id}_{params[i]}")
    display <- ifelse(i == 1, "block", "none")
    element_div <- htmltools::tags$div(
      id = element_id,
      class = glue::glue("element_container_{id}"),
      style = glue::glue("display: {display}; width: 100%; margin: auto"),
      elementos[[i]]
    )
    element_div
  })

  loader <- htmltools::tags$div(class = "loader")

  # Combine everything into a single HTML document
  htmltools::tagList(
    dropdown_html,
    loader,
    element_html
  )
}


transformar_svg <- function(p, width = 8, height = 4, html = FALSE) {
  svg <- svglite::xmlSVG(
    show(p),
    standalone = TRUE,
    width = width,
    height = height
  )

  if (html) {
    svg <- svg |>
      as.character() |>
      htmltools::HTML()
  }

  return(svg)
}
