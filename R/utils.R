conectar_bd <- function() {
  DBI::dbConnect(duckdb::duckdb(), "data-raw/bd_ouro.duckdb")
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
    x == "Hidráulica" ~ "#95B3D7",
    x == "Nuclear" ~ "#FFCC00",
    x == "Outras Não Renováveis" ~ "#7F7F7F",
    x == "Industrial" ~ "#ED7D31",
    x == "Residencial" ~ "#A9D18E",
    x == "Comercial" ~ "#FFD966",
    x == "Público" ~ "#95B3D7",
    x == "Setor Energético" ~ "#70AD47",
    x == "Agropecuário" ~ "#C4BD97",
    x == "Transportes" ~ "#953735",
    x == "Hidro" ~ "#95B3D7",
    x == "Não Renovável" ~ "#7F7F7F",
    x == "Biomassa" ~ "#92D050",
    x == "Lenha" ~ "#953735",
    x == "Energia Hidráulica" ~ "#95B3D7",
    x == "Produtos da Cana" ~ "#92D050",
    x == "Petróleo" ~ "#0D223F",
    x == "Carvão Mineral e Coque" ~ "#a5a5a5",
    x == "Lenha e Carvão Vegetal" ~ "#953735",
    x == "Derivados da Cana" ~ "#92D050",
    x == "Petróleo e Derivados" ~ "#0D223F",
    x == "Eletricidade" ~ "#FFC000",
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
    TRUE ~ NA_character_
  )
}

sys_file <- function(x) {
  system.file(x, package = "benCorrido")
}

#' Create a dropdown plot
#'
#' @export
create_dropdown_plot <- function(plots, params, label = "", width = "300px") {
  if (length(plots) != length(params)) {
    stop("The number of plots must match the number of parameters")
  }

  plots <- purrr::map(plots, \(x) transformar_svg(x, html = TRUE))

  # Create a unique ID for the dropdown and plot container
  dropdown_id <- paste0("dropdown_", sample(1:10000, 1))

  # Create the dropdown HTML
  select_html <- htmltools::tags$select(
    id = dropdown_id,
    class = "form-select",
    onchange = sprintf("updatePlot('%s')", dropdown_id),
    style = glue::glue("width: {width};")
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

  # Create the JavaScript function to update the plot
  js_code <- sprintf("
    <script>
      function updatePlot(dropdown_id) {
        var selected_param = document.getElementById(dropdown_id).value;
        var plot_divs = document.getElementsByClassName('plot_container');
        for (var i = 0; i < plot_divs.length; i++) {
          plot_divs[i].style.display = 'none';
        }
        var plot_div = document.getElementById('plot_' + selected_param);
        if (plot_div) {
          plot_div.style.display = 'block';
        }
      }
    </script>
  ")

  # Create the HTML for each plot
  plot_htmls <- lapply(seq_along(plots), function(i) {
    plot_id <- paste0("plot_", params[i])
    display <- ifelse(i == 1, "block", "none")
    plot_div <- htmltools::tags$div(
      id = plot_id,
      class = "plot_container",
      style = glue::glue("display: {display}; width: 100%;"),
      plots[[i]]
    )
    plot_div
  })

  # Combine everything into a single HTML document
  htmltools::tagList(
    dropdown_html,
    htmltools::HTML(js_code),
    plot_htmls
  )
}
