#' Gerar Botões de Download
#'
#' Esta função cria botões de download para arquivos de matriz e tabela em formato Excel, 
#' permitindo ao usuário baixar os dados exibidos em uma aplicação Shiny ou relatório HTML.
#'
#' @param tab_name `character`. Nome base da aba ou tabela, utilizado para compor o nome do arquivo.
#' @param ... Elementos HTML adicionais a serem incluídos no container dos botões.
#' @param lang `character`. Idioma dos botões. Aceita `"pt"` (padrão) para português ou `"en"` para inglês.
#' @param .tipo_dado `character` ou `NULL`. Sufixo opcional para diferenciar tipos de dados nos nomes dos arquivos.
#' @param matriz `logical`. Se `TRUE` (padrão), exibe o botão para download da matriz.
#' @param tabela `logical`. Se `TRUE` (padrão), exibe o botão para download da tabela.
#' @param position `character`. Posição do alinhamento dos botões. Padrão é `"end"`.
#'
#' @return Um objeto HTML (`htmltools::div`) contendo os botões de download.
#'
#' @export
gerar_botoes_download <- function(tab_name, ..., lang = "pt", .tipo_dado = NULL, 
                                  matriz = TRUE, tabela = TRUE, position = "end") {
  tab_name <- stringr::str_remove(tab_name, "^tab_")

  if (!is.null(.tipo_dado)) {
    tab_name <- glue::glue("{tab_name}_{.tipo_dado}")
  }

  if (lang == "pt") {
    btn_matriz <- "Matriz"
    btn_tabela <- "Tabela"
  } else if (lang == "en") {
    btn_matriz <- "Matrix"
    btn_tabela <- "Table"
  } 

  htmltools::div(
    class = glue::glue("download mt-4 mb-4 text-{position}"),
    if (matriz) {
      htmltools::tags$a(
        href = glue::glue("dados/matriz_{tab_name}.xlsx"),
        htmltools::tags$button(
          class = "btn btn-default",
          bsicons::bs_icon("download"),
          btn_matriz
        )
      )
    },
    if (tabela) {
      htmltools::tags$a(
        class = "ms-3",
        href = glue::glue("dados/tabela_{tab_name}.xlsx"),
        htmltools::tags$button(
          class = "btn btn-default",
          bsicons::bs_icon("download"),
          btn_tabela
        )
      )
    },
    ...
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
