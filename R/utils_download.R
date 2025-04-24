#' Gerar botões de download
#'
#' @param tab_name Nome da tabela
#' @param .tipo_dado Tipo de dado
#'
#' @export
gerar_botoes_download <- function(tab_name, .tipo_dado) {
  tab_name <- stringr::str_remove(tab_name, "^tab_")
  htmltools::div(
    class = "download mt-4 mb-4 text-end",
    htmltools::tags$a(
      href = glue::glue("dados/matriz_{tab_name}_{.tipo_dado}.xlsx"),
      htmltools::tags$button(
        class = "btn btn-default",
        bsicons::bs_icon("download"),
        "Matriz"
      )
    ),
    htmltools::tags$a(
      class = "ms-3",
      href = glue::glue("dados/tabela_{tab_name}_{.tipo_dado}.xlsx"),
      htmltools::tags$button(
        class = "btn btn-default",
        bsicons::bs_icon("download"),
        "Tabela"
      )
    )
  )
}

gerar_matriz_download <- function(tabela, tab_name, .tipo_dado) {
  if (!dir.exists("dados")) {
    dir.create("dados")
  }

  tab_name <- stringr::str_remove(tab_name, "^tab_")
  if (!is.null(.tipo_dado)) {
    tab_name <- glue::glue("{tab_name}_{.tipo_dado}")
  }

  writexl::write_xlsx(
    tabela,
    path = glue::glue("dados/matriz_{tab_name}.xlsx"),
    col_names = TRUE,
    format_headers = TRUE
  )
}

gerar_tabela_download <- function(tabela, tab_name, .tipo_dado) {
  if (!dir.exists("dados")) {
    dir.create("dados")
  }

  tab_name <- stringr::str_remove(tab_name, "^tab_")
  if (!is.null(.tipo_dado)) {
    tab_name <- glue::glue("{tab_name}_{.tipo_dado}")
  }

  writexl::write_xlsx(
    tabela,
    path = glue::glue("dados/tabela_{tab_name}.xlsx"),
    col_names = TRUE,
    format_headers = TRUE
  )
}

