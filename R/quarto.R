#' Gera o livro em diferentes perfis de idioma usando Quarto
#'
#' Esta função copia o diretório de arquivos Quarto, renderiza o livro nos perfis especificados (por exemplo, português e inglês)
#' e remove o diretório temporário após a renderização.
#'
#' @param out_dir Diretório de saída onde o livro será gerado. Padrão é \code{"~/Desktop/ben_corrido"}.
#' @param profiles Vetor de perfis de idioma a serem renderizados. Padrão é \code{c("pt", "en")}.
#' @param duckdb_path Caminho para o banco de dados DuckDB utilizado na renderização. Padrão é \code{"~/Documents/curso-r/ben_corrido/data-raw/bd_ouro.duckdb"}.
#'
#' @return Não retorna valor. Gera os arquivos do livro nos perfis especificados.
#' @export
#'
gerar_livro <- function(out_dir = "~/Desktop/ben_corrido",
                        profiles = c("pt", "en"),
                        duckdb_path = "~/Documents/curso-r/ben_corrido/data-raw/bd_ouro.duckdb") {
  fs::dir_copy(
    path = sys_file("quarto"),
    new_path = glue::glue("{out_dir}/quarto"),
    overwrite = TRUE
  )
  if ("pt" %in% profiles) {
    quarto::quarto_render(
      input = glue::glue("{out_dir}/quarto"),
      as_job = FALSE,
      execute_params = list(duckdb_path = duckdb_path),
      profile = "pt"
    )
  }
  if ("en" %in% profiles) {
    quarto::quarto_render(
      input = glue::glue("{out_dir}/quarto"),
      as_job = FALSE,
      execute_params = list(duckdb_path = duckdb_path),
      profile = "en"
    )
  }
  fs::dir_delete(glue::glue("{out_dir}/quarto"))
}
