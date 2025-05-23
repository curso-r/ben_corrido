conectar_bd <- function() {
  DBI::dbConnect(duckdb::duckdb(), "data-raw/bd_ouro.duckdb")
}

salvar_tab_bd <- function(tab, tab_name) {
  con <- DBI::dbConnect(duckdb::duckdb(), "data-raw/bd_ouro.duckdb")
  DBI::dbWriteTable(con, tab_name, tab, overwrite = TRUE)
  DBI::dbDisconnect(con)
}

#' Retorna cor de acordo com o capítulo e variável
#'
#' @param x Nome da variável
#' @param cap Capítulo
#' 
#' @return Cor correspondente em hexadecimal
#' @export
pegar_cor <- function(x, cap) {
  dplyr::case_when(
    # Capítulo 1
    cap == 1 & x == "Lenha" ~ "#953735",
    cap == 1 & x == "Outros" ~ "#C4BD97",
    cap == 1 & x == "Energia Hidráulica" ~ "#95B3D7",
    cap == 1 & x == "Produtos da Cana" ~ "#92D050",
    cap == 1 & x == "Gás Natural" ~ "#ADB8CA",
    cap == 1 & x == "Petróleo" ~ "#0D223F",
    cap == 1 & x == "Carvão Mineral e Coque" ~ "#a5a5a5",
    cap == 1 & x == "Lenha e Carvão Vegetal" ~ "#953735",
    cap == 1 & x == "Hidráulica" ~ "#95B3D7",
    cap == 1 & x == "Derivados da Cana" ~ "#92D050",
    cap == 1 & x == "Petróleo e Derivados" ~ "#0D223F",
    cap == 1 & x == "Bagaço de Cana" ~ "#92D050",
    cap == 1 & x == "Eletricidade" ~ "#FFC000",
    cap == 1 & x == "Derivados de Petróleo" ~ "#0D223F",
    cap == 1 & x == "Agropecuário" ~ "#997300",
    cap == 1 & x == "Serviços" ~ "#FFC000",
    cap == 1 & x == "Consumo Final Não-Energético" ~ "#5089bc",
    cap == 1 & x == "Setor Energético" ~ "#70AD47",
    cap == 1 & x == "Residencial" ~ "#A9D18E",
    cap == 1 & x == "Industrial" ~ "#ED7D31",
    cap == 1 & x == "Transportes" ~ "#953735",
    cap == 1 & x == "Carvão Mineral" ~ "#a5a5a5",
    cap == 1 & x == "Público" ~ "#95B3D7",
    cap == 1 & x == "Comercial" ~ "#FFD966",
    cap == 1 & x == "Outros Setores" ~ "#C4BD97",
    cap == 1 & x == "Termeletricidade" ~ "#ffc000",
    cap == 1 & x == "Comercial e Público" ~ "#FFD966",
    cap == 1 & x == "Solar" ~ "#ED7D31",
    cap == 1 & x == "Eólica" ~ "#FFD966",
    cap == 1 & x == "Carvão Mineral e Derivados" ~ "#a5a5a5",
    cap == 1 & x == "Outras" ~ "#C4BD97",
    cap == 1 & x == "Hidráulica e Eletricidade" ~ "#95B3D7",
    cap == 1 & x == "Produtos da Cana" ~ "#92D050",
    cap == 1 & x == "Petróleo, Gás Natural e Derivados" ~ "#0D223F",
    cap == 1 & x == "Óleo Combustível" ~ "#953735",
    cap == 1 & x == "Óleo Diesel" ~ "#F19353",
    cap == 1 & x == "Carvão Vapor" ~ "#10445B",
    cap == 1 & x == "Urânio contido no UO2" ~ "#FFCC00",
    cap == 1 & x == "Outras Renováveis" ~ "#548235",
    cap == 1 & x == "Importação líquida" ~ "#4F81BD",
    cap == 1 & x == "Lixívia ou Licor negro" ~ "#2f4538",
    cap == 1 & x == "Bagaço de cana" ~ "#92D050",
    cap == 1 & x == "Eólica" ~ "#A9D18E",
    cap == 1 & x == "Solar" ~ "#ED7D31",
    cap == 1 & x == "Hidráulica" ~ "#95B3D7",
    cap == 1 & x == "Nuclear" ~ "#FFCC00",
    cap == 1 & x == "Outras Não Renováveis" ~ "#7F7F7F",
    cap == 1 & x == "Não Renovável" ~ "#7F7F7F",
    cap == 1 & x == "Biomassa" ~ "#92D050",
    cap == 1 & x == "Hidro" ~ "#95B3D7",

    # Capítulo 2
    cap == 2 & x == "Transformação" ~ "#FFC000",
    cap == 2 & x == "Consumo Final" ~ "#00678E",
    cap == 2 & x == "Produção" ~ "#953735",
    cap == 2 & x == "Consumo Total" ~ "#1F4E79",
    cap == 2 & x == "Consumo Final Energético" ~ "#1F4E79",
    cap == 2 & x == "Consumo Final Não-Energético" ~ "#5089bc",
    cap == 2 & x == "Geração Pública" ~ "#70AD47",
    cap == 2 & x == "Geração de Autoprodutores" ~ "#A9D18E",
    cap == 2 & x == "Comercial" ~ "#FFD966",
    cap == 2 & x == "Residencial" ~ "#A9D18E",
    cap == 2 & x == "Industrial" ~ "#ED7D31",
    cap == 2 & x == "Agropecuário" ~ "#C4BD97",
    cap == 2 & x == "Setor Energético" ~ "#70AD47",
    cap == 2 & x == "Transformação" ~ "#FFC000",
    cap == 2 & x == "Público" ~ "#95B3D7",
    cap == 2 & x == "Outros" ~ "#C4BD97",
    cap == 2 & x == "Comercial e Público" ~ "#FFD966",

    # Capítulo 3
    cap == 3 & x == "Gás Natural" ~ "#ADB8CA",
    cap == 3 & x == "Bagaço de Cana" ~ "#997300",
    cap == 3 & x == "Óleo Combustível" ~ "#953735",
    cap == 3 & x == "Eletricidade" ~ "#FFD700",
    cap == 3 & x == "Outros" ~ "#C4BD97",
    cap == 3 & x == "Gás Liquefeito de Petróleo" ~ "#5B9BD5",
    cap == 3 & x == "Óleo Diesel" ~ "#F19353",
    cap == 3 & x == "Solar Térmica" ~ "#FF6347",
    cap == 3 & x == "Lenha" ~ "#70AD47",
    cap == 3 & x == "Biodiesel" ~ "#997300",
    cap == 3 & x == "Querosene" ~ "#953735",
    cap == 3 & x == "Gasolina Automotiva" ~ "#FFD700",
    cap == 3 & x == "Álcool Etílico" ~ "#70AD47",
    cap == 3 & x == "Gasolina de Aviação" ~ "#0072A1",
    cap == 3 & x == "Querosene de Aviação" ~ "#953735",
    cap == 3 & x == "Carvão Vapor" ~ "#10445B",
    cap == 3 & x == "Óleo Combustível" ~ "#953735",
    cap == 3 & x == "Outras Secundárias de Petróleo" ~ "#1F4E79",
    cap == 3 & x == "Álcool Etílico Anidro" ~ "#548262",
    cap == 3 & x == "Álcool Etílico Hidratado" ~ "#70AD47",
    cap == 3 & x == "Coque de Carvão Mineral" ~ "#6D6D6D",
    cap == 3 & x == "Carvão Vegetal" ~ "#70AD47",
    cap == 3 & x == "Carvão Mineral" ~ "#6D6D6D",
    cap == 3 & x == "Coque de Petróleo" ~ "#10445B",
    cap == 3 & x == "Gás de Coqueria" ~ "#F19353",
    cap == 3 & x == "Carvão Minerale Coque de Cm" ~ "#6D6D6D",
    cap == 3 & x == "Carvão Mineral / Coque de C.m." ~ "#6D6D6D",
    cap == 3 & x == "Lixívia" ~ "#2f4538",
    cap == 3 & x == "Carvão Vegetal e Lenha" ~ "#70AD47",
    cap == 3 & x == "Outras" ~ "#C4BD97",

    # Capítulo 4
    cap == 4 & x == "Demanda Total de Energia (a)" ~ "#1F4E79",
    cap == 4 & x == "Produção de Energia Primária (b)" ~ "#953735",
    cap == 4 & x == "Dependência Externa (c)=(a)-(b)" ~ "#FCEEB1",
    cap == 4 & x == "Demanda de Petróleo e Derivados (a)" ~ "#1F4E79",
    cap == 4 & x == "Produção Total de Petróleo (b)" ~ "#953735",
    cap == 4 & x == "Déficit - mil tep (a)-(b)" ~ "#FCEEB1",
    cap == 4 & x == "Total" ~ "#953735",
    cap == 4 & x == "Petróleo" ~ "#0D223F",

    # Capítulo 5
    cap == 5 & x == "Não Renováveis" ~ "#7F7F7F",
    cap == 5 & x == "Renováveis" ~ "#92D050",
    cap == 5 & x == "Gás Natural" ~ "#ADB8CA",
    cap == 5 & x == "Carvão Vapor" ~ "#10414a",
    cap == 5 & x == "Urânio Contido No UO2" ~ "#FFCC00",
    cap == 5 & x == "Eólica" ~ "#A9D18A",
    cap == 5 & x == "Solar" ~ "#ED7D31",
    cap == 5 & x == "Hidráulica" ~ "#95b3d9",
    cap == 5 & x == "Biomassa" ~ "#c4bd97",
    cap == 5 & x == "Derivados de Petróleo" ~ "#953735",
    cap == 5 & x == "Carvão e Derivados" ~ "#7F7F7F",
    cap == 5 & x == "Biomassa, Solar e Eólica" ~ "#c4bd97",
    cap == 5 & x == "Solar e Eólica" ~ "#ED7D31",

    # Anexo 1
    cap == "anexo_1" & x == "Hidro" ~ "#95b3d9",
    cap == "anexo_1" & x == "Termo" ~ "#953760",
    cap == "anexo_1" & x == "Eólica" ~ "#A9D18A",
    cap == "anexos" & x == "Solar" ~ "#ED7D31",
    cap == "anexo_1" & x == "Nuclear" ~ "#FFCC00",
    
    # Anexo 4
    cap == "anexo_4" & x == "Energia Útil" ~ "#CF4E48",
    cap == "anexo_4" & x == "Potencial de Economia de Energia" ~ "#ED7D31",
    cap == "anexo_4" & x == "Energia não Recuperável" ~ "#FFA07A",

    # Valor padrão
    TRUE ~ "#000000"
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
  max(anos) - 10
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
