conectar_bd <- function() {
  DBI::dbConnect(duckdb::duckdb(), "data-raw/bd_ouro.duckdb")
}

salvar_tab_bd <- function(tab, tab_name) {
  con <- DBI::dbConnect(duckdb::duckdb(), "data-raw/bd_ouro.duckdb")
  DBI::dbWriteTable(con, tab_name, tab, overwrite = TRUE)
  DBI::dbDisconnect(con)
}

pegar_cor <- function(x) {
  dplyr::case_when(
    x == "Óleo Combustível" ~ "#953735",
    x == "Óleo Diesel" ~ "#F19353",
    x == "Carvão Vapor" ~ "#10445B",
    x == "Outros" ~ "#C4BD97",
    x == "Urânio contido no UO2" ~ "#FFCC00",
    x == "Gás Natural" ~ "#ADB8CA",
    x == "Outras Renováveis" ~ "#548235",
    x == "Importação líquida" ~ "#4F81BD",
    x == "Lixívia ou Licor negro" ~ "#2f4538",
    x == "Bagaço de cana" ~ "#92D050",
    x == "Eólica" ~ "#A9D18E",
    x == "Solar" ~ "#ED7D31",
    x == "Solar Térmica" ~ "#FF6347",
    x == "Hidráulica" ~ "#95B3D7",
    x == "Nuclear" ~ "#FFCC00",
    x == "Outras Não Renováveis" ~ "#7F7F7F",
    x == "Industrial" ~ "#ED7D31",
    x == "Residencial" ~ "#A9D18E",
    x == "Comercial" ~ "#FFD966",
    x == "Público" ~ "#95B3D7",
    x == "Setor Energético" ~ "#70AD47",
    x == "Agropecuário" ~ "#997300",
    x == "Transportes" ~ "#953735",
    x == "Hidro" ~ "#95B3D7",
    x == "Não Renovável" ~ "#7F7F7F",
    x == "Biomassa" ~ "#92D050",
    x == "Lenha" ~ "#70AD47",
    x == "Energia Hidráulica" ~ "#95B3D7",
    x == "Produtos da Cana" ~ "#92D050",
    x == "Petróleo" ~ "#0D223F",
    x == "Carvão Mineral e Coque" ~ "#a5a5a5",
    x == "Lenha e Carvão Vegetal" ~ "#70AD47",
    x == "Derivados da Cana" ~ "#92D050",
    x == "Petróleo e Derivados" ~ "#0D223F",
    x == "Eletricidade" ~ "#FFD700",
    x == "Derivados de Petróleo" ~ "#0D223F",
    x == "Serviços" ~ "#FFC000",
    x == "Consumo Final Não-Energético" ~ "#5089bc",
    x == "Carvão Mineral" ~ "#a5a5a5",
    x == "Outros Setores" ~ "#C4BD97",
    x == "Termeletricidade" ~ "#ffc000",
    x == "Comercial e Público" ~ "#FFD966",
    x == "Carvão Mineral e Derivados" ~ "#a5a5a5",
    x == "Carvão Metalúrgico" ~ "#a5a5a5",
    x == "Hidráulica e Eletricidade" ~ "#95B3D7",
    x == "Petróleo, Gás Natural e Derivados" ~ "#0D223F",
    x == "Transformação" ~ "#FFC000",
    x == "Consumo Final" ~ "#00678E",
    x == "Produção" ~ "#953735",
    x == "Consumo Total" ~ "#1F4E79",
    x == "Consumo Final Energético" ~ "#1F4E79",
    x == "Geração Pública" ~ "#70AD47",
    x == "Geração de Autoprodutores" ~ "#A9D18E",
    x == "Gás Liquefeito de Petróleo" ~ "#5B9BD5",
    x == "Biodiesel" ~ "#997300",
    x == "Querosene" ~ "#953735",
    x == "Gasolina Automotiva" ~ "#FFD700",
    x == "Álcool Etílico" ~ "#70AD47",
    x == "Gasolina de Aviação" ~ "#0072A1",
    x == "Querosene de Aviação" ~ "#953735",
    x == "Outras Secundárias de Petróleo" ~ "#1F4E79",
    x == "Álcool Etílico Anidro" ~ "#548262",
    x == "Álcool Etílico Hidratado" ~ "#70AD47",
    x == "Coque de Carvão Mineral" ~ "#6D6D6D",
    x == "Carvão Vegetal" ~ "#70AD47",
    x == "Coque de Petróleo" ~ "#10445B",
    x == "Gás de Coqueria" ~ "#F19353",
    x == "Carvão Vegetal e Lenha" ~ "#70AD47",
    x == "Carvão Minerale Coque de Cm" ~ "#6D6D6D",
    x == "Carvão Mineral / Coque de C.m." ~ "#6D6D6D",
    x == "Lixívia" ~ "#2f4538",
    x == "Bagaço de Cana" ~ "#997301",
    x == "Demanda Total de Energia (a)" ~ "#1F4E79",
    x == "Produção de Energia Primária (b)" ~ "#953735",
    x == "Dependência Externa (c)=(a)-(b)" ~ "#FCEEB1",
    x == "Demanda de Petróleo e Derivados (a)" ~ "#1F4E79",
    x == "Produção Total de Petróleo (b)" ~ "#953735",
    x == "Déficit - mil tep (a)-(b)" ~ "#FCEEB1",
    x == "Não Renováveis" ~ "#7F7F7F",
    x == "Renováveis" ~ "#92D050",
    x == "Biomassa, Solar e Eólica" ~ "#c4bd97",
    x == "Carvão e Derivados" ~ "#7F7F7F",
    x == "Derivados de Petróleo" ~ "#953735",
    x == "Solar e Eólica" ~ "#ED7D31",
    x == "Termo" ~ "#953760",
    x == "Energia Útil" ~ "#CF4E48",
    x == "Potencial de Economia de Energia" ~ "#ED7D31",
    x == "Energia não Recuperável" ~ "#FFA07A",
    TRUE ~ NA_character_
  )
}

pegar_locale <- function(lang) {
  if (lang == "pt") {
    return("pt-BR")
  } else {
    return(NULL)
  }
}

determinar_menor_ano <- function(anos) {
  max(anos) - 9
}

sys_file <- function(x) {
  system.file(x, package = "benCorrido")
}

#' Transformar gráfico em SVG
#'
#' @export
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

#' Create a dropdown plot
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

  for (param in params) {
    select_html <- htmltools::tagAppendChild(
      select_html,
      htmltools::tags$option(value = param, param)
    )
  }

  dropdown_html <- htmltools::div(
    class = "form-group mb-3",
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

  # Combine everything into a single HTML document
  htmltools::tagList(
    dropdown_html,
    element_html
  )
}
