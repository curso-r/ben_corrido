gerar_livro <- function(con = NULL, ano = 2023,
                        out_dir = "~/Desktop/ben_corrido",
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
      execute_params = list(ano = ano, duckdb_path = duckdb_path),
      profile = "pt"
    )
  }
  if ("en" %in% profiles) {
    quarto::quarto_render(
      input = glue::glue("{out_dir}/quarto"),
      as_job = FALSE,
      execute_params = list(ano = ano, duckdb_path = duckdb_path),
      profile = "en"
    )
  }
  fs::dir_delete(glue::glue("{out_dir}/quarto"))
}
