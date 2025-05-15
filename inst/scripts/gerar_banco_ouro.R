# Gráficos ---------------------------------------------------------------------

# CAPÍTULO 1

# grafico_geracao_energia_fontes_nr
tab <- readr::read_rds("data-raw/rds/pt/dados_agregados_1_1_a_tratados.rds")
tab_en <- readr::read_rds("data-raw/rds/en/dados_agregados_1_1_a_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_geracao_energia_fontes_nr")

# grafico_oferta_interna_el_fonte
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_b_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_b_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_oferta_interna_el_fonte")

# grafico_variacao_consumo_setorial_el
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_1_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_1_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_variacao_consumo_setorial_el")

# grafico_crescimento_consumo_eletricidade_industria
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_2_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_2_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_crescimento_consumo_eletricidade_industria")

# grafico_participacao_setorial_consumo_el
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_3_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_3_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_participacao_setorial_consumo_el")

# grafico_participacao_fontes_capacidade_instalada
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_4_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_4_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_participacao_fontes_capacidade_instalada")

# grafico_consumo_gas_natural
tab <- readr::read_rds("./data-raw/rds/pt/dados_agregados_1_1_5_tratados.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_agregados_1_1_5_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "grafico_consumo_gas_natural")

# grafico_producao_energia_primaria
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_2_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Petróleo", "Gás Natural", "Energia Hidráulica", "Lenha", "Produtos da Cana"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_producao_energia_primaria")

# grafico_oferta_interna_energia
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_3_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_3_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Petróleo e Derivados", "Derivados da Cana", "Carvão Mineral e Coque", "Lenha e Carvão Vegetal", "Hidráulica"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_oferta_interna_energia")

# grafico_consumo_final_fonte
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_4_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_1)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_4_traduzido.rds") |>
  dplyr::select(
    grupo = grupo_nivel_1,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Bagaço de Cana", "Derivados de Petróleo", "Eletricidade", "Lenha", "Gás Natural"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_consumo_final_fonte")

# grafico_consumo_final_setor
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_5_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_menor)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_5_traduzido.rds") |>
  dplyr::select(
    grupo = grupo_nivel_menor,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Consumo Final Não-Energético", "Transportes", "Industrial", "Residencial", "Setor Energético", "Agropecuário"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_consumo_final_setor")

# grafico_dependencia_externa_energia
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_8_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_8_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(tipo_dado == "Percentual") |>
  dplyr::select(
    grupo,
    grupo_en,
    ano,
    total
  )

salvar_tab_bd(tab, "grafico_dependencia_externa_energia")

# grafico_composicao_setorial_consumo_derivados_petroleo
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_9_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_9_traduzido.rds") |>
  dplyr::select(
    grupo,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Consumo Final Não-Energético", "Transportes", "Industrial", "Residencial", "Setor Energético", "Agropecuário"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_composicao_setorial_consumo_derivados_petroleo")

# grafico_composicao_setorial_consumo_eletricidade
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_10_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_10_traduzido.rds") |>
  dplyr::select(
    grupo,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Transportes", "Comercial", "Público", "Industrial", "Residencial", "Setor Energético", "Agropecuário"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_composicao_setorial_consumo_eletricidade")

# grafico_composicao_setorial_consumo_carvao_vapor
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_11_traduzido.rds") |>
  dplyr::select(grupo_en = macro_grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_11_traduzido.rds") |>
  dplyr::select(
    grupo = macro_grupo,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Termeletricidade", "Industrial", "Outros Setores"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_composicao_setorial_consumo_carvao_vapor")

# grafico_composicao_setorial_consumo_biomassa
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_12_traduzido.rds") |>
  dplyr::select(grupo_en = macro_grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_12_traduzido.rds") |>
  dplyr::select(
    grupo = macro_grupo,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Agropecuário", "Industrial", "Residencial", "Setor Energético", "Transportes", "Comercial e Público"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_composicao_setorial_consumo_biomassa")

# grafico_oferta_interna_energia_2
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_13_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_13_traduzido.rds") |>
  dplyr::select(
    grupo,
    ano,
    tipo_dado,
    total
  ) |>
  dplyr::bind_cols(tab_en)

salvar_tab_bd(tab, "grafico_oferta_interna_energia_2")

# grafico_sankey_fluxo_energetico

source("inst/scripts/gerar_fluxo_energetico.R")
salvar_tab_bd(grafico_sankey_fluxo_energetico, "grafico_sankey_fluxo_energetico")

# grafico_sankey_fluxo_eletrico

source("inst/scripts/gerar_fluxo_energetico.R")
salvar_tab_bd(grafico_sankey_fluxo_eletrico, "grafico_sankey_fluxo_eletrico")

# CAPÍTULO 2

# grafico_estrutura_consumo_fontes_primarias
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_1_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_1_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Transformação", "Consumo Final"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_estrutura_consumo_fontes_primarias")

# grafico_fontes_primarias
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_1_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_1)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_1_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Produção", "Consumo Total"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_fontes_primarias")


# grafico_petroleo
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_2_traduzido.rds") |>
  dplyr::select(grupo_en = macro_grupo)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_2_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = macro_grupo, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Produção", "Consumo Total"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_petroleo")

# grafico_gas_natural
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_3_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_3, grupo_aux_en = grupo_nivel_2)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_3_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_3, grupo_aux = grupo_nivel_2, grupo_en, grupo_aux_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c(
      "Produção de Derivados de Petróleo",
      "Geração Elétrica",
      "Consumo Final Não-Energético",
      "Consumo Final Energético"
    ),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::mutate(
    grupo_en = dplyr::case_when(
      grupo %in% c("Produção de Derivados de Petróleo", "Geração Elétrica") ~ grupo_aux_en,
      .default = grupo_en
    ),
    grupo = dplyr::case_when(
      grupo %in% c("Produção de Derivados de Petróleo", "Geração Elétrica") ~ grupo_aux,
      .default = grupo
    )
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_estrutura_consumo_gas_natural")

# grafico_carvao_vapor
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_4_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_4_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Transformação", "Consumo Final"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_carvao_vapor")

# grafico_transformacao_energia_hidraulica
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_6_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_menor)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_6_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_menor, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Geração Pública", "Geração de Autoprodutores"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_transformacao_energia_hidraulica")

# grafico_consumo_energia_solar_termica_setor
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_9_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_9_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Residencial", "Comercial", "Industrial"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_consumo_energia_solar_termica_setor")

# grafico_uranio
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_10_traduzido.rds") |>
  dplyr::select(grupo_en = macro_grupo)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_10_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = macro_grupo, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Produção", "Consumo Total"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_uranio")

# grafico_estrutura_consumo_lenha
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_11_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_4, grupo_aux_en = grupo_nivel_2)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_11_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_4, grupo_aux = grupo_nivel_2, grupo_en, grupo_aux_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c(
      "Geração Elétrica",
      "Produção de Carvão Vegetal",
      "Residencial",
      "Agropecuário",
      "Industrial"
    ),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::mutate(
    grupo_en = dplyr::case_when(
      grupo %in% c("Produção de Carvão Vegetal", "Geração Elétrica") ~ grupo_aux_en,
      .default = grupo_en
    ),
    grupo = dplyr::case_when(
      grupo %in% c("Produção de Carvão Vegetal", "Geração Elétrica") ~ grupo_aux,
      .default = grupo
    )
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_estrutura_consumo_lenha")

# grafico_estrutura_consumo_bagaco_cana
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_14_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_4, grupo_aux_en = grupo_nivel_2)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_14_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_4, grupo_aux = grupo_nivel_2, grupo_en, grupo_aux_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c(
      "Transformação",
      "Setor Energético",
      "Industrial"
    ),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_estrutura_consumo_bagaco_cana")

# grafico_estrutura_consumo_lixivia
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_15_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_15_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Transformação", "Consumo Final"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_estrutura_consumo_lixivia")

# grafico_estrutura_consumo_outras_fontes_primarias
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_16_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_16_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Transformação", "Consumo Final"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_estrutura_consumo_outras_fontes_primarias")


# grafico_estrutura_consumo_outras_fontes_secundarias
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_17_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_17_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Transformação", "Consumo Final"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_estrutura_consumo_outras_fontes_secundarias")

# grafico_fontes_secundarias
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_17_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_1)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_17_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Produção", "Consumo Total"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_fontes_secundarias")

# grafico_estrutura_consumo_derivados_petrolo_gas_natural
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_18_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_4)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_18_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_4, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c(
      "Consumo Final Não-Energético",
      "Setor Energético",
      "Residencial",
      "Comercial",
      "Público",
      "Agropecuário",
      "Transportes",
      "Industrial",
      "Transformação",
      "Consumo Não-Identificado"
    ),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Consumo Final Não-Energético", "Transportes", "Industrial"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_estrutura_consumo_derivados_petrolo_gas_natural")


# grafico_oleo_diesel_total
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_19_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_1)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_19_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Produção", "Consumo Total"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_oleo_diesel_total")

# grafico_diesel_petroleo
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_20_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_1)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_20_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Produção", "Consumo Total"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_diesel_petroleo")

# grafico_oleo_combustivel
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_22_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_1)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_22_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Produção", "Consumo Total"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_oleo_combustivel")

# grafico_gasolina
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_23_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_1)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_23_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Produção", "Consumo Total"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_gasolina")

# grafico_glp
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_24_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_1)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_24_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Produção", "Consumo Total"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_glp")

# grafico_estrutura_consumo_nafta
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_25_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_25_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Transformação", "Consumo Final"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_estrutura_consumo_nafta")

# grafico_nafta
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_25_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_1)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_25_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Produção", "Consumo Total"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_nafta")

# grafico_coque_carvao_mineral
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_26_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_1)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_26_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Produção", "Consumo Total"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_coque_carvao_mineral")

# grafico_querosene
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_27_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_1)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_27_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Produção", "Consumo Total"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_querosene")

# grafico_estrutura_consumo_gas_coqueria
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_29_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_29_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Transformação", "Consumo Final"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_estrutura_consumo_gas_coqueria")

# grafico_consumo_final_eletricidade_setor
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_30_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_4)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_30_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(
    grupo_nivel_3 == "Consumo Final Energético",
    tipo_dado == "Absoluto"
  ) |>
  dplyr::select(grupo = grupo_nivel_4, grupo_en, ano, total, tipo_dado) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Comercial", "Industrial", "Público", "Residencial"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_consumo_final_eletricidade_setor")

# grafico_estrutura_consumo_alcool_etilico
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_32_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_3)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_32_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo = grupo_nivel_3, grupo_en, ano, total, tipo_dado) |>
  dplyr::filter(
    grupo %in% c("Consumo Final Não-Energético", "Consumo Final Energético"),
    tipo_dado == "Absoluto"
  ) |>
  dplyr::group_by(ano, grupo, grupo_en) |>
  dplyr::summarise(Absoluto = sum(total), .groups = "drop") |>
  dplyr::group_by(ano) |>
  dplyr::mutate(Percentual = Absoluto / sum(Absoluto) * 100) |>
  dplyr::ungroup() |>
  tidyr::pivot_longer(
    cols = c(Absoluto, Percentual),
    names_to = "tipo_dado",
    values_to = "total"
  )

salvar_tab_bd(tab, "grafico_estrutura_consumo_alcool_etilico")

# CAPÍTULO 3

# grafico_setor_energetico
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_1_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_1_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Gás Natural", "Bagaço de Cana", "Óleo Combustível", "Eletricidade"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_setor_energetico")

# grafico_setor_comercial
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_2_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Gás Liquefeito de Petróleo", "Óleo Diesel", "Eletricidade", "Solar Térmica"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_setor_comercial")

# grafico_setor_publico
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_3_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_3_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Gás Liquefeito de Petróleo", "Óleo Diesel", "Eletricidade"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_setor_publico")

# grafico_setor_residencial
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_4_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_4_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Lenha", "Gás Liquefeito de Petróleo", "Eletricidade"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_setor_residencial")

# grafico_setor_agropecuario
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_5_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_5_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Lenha", "Eletricidade", "Óleo Diesel"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_setor_agropecuario")

# grafico_setor_transportes_geral
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_6_traduzido.rds") |>
  dplyr::select(grupo_en = macro_grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_6_traduzido.rds") |>
  dplyr::select(grupo = macro_grupo, ano, tipo_dado, total) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Óleo Diesel", "Querosene", "Gasolina Automotiva", "Gás Natural", "Biodiesel", "Álcool Etílico"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, tipo_dado, ano, grupo_en) |>
  dplyr::summarise(
    total = sum(total, na.rm = TRUE),
    .groups = "drop"
  )

salvar_tab_bd(tab, "grafico_setor_transportes_geral")

# grafico_setor_industrial_geral
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_7_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_7_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = forcats::fct_other(
      grupo,
      keep = c("Coque de Carvão Mineral", "Gás Natural", "Eletricidade", "Óleo Combustível", "Bagaço de Cana", "Lenha"),
      other_level = "Outros"
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_setor_industrial_geral")

# grafico_setor_industrial_segmento
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_7_por_setor_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_7_por_setor_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    grupo = dplyr::case_when(
      dado == "Cimento" ~ forcats::fct_other(
        grupo,
        keep = c("Carvão Mineral", "Óleo Combustível", "Eletricidade", "Carvão Vegetal", "Coque de Petróleo"),
        other_level = "Outros"
      ) |> as.character(),
      dado == "Ferro-gusa e Aço" ~ forcats::fct_other(
        grupo,
        keep = c("Gás Natural", "Coque de Carvão Mineral", "Óleo Combustível", "Gás de Coqueria", "Eletricidade", "Carvão Vegetal"),
        other_level = "Outros"
      ) |> as.character(),
      dado == "Ferroligas" ~ forcats::fct_other(
        grupo,
        keep = c("Eletricidade", "Carvão Vegetal e Lenha"),
        other_level = "Outros"
      ) |> as.character(),
      dado == "Mineração e Pelotização" ~ forcats::fct_other(
        grupo,
        keep = c("Gás Natural", "Carvão Minerale Coque de Cm", "Óleo Diesel", "Óleo Combustível", "Eletricidade", "Coque de Petróleo"),
        other_level = "Outros"
      ) |> as.character(),
      dado == "Química" ~ forcats::fct_other(
        grupo,
        keep = c("Gás Natural", "Óleo Combustível", "Eletricidade"),
        other_level = "Outros"
      ) |> as.character(),
      dado == "Não Ferrosos e Outros da Metalurgia" ~ forcats::fct_other(
        grupo,
        keep = c("Gás Natural", "Óleo Combustível", "Carvão Mineral / Coque de C.m.", "Eletricidade", "Outras Secundárias de Petróleo"),
        other_level = "Outros"
      ) |> as.character(),
      dado == "Têxtil" ~ forcats::fct_other(
        grupo,
        keep = c("Gás Natural", "Lenha", "Óleo Combustível", "Gás Liquefeito de Petróleo", "Eletricidade"),
        other_level = "Outros"
      ) |> as.character(),
      dado == "Alimentos e Bebidas" ~ forcats::fct_other(
        grupo,
        keep = c("Gás Natural", "Lenha", "Bagaço de Cana", "Óleo Diesel", "Óleo Combustível", "Eletricidade"),
        other_level = "Outros"
      ) |> as.character(),
      dado == "Papel e Celulose" ~ forcats::fct_other(
        grupo,
        keep = c("Gás Natural", "Lenha", "Lixívia", "Óleo Diesel", "Óleo Combustível", "Eletricidade"),
        other_level = "Outros"
      ) |> as.character(),
      dado == "Cerâmica" ~ forcats::fct_other(
        grupo,
        keep = c("Gás Natural", "Lenha", "Óleo Combustível", "Gás Liquefeito de Petróleo", "Eletricidade"),
        other_level = "Outros"
      ) |> as.character(),
      dado == "Outras Indústrias" ~ forcats::fct_other(
        grupo,
        keep = c("Gás Natural", "Lenha", "Gás Liquefeito de Petróleo", "Eletricidade"),
        other_level = "Outros"
      ) |> as.character(),
    ),
    grupo_en = ifelse(grupo == "Outros", "Other", grupo_en)
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado, dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_setor_industrial_segmento")

# CAPÍTULO 4

# grafico_dependencia_externa_energia_2
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_4_1_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_4_1_traduzido.rds") |>
  dplyr::select(grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |>
  dplyr::select(grupo = macro_grupo, grupo_en, tipo_dado, ano, total) |>
  dplyr::filter(grupo != "Dependência Externa (c)/(a) %") |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_dependencia_externa_energia_2")

# grafico_dependencia_externa_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_4_2_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_4_2_traduzido.rds") |>
  dplyr::select(grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |>
  dplyr::select(grupo = macro_grupo, grupo_en, tipo_dado, ano, total) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    grupo %in% c(
      "Demanda de Petróleo e Derivados (a)",
      "Produção Total de Petróleo (b)",
      "Déficit - mil tep (a)-(b)"
    )
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_dependencia_externa_petroleo")

# grafico_importacoes_energia
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_4_3_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_4_3_traduzido.rds") |>
  dplyr::select(
    grupo_en = grupo_nivel_1
  )

tab <- cbind(tab, tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, tipo_dado, ano, total) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    grupo %in% c(
      "Petróleo",
      "Total"
    )
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_importacoes_energia")

# grafico_exportacoes_energia
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_4_4_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_4_4_traduzido.rds") |>
  dplyr::select(
    grupo_en = grupo_nivel_1
  )

tab <- cbind(tab, tab_en) |>
  dplyr::select(grupo = grupo_nivel_1, grupo_en, tipo_dado, ano, total) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    grupo == "Total"
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = -sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_exportacoes_energia")

# grafico_exportacoes_importacoes_liquidas
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_4_5_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_4_5_traduzido.rds") |>
  dplyr::select(grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |>
  dplyr::select(grupo = macro_grupo, grupo_en, tipo_dado, ano, total) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    grupo == "Total"
  ) |>
  dplyr::group_by(grupo, grupo_en, ano, tipo_dado) |>
  dplyr::summarise(total = sum(total), .groups = "drop")

salvar_tab_bd(tab, "grafico_exportacoes_importacoes_liquidas")

# CAPÍTULO 5

# grafico_total_geracao_centrais_eletr_renov_nao_renov

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_3_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_3_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    grupo_nivel_1 == "Geração de Eletricidade - GWh"
  ) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total) |>
  dplyr::group_by(grupo, grupo_en, ano) |>
  dplyr::summarise(total = sum(total), .groups = "drop") |>
  dplyr::mutate(tipo_dado = "Absoluto")

salvar_tab_bd(tab, "grafico_total_geracao_centrais_eletr_renov_nao_renov")

# grafico_total_geracao_centrais_eletr_por_fonte

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_3_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_menor)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_3_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    grupo_nivel_1 == "Geração de Eletricidade - GWh"
  ) |>
  dplyr::select(grupo = grupo_nivel_menor, grupo_en, ano, total) |>
  dplyr::mutate(
    grupo = dplyr::case_when(
      grupo %in% c("Bagaço de Cana", "Lixívia", "Lenha", "Biodiesel", "Outras Renováveis") ~ "Biomassa",
      grupo %in% c("Óleo Combustível", "Óleo Diesel", "Outras Secundárias", "Outras Não Renováveis") ~ "Derivados de Petróleo",
      grupo %in% c("Gás de Coqueria", "Carvão Vapor") ~ "Carvão e Derivados",
      .default = grupo
    ),
    grupo_en = dplyr::case_when(
      grupo == "Biomassa" ~ "Biomass",
      grupo == "Derivados de Petróleo" ~ "Oil Products",
      grupo == "Carvão e Derivados" ~ "Coal and derivatives",
      TRUE ~ grupo_en
    )
  ) |>
  dplyr::group_by(grupo, grupo_en, ano) |>
  dplyr::summarise(total = sum(total), .groups = "drop") |>
  dplyr::mutate(tipo_dado = "Absoluto")

salvar_tab_bd(tab, "grafico_total_geracao_centrais_eletr_por_fonte")

# grafico_total_geracao_centrais_eletr_servico_pub_renov_nao_renov

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_4_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_4_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    grupo_nivel_1 == "Geração de Eletricidade - GWh"
  ) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total) |>
  dplyr::group_by(grupo, grupo_en, ano) |>
  dplyr::summarise(total = sum(total), .groups = "drop") |>
  dplyr::mutate(tipo_dado = "Absoluto")

salvar_tab_bd(tab, "grafico_total_geracao_centrais_eletr_servico_pub_renov_nao_renov")

# grafico_total_geracao_centrais_eletr_servico_pub_por_fonte

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_4_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_menor)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_4_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    grupo_nivel_1 == "Geração de Eletricidade - GWh"
  ) |>
  dplyr::select(grupo = grupo_nivel_menor, grupo_en, ano, total) |>
  dplyr::mutate(
    grupo = dplyr::case_when(
      grupo %in% c("Lenha", "Biodiesel", "Outras Renováveis", "Solar", "Eólica") ~ "Biomassa, Solar e Eólica",
      grupo %in% c("Óleo Combustível", "Óleo Diesel", "Outras Não Renováveis") ~ "Derivados de Petróleo",
      .default = grupo
    ),
    grupo_en = dplyr::case_when(
      grupo == "Biomassa, Solar e Eólica" ~ "Biomass, Solar and Wind",
      grupo == "Derivados de Petróleo" ~ "Oil Products",
      TRUE ~ grupo_en
    )
  ) |>
  dplyr::group_by(grupo, grupo_en, ano) |>
  dplyr::summarise(total = sum(total), .groups = "drop") |>
  dplyr::mutate(tipo_dado = "Absoluto")

salvar_tab_bd(tab, "grafico_total_geracao_centrais_eletr_servico_pub_por_fonte")

# grafico_total_geracao_centrais_eletr_autoprod_renov_nao_renov

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_5_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_5_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    grupo_nivel_1 == "Geração de Eletricidade - GWh"
  ) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total) |>
  dplyr::group_by(grupo, grupo_en, ano) |>
  dplyr::summarise(total = sum(total), .groups = "drop") |>
  dplyr::mutate(tipo_dado = "Absoluto")

salvar_tab_bd(tab, "grafico_total_geracao_centrais_eletr_autoprod_renov_nao_renov")

# grafico_total_geracao_centrais_eletr_autoprod_por_fonte

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_5_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_menor)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_5_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    grupo_nivel_1 == "Geração de Eletricidade - GWh"
  ) |>
  dplyr::select(grupo = grupo_nivel_menor, grupo_en, ano, total) |>
  dplyr::mutate(
    grupo = dplyr::case_when(
      grupo %in% c("Lenha", "Bagaço de Cana", "Lixívia", "Biodiesel", "Outras Renováveis") ~ "Biomassa",
      grupo %in% c("Óleo Combustível", "Óleo Diesel", "Outras Não Renováveis", "Outras Secundárias") ~ "Derivados de Petróleo",
      grupo %in% c("Carvão Vapor", "Gás de Coqueria") ~ "Carvão e Derivados",
      grupo %in% c("Solar", "Eólica") ~ "Solar e Eólica",
      .default = grupo
    ),
    grupo_en = dplyr::case_when(
      grupo == "Biomassa" ~ "Biomass",
      grupo == "Derivados de Petróleo" ~ "Oil Products",
      grupo == "Carvão e Derivados" ~ "Coal and derivatives",
      grupo == "Solar e Eólica" ~ "Solar and Wind",
      TRUE ~ grupo_en
    )
  ) |>
  dplyr::group_by(grupo, grupo_en, ano) |>
  dplyr::summarise(total = sum(total), .groups = "drop") |>
  dplyr::mutate(tipo_dado = "Absoluto")

salvar_tab_bd(tab, "grafico_total_geracao_centrais_eletr_autoprod_por_fonte")

# grafico_autoprod_nao_injetada_renov_nao_renov

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_5_a_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_2)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_5_a_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    grupo_nivel_1 == "Geração de Eletricidade - GWh"
  ) |>
  dplyr::select(grupo = grupo_nivel_2, grupo_en, ano, total) |>
  dplyr::group_by(grupo, grupo_en, ano) |>
  dplyr::summarise(total = sum(total), .groups = "drop") |>
  dplyr::mutate(tipo_dado = "Absoluto")

salvar_tab_bd(tab, "grafico_autoprod_nao_injetada_renov_nao_renov")

# grafico_autoprod_nao_injetada_por_fonte

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_5_a_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_menor)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_5_a_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    grupo_nivel_1 == "Geração de Eletricidade - GWh"
  ) |>
  dplyr::select(grupo = grupo_nivel_menor, grupo_en, ano, total) |>
  dplyr::mutate(
    grupo = dplyr::case_when(
      grupo %in% c("Lenha", "Bagaço de Cana", "Lixívia", "Biodiesel", "Outras Renováveis") ~ "Biomassa",
      grupo %in% c("Óleo Combustível", "Óleo Diesel", "Outras Não Renováveis", "Outras Secundárias") ~ "Derivados de Petróleo",
      grupo %in% c("Carvão Vapor", "Gás de Coqueria") ~ "Carvão e Derivados",
      grupo %in% c("Solar", "Eólica") ~ "Solar e Eólica",
      .default = grupo
    ),
    grupo_en = dplyr::case_when(
      grupo == "Biomassa" ~ "Biomass",
      grupo == "Derivados de Petróleo" ~ "Oil Products",
      grupo == "Carvão e Derivados" ~ "Coal and derivatives",
      grupo == "Solar e Eólica" ~ "Solar and Wind",
      TRUE ~ grupo_en
    )
  ) |>
  dplyr::group_by(grupo, grupo_en, ano) |>
  dplyr::summarise(total = sum(total), .groups = "drop") |>
  dplyr::mutate(tipo_dado = "Absoluto")

salvar_tab_bd(tab, "grafico_autoprod_nao_injetada_por_fonte")

# grafico_micro_mini_geracao_dist

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_5_b_traduzido.rds") |>
  dplyr::select(grupo_en = grupo_nivel_menor)
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_5_b_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(
    tipo_dado == "Absoluto",
    ano >= 2015,
    grupo_nivel_1 == "Geração de Eletricidade - GWh"
  ) |>
  dplyr::select(grupo = grupo_nivel_menor, grupo_en, ano, total) |>
  dplyr::mutate(
    grupo = dplyr::case_when(
      grupo != "Solar" ~ "Outros",
      .default = grupo
    ),
    grupo_en = dplyr::case_when(
      grupo != "Solar" ~ "Other",
      .default = grupo_en
    )
  ) |>
  dplyr::group_by(grupo, grupo_en, ano) |>
  dplyr::summarise(total = sum(total), .groups = "drop") |>
  dplyr::mutate(tipo_dado = "Absoluto")

salvar_tab_bd(tab, "grafico_micro_mini_geracao_dist")

# CAPÍTULO 6

# grafico_reservas_provadas_petroleo

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_inicial_tabela_6_2.rds") |>
  dplyr::select(
    ano = grupo,
    y = `Petróleo (10³ m³)`
  )

salvar_tab_bd(tab, "grafico_reservas_provadas_petroleo")

# grafico_reservas_provadas_gas

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_inicial_tabela_6_2.rds") |>
  dplyr::select(
    ano = grupo,
    y = `Gás Natural (10⁶ m³)`
  )

salvar_tab_bd(tab, "grafico_reservas_provadas_gas")

# grafico_potencial_hidreletrico

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_inicial_grafico_6_3.rds") |>
  tidyr::pivot_longer(
    cols = -grupo,
    names_to = "grupo_en",
    values_to = "y"
  ) |>
  dplyr::select(grupo_en)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_inicial_grafico_6_3.rds") |>
  dplyr::rename(
    ano = grupo
  ) |>
  tidyr::pivot_longer(
    cols = -ano,
    names_to = "grupo",
    values_to = "y"
  ) |>
  dplyr::bind_cols(tab_en)

salvar_tab_bd(tab, "grafico_potencial_hidreletrico")

# grafico_reservas_carvao_mineral

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_inicial_tabela_6_4.rds") |>
  dplyr::select(
    ano,
    y = TOTAL
  )

salvar_tab_bd(tab, "grafico_reservas_carvao_mineral")

# grafico_reservas_uranio

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_grafico_6_5_traduzido.rds") |>
  dplyr::select(
    ano = grupo,
    y = `U₃O₈`
  )

salvar_tab_bd(tab, "grafico_reservas_uranio")

# ANEXO 1

# grafico_capacidade_instalada_geracao_eletrica
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_i_1_traduzido.rds") |>
  dplyr::select(grupo_en = setor)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_i_1_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(fontes != "TOTAL", setor != "Total") |>
  dplyr::group_by(ano, grupo = setor, grupo_en) |>
  dplyr::summarise(total = sum(valor), .groups = "drop")

salvar_tab_bd(tab, "grafico_capacidade_instalada_geracao_eletrica")

# grafico_capacidade_instalada_refino_petroleo

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_inicial_anexo_i_3.rds") |>
  dplyr::rename(valor = `m³/dia (day)`, ano = grupo)

salvar_tab_bd(tab, "grafico_capacidade_instalada_refino_petroleo")

# ANEXO 3

# grafico_comp_oferta_energia_fonte

tab <- readr::read_rds("./data-raw/rds/pt/dados_grafico_anexo_iii_1.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_grafico_anexo_iii_1.rds") |>
  dplyr::select(variavel_en = variavel)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-ano_max, -ano_penultimo) |>
  dplyr::mutate(ano = as.character(ano))

salvar_tab_bd(tab, "grafico_comp_oferta_energia_fonte")

# grafico_oferta_interna_energia_regiao
tab <- readr::read_rds("./data-raw/rds/pt/dados_grafico_anexo_iii_2.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_grafico_anexo_iii_2.rds") |>
  dplyr::select(variavel_en = variavel)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-ano_max, -ano_penultimo) |>
  dplyr::mutate(ano = as.character(ano))

salvar_tab_bd(tab, "grafico_oferta_interna_energia_regiao")

# grafico_consumo_final_energia_fonte
tab <- readr::read_rds("./data-raw/rds/pt/dados_grafico_anexo_iii_3.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_grafico_anexo_iii_3.rds") |>
  dplyr::select(variavel_en = variavel)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-ano_max, -ano_penultimo) |>
  dplyr::mutate(ano = as.character(ano))

salvar_tab_bd(tab, "grafico_consumo_final_energia_fonte")

# grafico_consumo_setorial_derivados_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/dados_grafico_anexo_iii_4.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_grafico_anexo_iii_4.rds") |>
  dplyr::select(variavel_en = variavel)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-ano_max, -ano_penultimo) |>
  dplyr::mutate(ano = as.character(ano))

salvar_tab_bd(tab, "grafico_consumo_setorial_derivados_petroleo")

# grafico_consumo_setorial_eletricidade
tab <- readr::read_rds("./data-raw/rds/pt/dados_grafico_anexo_iii_5.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_grafico_anexo_iii_5.rds") |>
  dplyr::select(variavel_en = variavel)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-ano_max, -ano_penultimo) |>
  dplyr::mutate(ano = as.character(ano))

salvar_tab_bd(tab, "grafico_consumo_setorial_eletricidade")

# grafico_consumo_setorial_gas_natural
tab <- readr::read_rds("./data-raw/rds/pt/dados_grafico_anexo_iii_6.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_grafico_anexo_iii_6.rds") |>
  dplyr::select(variavel_en = variavel)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-ano_max, -ano_penultimo) |>
  dplyr::mutate(ano = as.character(ano))

salvar_tab_bd(tab, "grafico_consumo_setorial_gas_natural")

# grafico_consumo_setorial_carvao_vapor
tab <- readr::read_rds("./data-raw/rds/pt/dados_grafico_anexo_iii_7.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_grafico_anexo_iii_7.rds") |>
  dplyr::select(variavel_en = variavel)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-ano_max, -ano_penultimo) |>
  dplyr::mutate(ano = as.character(ano))

salvar_tab_bd(tab, "grafico_consumo_setorial_carvao_vapor")

# grafico_producao_energia_eletrica_fonte
tab <- readr::read_rds("./data-raw/rds/pt/dados_grafico_anexo_iii_8.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_grafico_anexo_iii_8.rds") |>
  dplyr::select(variavel_en = variavel)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-ano_max, -ano_penultimo) |>
  dplyr::mutate(ano = as.character(ano))

salvar_tab_bd(tab, "grafico_producao_energia_eletrica_fonte")

# grafico_geracao_hidreletrica_regiao
tab <- readr::read_rds("./data-raw/rds/pt/dados_grafico_anexo_iii_9.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_grafico_anexo_iii_9.rds") |>
  dplyr::select(variavel_en = variavel)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-ano_max, -ano_penultimo) |>
  dplyr::mutate(ano = as.character(ano))

salvar_tab_bd(tab, "grafico_geracao_hidreletrica_regiao")

# ANEXO IV

# grafico_variacao_energia_final_util_potencial
con <- DBI::dbConnect(
  RSQLite::SQLite(),
  "./data-raw/codigo_original/banco_balanco_energetico/Balanco_Energetico_testando_v07.sqlite"
)

tab <- dplyr::tbl(con, "AnexoIV") |>
  dplyr::collect() |>
  dplyr::filter(tabela == "Tab Graf") |>
  dplyr::select(variavel = segmento_nivel_1, ano, valor) |>
  dplyr::filter(!stringr::str_detect(variavel, "Energia Final")) |>
  dplyr::mutate(
    ano = as.numeric(ano),
    variavel = stringr::str_trim(variavel),
    variavel_en = dplyr::case_when(
      variavel == "Energia Útil" ~ "Usable Energy",
      variavel == "Potencial de Economia de Energia" ~ "Energy Saving Potential",
      variavel == "Energia não Recuperável" ~ "Non-Recoverable Energy",
      TRUE ~ NA_character_
    ),
    variavel = forcats::fct(
      variavel,
      levels = c(
        "Potencial de Economia de Energia",
        "Energia não Recuperável",
        "Energia Útil"
      )
    )
  ) |>
  dplyr::arrange(variavel) |>
  dplyr::mutate(variavel_en = forcats::fct(variavel_en))

salvar_tab_bd(tab, "grafico_variacao_energia_final_util_potencial")

DBI::dbDisconnect(con)

# Tabelas ---------------------------------------------------------------------

# CAPÍTULO 1

# tab_producao_energia_primaria
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_2_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)
tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_producao_energia_primaria")

# tab_oferta_interna_energia
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_3_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_3_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)
tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_oferta_interna_energia")

# tab_consumo_final_fonte
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_4_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_4_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )
tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_consumo_final_fonte")

# tab_consumo_final_setor
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_5_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_5_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )
tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_consumo_final_setor")

# tab_consumo_final_energetico_fonte
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_6_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_6_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_consumo_final_energetico_fonte")

# tab_consumo_final_nao_energetico_fonte
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_7_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_7_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_consumo_final_nao_energetico_fonte")

# tab_dependencia_externa_energia
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_8_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_8_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_dependencia_externa_energia")

# tab_composicao_setorial_consumo_derivados_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_9_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_9_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_composicao_setorial_consumo_derivados_petroleo")

# tab_composicao_setorial_consumo_eletricidade
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_10_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_10_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_composicao_setorial_consumo_eletricidade")

# tab_composicao_setorial_consumo_carvao_vapor
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_11_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_11_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_composicao_setorial_consumo_carvao_vapor")

# tab_composicao_setorial_consumo_final_biomassa
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_12_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_12_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_composicao_setorial_consumo_final_biomassa")

# tab_oferta_interna_energia_2
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_1_13_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_1_13_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_oferta_interna_energia_2")

# CAPÍTULO 2


# tab_total_fontes_primarias

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_1_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_1_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_total_fontes_primarias")

# tab_petroleo

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_2_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_petroleo")

# tab_gas_natural

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_3_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_3_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_gas_natural")

# tab_carvao_vapor

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_4_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_4_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_carvao_vapor")

# tab_carvao_metalurgico

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_5_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_5_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_carvao_metalurgico")

# tab_energia_hidraulica

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_6_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_6_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_energia_hidraulica")

# tab_energia_eolica

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_7_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_7_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_energia_eolica")

# tab_energia_solar_fotovoltaica

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_8_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_8_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_energia_solar_fotovoltaica")

# tab_energia_solar_termica

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_9_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_9_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_energia_solar_termica")

# tab_uranio
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_10_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_10_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_uranio")


# tab_lenha
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_11_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_11_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_lenha")

# tab_caldo_cana
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_12_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_12_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_caldo_cana")

# tab_melaco
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_13_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_13_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_melaco")

# tab_bagaco_cana
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_14_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_14_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_bagaco_cana")

# tab_lixivia
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_15_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_15_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_lixivia")

# tab_outras_fontes_primarias
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_16_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_16_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_outras_fontes_primarias")

# tab_total_fontes_secundarias
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_17_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_17_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_total_fontes_secundarias")

# tab_derivados_petroleo_e_gas_natural
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_18_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_18_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_derivados_petroleo_e_gas_natural")

# tab_oleo_diesel_total
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_19_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_19_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_oleo_diesel_total")

# tab_diesel_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_20_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_20_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_diesel_petroleo")

# tab_biodiesel
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_21_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_21_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_biodiesel")

# tab_oleo_combustivel
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_22_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_22_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_oleo_combustivel")

# tab_gasolina
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_23_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_23_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_gasolina")

# tab_gas_liquefeito_de_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_24_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_24_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_gas_liquefeito_de_petroleo")

# tab_nafta
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_25_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_25_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_nafta")

# tab_coque_carvao_mineral
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_26_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_26_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_coque_carvao_mineral")

# tab_querosene
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_27_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_27_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_querosene")

# tab_gas_cidade
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_28_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_28_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_gas_cidade")

# tab_gas_coqueira
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_29_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_29_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_gas_coqueira")

# tab_eletricidade
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_30_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_30_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_eletricidade")

# tab_carvao_vegetal
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_31_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_31_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_carvao_vegetal")

# tab_alcool_etilico_total
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_32_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_32_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_alcool_etilico_total")

# tab_alcool_anidro
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_33_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_33_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_alcool_anidro")

# tab_alcool_hidratado
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_34_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_34_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_alcool_hidratado")

# tab_outras_secundarias_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_35_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_35_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_outras_secundarias_petroleo")

# tab_alcatrao
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_36_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_36_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_4_en = grupo_nivel_4,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_alcatrao")

# tab_produtos_nao_energeticos_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_2_37_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_2_37_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_produtos_nao_energeticos_petroleo")

# CAPÍTULO 3

# tab_setor_energetico
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_1_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_1_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_setor_energetico")

# tab_setor_comercial
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_2_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_setor_comercial")

# tab_setor_publico
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_3_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_3_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_setor_publico")

# tab_setor_residencial
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_4_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_4_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_setor_residencial")

# tab_setor_agropecuario
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_5_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_5_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_setor_agropecuario")

# tab_setor_transportes_geral
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_6_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_6_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_setor_transportes_geral")

# tab_setor_transportes_segmento
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_6_por_segmento_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_6_por_segmento_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_setor_transportes_segmento")

# tab_setor_industrial_geral
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_7_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_7_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_setor_industrial_geral")

# tab_setor_industrial_segmento
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_3_7_por_setor_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_3_7_por_setor_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_setor_industrial_segmento")

# CAPÍTULO 4

# tab_dependencia_externa_energia_2
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_4_1_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_4_1_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-verifica_percentual) |>
  dplyr::mutate(tipo_dado = "Absoluto")
salvar_tab_bd(tab, "tab_dependencia_externa_energia_2")

# tab_dependencia_externa_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_4_2_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_4_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_dependencia_externa_petroleo")

# tab_importacoes_energia
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_4_3_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_4_3_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "tab_importacoes_energia")

# tab_exportacoes_energia
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_4_4_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_4_4_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_exportacoes_energia")

# tab_exportacoes_importacoes_liquidas
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_4_5_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_4_5_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_exportacoes_importacoes_liquidas")

# CAPÍTULO 5

# tab_refinarias_petroleo

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_1_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_1_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-verifica_percentual) |>
  dplyr::mutate(tipo_dado = "Absoluto")

salvar_tab_bd(tab, "tab_refinarias_petroleo")

# tab_unidades_processamento_gas_natural

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_2_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-verifica_percentual) |>
  dplyr::mutate(tipo_dado = "Absoluto")

salvar_tab_bd(tab, "tab_unidades_processamento_gas_natural")

# tab_centrais_eletricas_total

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_3_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_3_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_centrais_eletricas_total")

# tab_centrais_eletricas_servico_publico

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_4_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_4_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_centrais_eletricas_servico_publico")

# tab_centrais_eletricas_autoprodutoras

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_5_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_5_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_centrais_eletricas_autoprodutoras")

# tab_autoproducao_nao_injetada_rede

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_5_a_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_5_a_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_autoproducao_nao_injetada_rede")

# tab_micro_mini_geracao_distribuida

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_5_b_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_5_b_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_micro_mini_geracao_distribuida")

# tab_coqueiras

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_6_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_6_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_coqueiras")

# tab_destilarias

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_7_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_7_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_destilarias")

# tab_plantas_biodiesel

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_8_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_8_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_plantas_biodiesel")

# tab_ciclo_combustivel_nuclear

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_9_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_9_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_ciclo_combustivel_nuclear")

# tab_carvoarias

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_10_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_10_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_carvoarias")

# tab_usinas_gaseificacao

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_5_11_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_5_11_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_usinas_gaseificacao")

# CAPÍTULO 6

# tab_recursos_reservas_energeticas_brasileiras_1

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_final_tabela_6_1.rds")
salvar_tab_bd(tab, "tab_recursos_reservas_energeticas_brasileiras_1_pt")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_final_tabela_6_1.rds")
salvar_tab_bd(tab, "tab_recursos_reservas_energeticas_brasileiras_1_en")

# tab_recursos_reservas_energeticas_brasileiras_2

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_final_tabela_6_1_a.rds")
salvar_tab_bd(tab, "tab_recursos_reservas_energeticas_brasileiras_2_pt")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_final_tabela_6_1_a.rds")
salvar_tab_bd(tab, "tab_recursos_reservas_energeticas_brasileiras_2_en")

# tab_reservas_provadas_petroleo_gas

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_inicial_tabela_6_2.rds") |>
  dplyr::rename(Ano = grupo)
salvar_tab_bd(tab, "tab_reservas_provadas_petroleo_gas_pt")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_inicial_tabela_6_2.rds") |>
  dplyr::rename(Year = grupo)
salvar_tab_bd(tab, "tab_reservas_provadas_petroleo_gas_en")

# tab_recursos_hidraulicos

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_inicial_tabela_6_3.rds") |>
  dplyr::rename(Ano = grupo)
salvar_tab_bd(tab, "tab_recursos_hidraulicos_pt")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_inicial_tabela_6_3.rds") |>
  dplyr::rename(Year = grupo)
salvar_tab_bd(tab, "tab_recursos_hidraulicos_en")

# tab_reservas_carvao_mineral_turfa

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_inicial_tabela_6_4.rds")
salvar_tab_bd(tab, "tab_reservas_carvao_mineral_turfa_pt")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_inicial_tabela_6_4.rds")
salvar_tab_bd(tab, "tab_reservas_carvao_mineral_turfa_en")

# tab_reservas_uranio

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_6_5_traduzido.rds") |>
  dplyr::rename(Ano = grupo)
salvar_tab_bd(tab, "tab_reservas_uranio_pt")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_6_5_traduzido.rds") |>
  dplyr::rename(Year = grupo)
salvar_tab_bd(tab, "tab_reservas_uranio_en")

# CAPÍTULO 7

# tab_oferta_interna_energia_pib_populacao

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_7_1_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_7_1_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- tab |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    total = dplyr::case_when(
      grupo %in% c(
        "Oferta Interna de Energia - OIE",
        "Produto Interno Bruto - PIB",
        "População Residente - POP",
        "OIE/PIB",
        "OIE/POP"
      ) ~ scales::number(total, accuracy = 0.1, decimal.mark = ",", big.mark = "."),
      grupo %in% c(
        "Oferta Int. Energia Elétrica- OIEE",
        "OIEE/POP"
      ) ~ scales::number(total, accuracy = 1, decimal.mark = ",", big.mark = ".")
    )
  ) |>
  dplyr::select(-verifica_percentual)

salvar_tab_bd(tab, "tab_oferta_interna_energia_pib_populacao")

# tab_oferta_interna_energeticos_pib

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_7_2_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_7_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "tab_oferta_interna_energeticos_pib")

# tab_consumo_final_energetico

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_7_3_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1,
    grupo_nivel_2,
    grupo_nivel_menor = grupo_nivel_3,
    ano,
    total
  )
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_7_3_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_3
  )

tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "tab_consumo_final_energetico")

# tab_produto_interno_bruto_setorial

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_7_4_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1,
    grupo_nivel_2,
    grupo_nivel_menor = grupo_nivel_3,
    ano,
    total
  )
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_7_4_traduzido.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_menor_en = grupo_nivel_3
  )

tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "tab_produto_interno_bruto_setorial")

# tab_consumo_final_energia_setor_pib_setor

tab <- readr::read_rds("./data-raw/rds/pt/dados_tabela_7_5.rds") |>
  dplyr::rename(
    grupo = grupo_nivel_menor
  )
tab_en <- readr::read_rds("./data-raw/rds/en/dados_tabela_7_5.rds") |>
  dplyr::select(
    grupo_en = grupo_nivel_menor
  )

tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "tab_consumo_final_energia_setor_pib_setor")

# tab_setor_residencial_energia_populacao

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_7_6_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_7_6_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_setor_residencial_energia_populacao")

# tab_setor_transportes_energia_pib_setor

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_7_7_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_7_7_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_setor_transportes_energia_pib_setor")

# tab_consumo_especifico_energia_setores_selecionados

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_7_8_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_7_8_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_consumo_especifico_energia_setores_selecionados")

# tab_precos_medios_correntes_fontes_energia_1

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_7_9_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_7_9_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |>
  dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_precos_medios_correntes_fontes_energia_1")

# tab_precos_medios_correntes_fontes_energia_2

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_7_10_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_7_10_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "tab_precos_medios_correntes_fontes_energia_2")

# tab_relacoes_precos_fontes_energia

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_7_11_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_7_11_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en)
salvar_tab_bd(tab, "tab_relacoes_precos_fontes_energia")

# tab_gastos_divisas_importacao_petroleo

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_7_12_traduzido.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_7_12_traduzido.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en) |> dplyr::select(-verifica_percentual)
salvar_tab_bd(tab, "tab_gastos_divisas_importacao_petroleo")

# CAPÍTULO 8

# tab_producao_energia_fosseis_1
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_1_a_traduzido.rds") |>
  dplyr::select(grupo_en = uf_nivel_2, macro_grupo_en = uf_nivel_1, setor_en = setor, unidade_en = unidade)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_1_a_traduzido.rds") |>
  dplyr::rename(
    grupo = uf_nivel_2,
    macro_grupo = uf_nivel_1,
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(tipo_dado == "Absoluto") |>
  dplyr::mutate(
    setor = glue::glue("{setor} ({unidade})"),
    setor_en = glue::glue("{setor_en} ({unidade_en})")
  ) |>
  dplyr::select(
    setor,
    setor_en,
    macro_grupo,
    macro_grupo_en,
    grupo,
    grupo_en,
    ano,
    valor
  )

salvar_tab_bd(tab, "tab_producao_energia_fosseis_1")

# tab_producao_energia_fosseis_2
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_1_b_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, setor_en = setor, unidade_en = unidade)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_1_b_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    setor = glue::glue("{setor} ({unidade})"),
    setor_en = glue::glue("{setor_en} ({unidade_en})")
  ) |>
  dplyr::select(-verifica_percentual, unidade, -unidade_en)

salvar_tab_bd(tab, "tab_producao_energia_fosseis_2")

# tab_producao_energia_eletricidade_alcool_1
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_1_c_traduzido.rds") |>
  dplyr::select(grupo_en = uf_nivel_2, macro_grupo_en = uf_nivel_1, setor_en = setor, unidade_en = unidade)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_1_c_traduzido.rds") |>
  dplyr::rename(
    grupo = uf_nivel_2,
    macro_grupo = uf_nivel_1,
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(tipo_dado == "Absoluto") |>
  dplyr::mutate(
    setor = glue::glue("{setor} ({unidade})"),
    setor_en = glue::glue("{setor_en} ({unidade_en})")
  ) |>
  dplyr::select(
    setor,
    setor_en,
    macro_grupo,
    macro_grupo_en,
    grupo,
    grupo_en,
    ano,
    valor
  )

salvar_tab_bd(tab, "tab_producao_energia_eletricidade_alcool_1")

# tab_producao_energia_eletricidade_alcool_2
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_1_d_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, setor_en = setor, unidade_en = unidade)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_1_d_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    setor = glue::glue("{setor} ({unidade})"),
    setor_en = glue::glue("{setor_en} ({unidade_en})")
  ) |>
  dplyr::select(-verifica_percentual, unidade, -unidade_en)

salvar_tab_bd(tab, "tab_producao_energia_eletricidade_alcool_2")

# tab_geracao_eletricidade_por_fonte
tab_en <- readr::read_rds("./data-raw/rds/en/organiza_tratamento_tabela_8_1_e.rds") |>
  tidyr::pivot_longer(
    cols = -c(grupo, macro_grupo, ano),
    names_to = "fonte_en",
    values_to = "valor"
  ) |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo, fonte_en)

tab <- readr::read_rds("./data-raw/rds/pt/organiza_tratamento_tabela_8_1_e.rds") |>
  tidyr::pivot_longer(
    cols = -c(grupo, macro_grupo, ano),
    names_to = "fonte",
    values_to = "valor"
  ) |>
  dplyr::bind_cols(tab_en)

salvar_tab_bd(tab, "tab_geracao_eletricidade_por_fonte")

# tab_consumo_residencial_eletricidade
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_2_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_2_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(-verifica_percentual)

salvar_tab_bd(tab, "tab_consumo_residencial_eletricidade")


# tab_consumo_residencial_gas_liquefeito_petroleo
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_3_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_3_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(-verifica_percentual)

salvar_tab_bd(tab, "tab_consumo_residencial_gas_liquefeito_petroleo")

# tab_capacidade_instalada_geracao_energia
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_4_traduzido.rds") |>
  dplyr::select(grupo_en = uf_nivel_2, macro_grupo_en = uf_nivel_1, fonte_en = fontes, classificacao_en = tipo_classificacao)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_4_traduzido.rds") |>
  dplyr::rename(
    grupo = uf_nivel_2,
    macro_grupo = uf_nivel_1,
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(
    fonte = fontes,
    classificacao = tipo_classificacao,
    fonte_en,
    macro_grupo,
    macro_grupo_en,
    grupo,
    grupo_en,
    tipo_dado,
    valor
  )

salvar_tab_bd(tab, "tab_capacidade_instalada_geracao_energia")

# tab_capacidade_instalada_mini_micro_geracao_distribuida_1

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_4_b_traduzido.rds") |>
  dplyr::select(grupo_en = grupo, macro_grupo_en = macro_grupo, classificacao_en = tipo_classificacao)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_4_b_traduzido.rds") |>
  dplyr::rename(
    classificacao = tipo_classificacao,
  ) |>
  dplyr::bind_cols(tab_en)

salvar_tab_bd(tab, "tab_capacidade_instalada_mini_micro_geracao_distribuida_1")

# tab_capacidade_instalada_mini_micro_geracao_distribuida_2

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_4_c_traduzido.rds") |>
  dplyr::select(grupo_en = uf_nivel_1, fonte_en = fontes, classificacao_en = tipo_classificacao)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_4_c_traduzido.rds") |>
  dplyr::rename(
    grupo = uf_nivel_1,
    fonte = fontes,
    classificacao = tipo_classificacao
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    classificacao = forcats::fct(
      classificacao,
      levels = c("SP", "APE", "TOTAL")
    ),
    fonte = forcats::fct(
      fonte,
      levels = c("Hidro", "Termo", "Eólica", "Solar", "Total")
    ),
    grupo = forcats::fct(
      grupo,
      levels = c("Norte", "Nordeste", "Sudeste", "Sul", "Centro-Oeste")
    )
  ) |>
  dplyr::group_by(grupo, grupo_en, fonte, fonte_en, classificacao, classificacao_en) |>
  dplyr::summarise(valor = sum(valor), .groups = "drop") |>
  dplyr::select(
    fonte,
    classificacao,
    classificacao_en,
    fonte_en,
    grupo,
    grupo_en,
    valor
  )

salvar_tab_bd(tab, "tab_capacidade_instalada_mini_micro_geracao_distribuida_2")

# tab_capacidade_instalada_autoprodutores_setor_economico

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_5_a_traduzido.rds") |>
  dplyr::select(grupo_en = uf_nivel_2, macro_grupo_en = uf_nivel_1, fonte_en = fontes)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_5_a_traduzido.rds") |>
  dplyr::rename(
    grupo = uf_nivel_2,
    macro_grupo = uf_nivel_1
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(macro_grupo != "BRASIL") |>
  dplyr::select(
    setor,
    fonte = fontes,
    fonte_en,
    macro_grupo,
    macro_grupo_en,
    grupo,
    grupo_en,
    tipo_dado,
    valor
  )

salvar_tab_bd(tab, "tab_capacidade_instalada_autoprodutores_setor_economico")

# tab_capacidade_instalada_autoprodutores_segmento_industrial

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_5_b_traduzido.rds") |>
  dplyr::select(grupo_en = uf_nivel_2, macro_grupo_en = uf_nivel_1, fonte_en = fontes)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_5_b_traduzido.rds") |>
  dplyr::rename(
    grupo = uf_nivel_2,
    macro_grupo = uf_nivel_1
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(
    setor,
    fonte = fontes,
    fonte_en,
    macro_grupo,
    macro_grupo_en,
    grupo,
    grupo_en,
    tipo_dado,
    valor
  )

salvar_tab_bd(tab, "tab_capacidade_instalada_autoprodutores_segmento_industrial")

# tab_capacidade_instalada_1

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_6_traduzido.rds") |>
  dplyr::select(grupo_en = uf_nivel_2, macro_grupo_en = uf_nivel_1, setor_en = setor, unidade_en = unidade)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_6_traduzido.rds") |>
  dplyr::rename(
    grupo = uf_nivel_2,
    macro_grupo = uf_nivel_1
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(
    setor,
    setor_en,
    macro_grupo,
    macro_grupo_en,
    grupo,
    grupo_en,
    unidade,
    unidade_en,
    valor
  )

salvar_tab_bd(tab, "tab_capacidade_instalada_1")

# tab_capacidade_instalada_2

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_6_traduzido.rds") |>
  dplyr::select(grupo_en = uf_nivel_1, setor_en = setor)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_6_traduzido.rds") |>
  dplyr::rename(
    grupo = uf_nivel_1
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(grupo != "Brasil", unidade != "10³ b/d") |>
  dplyr::mutate(
    grupo = forcats::fct(
      grupo,
      levels = c("Norte", "Nordeste", "Sudeste", "Sul", "Centro-Oeste")
    ),
    setor = forcats::fct(
      setor,
      levels = c(
        "Refino de Petróleo",
        "Plantas de Gás Natural"
      )
    )
  ) |>
  dplyr::group_by(grupo, grupo_en, setor, setor_en) |>
  dplyr::summarise(valor = sum(valor), .groups = "drop") |>
  dplyr::group_by(setor, setor_en) |>
  dplyr::mutate(
    valor = valor / sum(valor)
  ) |>
  dplyr::ungroup()

salvar_tab_bd(tab, "tab_capacidade_instalada_2")

# tab_reservas_provadas_potencial_hidraulico_1

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_7_traduzido.rds") |>
  dplyr::select(grupo_en = uf_nivel_2, setor_en = setor, info_en = info_secundaria)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_7_traduzido.rds") |>
  dplyr::rename(
    grupo = uf_nivel_2,
    info = info_secundaria
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(
    grupo,
    grupo_en,
    setor,
    setor_en,
    info,
    info_en,
    valor
  )

salvar_tab_bd(tab, "tab_reservas_provadas_potencial_hidraulico_1")

# tab_reservas_provadas_potencial_hidraulico_2

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_8_7_traduzido.rds") |>
  dplyr::select(grupo_en = uf_nivel_1, setor_en = setor)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_8_7_traduzido.rds") |>
  dplyr::rename(
    grupo = uf_nivel_1
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::filter(info_secundaria %in% c("10⁶m³", "Total "), grupo != "Brasil ") |>
  dplyr::mutate(
    grupo = forcats::fct(
      grupo,
      levels = c("Norte", "Nordeste", "Sudeste", "Sul", "Centro-Oeste")
    ),
    setor = ifelse(setor == "Potencial Hidráulico  MW", "Potencial Hidráulico Total", setor),
    setor_en = ifelse(setor == "Hydraulic Potential - MW", "Hydraulic Potential", setor),
    setor = forcats::fct(
      setor,
      levels = c(
        "Petróleo",
        "Gás Natural",
        "Potencial Hidráulico Total"
      )
    )
  ) |>
  dplyr::group_by(grupo, grupo_en, setor, setor_en) |>
  dplyr::summarise(valor = sum(valor), .groups = "drop") |>
  dplyr::group_by(setor, setor_en) |>
  dplyr::mutate(
    valor = valor / sum(valor)
  ) |>
  dplyr::select(
    grupo,
    grupo_en,
    setor,
    setor_en,
    valor
  )

salvar_tab_bd(tab, "tab_reservas_provadas_potencial_hidraulico_2")

# ANEXO 1

# tab_capacidade_instalada_geracao_eletrica
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_i_1_traduzido.rds") |>
  dplyr::select(setor_en = setor, fonte_en = fontes)

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_i_1_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(
    ano,
    setor,
    setor_en,
    fonte = fontes,
    fonte_en,
    valor
  )

salvar_tab_bd(tab, "tab_capacidade_instalada_geracao_eletrica")


# tab_capacidade_instalada_itaipu
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_resumo_tabela_anexo_i_1_1.rds") |>
  dplyr::rename(valor = `MW`)
salvar_tab_bd(tab, "tab_capacidade_instalada_itaipu")


# tab_capacidade_instalada_geracao_energia_fonte
tab_en <- readr::read_rds("./data-raw/rds/en/dados_tabela_anexo_i_2.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- readr::read_rds("./data-raw/rds/pt/dados_tabela_anexo_i_2.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(-verifica_percentual)

salvar_tab_bd(tab, "tab_capacidade_instalada_geracao_energia_fonte")

# tab_capacidade_instalada_mini_micro_gd
tab_en <- readr::read_rds("./data-raw/rds/en/dados_tabela_anexo_i_2_b.rds") |>
  dplyr::select(
    grupo_nivel_1_en = grupo_nivel_1,
    grupo_nivel_2_en = grupo_nivel_2,
    grupo_nivel_3_en = grupo_nivel_3,
    grupo_nivel_menor_en = grupo_nivel_menor
  )

tab <- readr::read_rds("./data-raw/rds/pt/dados_tabela_anexo_i_2_b.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(-verifica_percentual)

salvar_tab_bd(tab, "tab_capacidade_instalada_mini_micro_gd")

# tab_capacidade_instalada_refino_petroleo
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_resumo_tabela_anexo_i_3.rds") |>
  dplyr::rename(valor = `m³/dia (day)`)
salvar_tab_bd(tab, "tab_capacidade_instalada_refino_petroleo")


# tab_capacidade_instalada_producao_biodiesel
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_inicial_anexo_i_4.rds") |>
  dplyr::rename(valor = `b/dia (day)`)
salvar_tab_bd(tab, "tab_capacidade_instalada_producao_biodiesel")

# ANEXO 2

# tab_autoproducao_eletrecidade_setor_fonte
tab <- readr::read_rds("./data-raw/rds/pt/dados_para_tabela_download_anexo_ii_1.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_para_tabela_download_anexo_ii_1.rds") |>
  dplyr::select(
    setor_nivel_1_en = setor_nivel_1,
    setor_nivel_2_en = setor_nivel_2
  )

tab <- tab |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(
    -ano
  )

salvar_tab_bd(tab, "tab_autoproducao_eletrecidade_setor_fonte")

# tab_autoproducao_eletrecidade_setor_fonte_total
tab <- readr::read_rds("./data-raw/rds/pt/dados_para_tabela_download_anexo_ii_1.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_para_tabela_download_anexo_ii_1.rds") |>
  dplyr::select(
    setor_nivel_1_en = setor_nivel_1,
    setor_nivel_2_en = setor_nivel_2
  )

tab <- tab |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(
    -ano
  ) |>
  dplyr::mutate(
    setor_nivel_1 = forcats::fct(setor_nivel_1),
    setor_nivel_2 = forcats::fct(setor_nivel_2)
  ) |>
  dplyr::group_by(setor_nivel_1, setor_nivel_1_en, setor_nivel_2, setor_nivel_2_en) |>
  dplyr::summarise(
    total = sum(valor),
    .groups = "drop"
  )

salvar_tab_bd(tab, "tab_autoproducao_eletrecidade_setor_fonte_total")

# ANEXO IV

# tab_evolucao_rendimentos_energeticos_setores
tab <- readr::read_rds("./data-raw/rds/pt/organiza_tratamento_tabela_anexo_iv_1.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/organiza_tratamento_tabela_anexo_iv_1.rds") |>
  dplyr::select(grupo_en = grupo)

tab <- cbind(tab, tab_en)

salvar_tab_bd(tab, "tab_evolucao_rendimentos_energeticos_setores")

# tab_evolucao_rendimentos_energeticos_setores_efeitos
tab_en <- readr::read_rds("./data-raw/rds/en/dataframe_completo_anexo_iv_2.rds") |>
  dplyr::select(grupo_en = grupo, info_en = cabecalho_nivel_1)

tab <- readr::read_rds("./data-raw/rds/pt/dataframe_completo_anexo_iv_2.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo, grupo_en, ano, info = cabecalho_nivel_1, info_en, total) |>
  dplyr::filter(!(grupo == "Global" & is.na(total)))

salvar_tab_bd(tab, "tab_evolucao_rendimentos_energeticos_setores_efeitos")

# tab_variacao_rendimentos_energeticos_participacao
tab_en <- readr::read_rds("./data-raw/rds/en/dataframe_completo_anexo_iv_3.rds") |>
  dplyr::select(grupo_en = grupo, info_en = cabecalho_nivel_1)

tab <- readr::read_rds("./data-raw/rds/pt/dataframe_completo_anexo_iv_3.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(grupo, grupo_en, ano, info = cabecalho_nivel_1, info_en, total) |>
  dplyr::filter(!(grupo == "Global" & is.na(total)))

salvar_tab_bd(tab, "tab_variacao_rendimentos_energeticos_participacao")

# ANEXO V

# tab_conceituacao_energia_primaria
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_final_anexo_V_2_1.rds")
salvar_tab_bd(tab, "tab_conceituacao_energia_primaria")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_final_anexo_V_2_1.rds")
salvar_tab_bd(tab, "tab_conceituacao_energia_primaria_en")

# tab_conceituacao_energia_secundaria

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_final_anexo_V_2_2.rds")
salvar_tab_bd(tab, "tab_conceituacao_energia_secundaria")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_final_anexo_V_2_2.rds")
salvar_tab_bd(tab, "tab_conceituacao_energia_secundaria_en")

# tab_conceituacao_total_geral

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_final_anexo_V_2_3.rds")
salvar_tab_bd(tab, "tab_conceituacao_total_geral")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_final_anexo_V_2_3.rds")
salvar_tab_bd(tab, "tab_conceituacao_total_geral_en")

# tab_conceituacao_oferta

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_final_anexo_V_2_4.rds")
salvar_tab_bd(tab, "tab_conceituacao_oferta")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_final_anexo_V_2_4.rds")
salvar_tab_bd(tab, "tab_conceituacao_oferta_en")

# tab_conceituacao_transformacao

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_final_anexo_V_2_5.rds")
salvar_tab_bd(tab, "tab_conceituacao_transformacao")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_final_anexo_V_2_5.rds")
salvar_tab_bd(tab, "tab_conceituacao_transformacao_en")

# tab_conceituacao_perdas

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_final_anexo_V_2_6.rds")
salvar_tab_bd(tab, "tab_conceituacao_perdas")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_final_anexo_V_2_6.rds")
salvar_tab_bd(tab, "tab_conceituacao_perdas_en")

# tab_conceituacao_consumo_final

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_final_anexo_V_2_7.rds")
salvar_tab_bd(tab, "tab_conceituacao_consumo_final")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_final_anexo_V_2_7.rds")
salvar_tab_bd(tab, "tab_conceituacao_consumo_final_en")

# tab_conceituacao_ajustes_estatisticos

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_final_anexo_V_2_8.rds")
salvar_tab_bd(tab, "tab_conceituacao_ajustes_estatisticos")

tab <- readr::read_rds("./data-raw/rds/en/tratamento_final_anexo_V_2_8.rds")
salvar_tab_bd(tab, "tab_conceituacao_ajustes_estatisticos_en")

# ANEXO VI

# tab_fatores_capacidade_diferentes_fontes
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_vi_1_traduzida.rds") |>
  dplyr::select(fonte = Fonte, fc = FC)

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_vi_1_traduzida.rds") |>
  dplyr::select(fonte_en = Source)

tab <- cbind(tab, tab_en)

salvar_tab_bd(tab, "tab_fatores_capacidade_diferentes_fontes")

# tab_fatores_capacidade_fonte_hidraulica
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_vi_2_traduzida.rds") |>
  dplyr::select(fonte = Fonte, classe = Classe, fc = FC)

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_vi_2_traduzida.rds") |>
  dplyr::select(fonte_en = Source, classe_en = Class)

tab <- cbind(tab, tab_en)

salvar_tab_bd(tab, "tab_fatores_capacidade_fonte_hidraulica")

# tab_fator_capacidade_municipios
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_vi_6_1.rds") |>
  dplyr::select(uf = UF, municipio = Cidade, fc_75 = FC_75, fc_80 = FC_80)

salvar_tab_bd(tab, "tab_fator_capacidade_municipios")

# ANEXO VIII

# tab_relacoes_entre_unidades
tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_viii_1_traduzido.rds")
salvar_tab_bd(tab, "tab_relacoes_entre_unidades")

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_viii_1_traduzido.rds")
salvar_tab_bd(tab, "tab_relacoes_entre_unidades_en")

# tab_coeficientes_equivalencia_calorica
tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_viii_2_traduzido.rds") |>
  dplyr::mutate(
    unidade_origem_en = paste(unidade_fisica_de_origem, unidade_de_medida_de_origem),
    unidade_destino_en = paste(unidade_fisica_de_destino, unidade_de_medida_de_destino)
  ) |>
  dplyr::select(
    unidade_origem_en,
    unidade_destino_en
  )

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_viii_2_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  tidyr::drop_na() |>
  dplyr::mutate(
    unidade_origem = paste(unidade_fisica_de_origem, unidade_de_medida_de_origem),
    unidade_destino = paste(unidade_fisica_de_destino, unidade_de_medida_de_destino)
  ) |>
  dplyr::select(
    unidade_origem,
    unidade_destino,
    unidade_origem_en,
    unidade_destino_en,
    fator_conversao = fator_de_conversao
  ) |>
  dplyr::mutate(fator_conversao = as.numeric(fator_conversao))

salvar_tab_bd(tab, "tab_coeficientes_equivalencia_calorica")

# tab_fatores_conversao_massa

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_viii_3_traduzido.rds") |>
  dplyr::mutate(
    unidade_de_medida_de_destino = glue::glue("({unidade_de_medida_de_destino})")
  )

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_viii_3_traduzido.rds") |>
  dplyr::mutate(
    unidade_de_medida_de_destino = glue::glue("({unidade_de_medida_de_destino})")
  )

tab_depara_en <- tab_en |>
  dplyr::distinct(unidade_fisica_de_destino = unidade_fisica_de_origem, unidade_de_medida_de_origem)

tab_en <- tab_en |>
  dplyr::left_join(
    tab_depara_en,
    by = c("unidade_de_medida_de_destino" = "unidade_de_medida_de_origem")
  ) |>
  dplyr::mutate(
    unidade_origem_en = paste(unidade_fisica_de_origem, unidade_de_medida_de_origem),
    unidade_destino_en = paste(unidade_fisica_de_destino, unidade_de_medida_de_destino)
  ) |>
  dplyr::select(
    unidade_origem_en,
    unidade_destino_en
  )

tab_depara <- tab |>
  dplyr::distinct(unidade_fisica_de_destino = unidade_fisica_de_origem, unidade_de_medida_de_origem)

options(scipen = 999)

tab <- tab |>
  dplyr::left_join(
    tab_depara,
    by = c("unidade_de_medida_de_destino" = "unidade_de_medida_de_origem")
  ) |>
  dplyr::mutate(
    unidade_origem = paste(unidade_fisica_de_origem, unidade_de_medida_de_origem),
    unidade_destino = paste(unidade_fisica_de_destino, unidade_de_medida_de_destino)
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(
    unidade_origem,
    unidade_destino,
    unidade_origem_en,
    unidade_destino_en,
    fator_conversao = total
  ) |>
  dplyr::mutate(
    fator_conversao = as.character(fator_conversao),
    fator_conversao = stringr::str_replace(fator_conversao, ",", "."),
  )

salvar_tab_bd(tab, "tab_fatores_conversao_massa")

# tab_fatores_conversao_volume

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_viii_4_traduzido.rds") |>
  dplyr::mutate(
    unidade_origem_en = glue::glue("{unidade_fisica_de_origem} {unidade_de_medida_de_origem}"),
    unidade_destino_en = unidade_de_medida_de_destino
  ) |>
  dplyr::select(
    unidade_origem_en,
    unidade_destino_en
  )

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_viii_4_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    unidade_origem = glue::glue("{unidade_fisica_de_origem} {unidade_de_medida_de_origem}"),
    unidade_destino = unidade_de_medida_de_destino
  ) |>
  dplyr::select(
    unidade_origem,
    unidade_destino,
    unidade_origem_en,
    unidade_destino_en,
    fator_conversao = total
  ) |>
  dplyr::mutate(
    fator_conversao = as.character(fator_conversao),
    fator_conversao = stringr::str_replace(fator_conversao, ",", "."),
  )

salvar_tab_bd(tab, "tab_fatores_conversao_volume")

# tab_fatores_conversao_energia

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_viii_5_traduzido.rds") |>
  dplyr::mutate(
    unidade_de_medida_de_destino = dplyr::case_when(
      unidade_de_medida_de_destino == "tep (toe)" ~ "toe",
      unidade_de_medida_de_destino == "bep (boe)" ~ "boe",
      TRUE ~ unidade_de_medida_de_destino
    ),
    unidade_de_medida_de_destino = glue::glue("({unidade_de_medida_de_destino})")
  )

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_viii_5_traduzido.rds") |>
  dplyr::mutate(
    unidade_de_medida_de_destino = dplyr::case_when(
      unidade_de_medida_de_destino == "tep (toe)" ~ "tep",
      unidade_de_medida_de_destino == "bep (boe)" ~ "bep",
      TRUE ~ unidade_de_medida_de_destino
    ),
    unidade_de_medida_de_destino = glue::glue("({unidade_de_medida_de_destino})")
  )

tab_depara_en <- tab_en |>
  dplyr::distinct(unidade_fisica_de_destino = unidade_fisica_de_origem, unidade_de_medida_de_origem)

tab_en <- tab_en |>
  dplyr::left_join(
    tab_depara_en,
    by = c("unidade_de_medida_de_destino" = "unidade_de_medida_de_origem")
  ) |>
  dplyr::mutate(
    unidade_origem_en = paste(unidade_fisica_de_origem, unidade_de_medida_de_origem),
    unidade_destino_en = paste(unidade_fisica_de_destino, unidade_de_medida_de_destino)
  ) |>
  dplyr::select(
    unidade_origem_en,
    unidade_destino_en
  )

tab_depara <- tab |>
  dplyr::distinct(unidade_fisica_de_destino = unidade_fisica_de_origem, unidade_de_medida_de_origem)

tab <- tab |>
  dplyr::left_join(
    tab_depara,
    by = c("unidade_de_medida_de_destino" = "unidade_de_medida_de_origem")
  ) |>
  dplyr::mutate(
    unidade_origem = paste(unidade_fisica_de_origem, unidade_de_medida_de_origem),
    unidade_destino = paste(unidade_fisica_de_destino, unidade_de_medida_de_destino)
  ) |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(
    unidade_origem,
    unidade_destino,
    unidade_origem_en,
    unidade_destino_en,
    fator_conversao = total
  ) |>
  dplyr::mutate(
    fator_conversao = as.character(fator_conversao),
    fator_conversao = stringr::str_replace(fator_conversao, ",", "."),
  )

salvar_tab_bd(tab, "tab_fatores_conversao_energia")

# tab_coeficientes_equivalencia_medios_combustiveis_gasosos

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_viii_6_traduzido.rds") |>
  dplyr::mutate(
    unidade_origem_en = unidade_fisica_de_origem,
    unidade_destino_en = unidade_de_medida_de_destino
  ) |>
  dplyr::select(
    unidade_origem_en,
    unidade_destino_en
  )

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_viii_6_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    unidade_origem = unidade_fisica_de_origem,
    unidade_destino = unidade_de_medida_de_destino
  ) |>
  dplyr::select(
    unidade_origem,
    unidade_destino,
    unidade_origem_en,
    unidade_destino_en,
    fator_conversao = total
  ) |>
  dplyr::mutate(
    fator_conversao = as.character(fator_conversao),
    fator_conversao = stringr::str_replace(fator_conversao, ",", "."),
  )

salvar_tab_bd(tab, "tab_coeficientes_equivalencia_medios_combustiveis_gasosos")

# tab_coeficientes_equivalencia_medios_combustiveis_liquidos

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_viii_7_traduzido.rds") |>
  dplyr::mutate(
    unidade_origem_en = unidade_fisica_de_origem,
    unidade_destino_en = unidade_de_medida_de_destino
  ) |>
  dplyr::select(
    unidade_origem_en,
    unidade_destino_en
  )

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_viii_7_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    unidade_origem = unidade_fisica_de_origem,
    unidade_destino = unidade_de_medida_de_destino
  ) |>
  dplyr::select(
    unidade_origem,
    unidade_destino,
    unidade_origem_en,
    unidade_destino_en,
    fator_conversao = total
  ) |>
  dplyr::mutate(
    fator_conversao = dplyr::case_when(
      unidade_destino %in% c("bep", "giga-caloria", "giga-joule", "megawatt-hora (860 kcal/kWh)") ~ scales::number(fator_conversao, accuracy = 0.01, big.mark = ".", decimal.mark = ","),
      unidade_destino %in% c("tec (7000 kcal/kg)", "tep (10⁴  kcal/kg)", "10⁶ BTU") ~ scales::number(fator_conversao, accuracy = 0.001, big.mark = ".", decimal.mark = ",")
    )
  )

salvar_tab_bd(tab, "tab_coeficientes_equivalencia_medios_combustiveis_liquidos")

# tab_coeficientes_equivalencia_medios_combustiveis_solidos

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_viii_8_traduzido.rds") |>
  dplyr::mutate(
    unidade_origem_en = unidade_fisica_de_origem,
    unidade_destino_en = unidade_de_medida_de_destino
  ) |>
  dplyr::select(
    unidade_origem_en,
    unidade_destino_en
  )

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_viii_8_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    unidade_origem = unidade_fisica_de_origem,
    unidade_destino = unidade_de_medida_de_destino
  ) |>
  dplyr::select(
    unidade_origem,
    unidade_destino,
    unidade_origem_en,
    unidade_destino_en,
    fator_conversao = total
  ) |>
  dplyr::mutate(
    fator_conversao = dplyr::case_when(
      unidade_destino %in% c("bep", "giga-caloria", "giga-joule", "megawatt-hora (860 kcal/kWh)") ~ scales::number(fator_conversao, accuracy = 0.01, big.mark = ".", decimal.mark = ","),
      unidade_destino %in% c("tec (7000 kcal/kg)", "tep (10⁴  kcal/kg)", "10⁶ BTU") ~ scales::number(fator_conversao, accuracy = 0.001, big.mark = ".", decimal.mark = ",")
    )
  )

salvar_tab_bd(tab, "tab_coeficientes_equivalencia_medios_combustiveis_solidos")

# tab_densidades_poderes_calorificos

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_tabela_anexo_viii_9_traduzido.rds") |>
  dplyr::mutate(
    unidade_de_medida_de_destino = glue::glue("{unidade_de_medida_de_destino} ({unidade_fisica_de_destino})"),
    unidade_origem_en = unidade_fisica_de_origem,
    unidade_destino_en = unidade_de_medida_de_destino
  ) |>
  dplyr::select(
    unidade_origem_en,
    unidade_destino_en
  )

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_tabela_anexo_viii_9_traduzido.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::mutate(
    unidade_de_medida_de_destino = glue::glue("{unidade_de_medida_de_destino} ({unidade_fisica_de_destino})"),
    unidade_origem = unidade_fisica_de_origem,
    unidade_destino = unidade_de_medida_de_destino
  ) |>
  dplyr::select(
    unidade_origem,
    unidade_destino,
    unidade_origem_en,
    unidade_destino_en,
    fator_conversao = total
  ) |>
  dplyr::mutate(
    fator_conversao = dplyr::case_when(
      unidade_destino %in% c("PODER CALORÍFICO INFERIOR (kcal/kg)", "PODER CALORÍFICO SUPERIOR (kcal/kg)") ~ scales::number(fator_conversao, accuracy = 1, big.mark = ".", decimal.mark = ","),
      unidade_destino %in% c("DENSIDADE (kg/m³)") ~ scales::number(fator_conversao, accuracy = 0.01, big.mark = ".", decimal.mark = ",")
    ),
    fator_conversao = stringr::str_remove(fator_conversao, ",00$"),
  )

salvar_tab_bd(tab, "tab_densidades_poderes_calorificos")

# tab_fatores_conversao_tep_medio

tab_en <- readr::read_rds("./data-raw/rds/en/tratamento_anexo_viii_10.rds") |>
  dplyr::select(
    grupo_en = grupo,
    unidade_en = Unit
  )

tab <- readr::read_rds("./data-raw/rds/pt/tratamento_anexo_viii_10.rds") |>
  dplyr::rename(
    unidade = Unidade
  ) |>
  dplyr::bind_cols(tab_en)


salvar_tab_bd(tab, "tab_fatores_conversao_tep_medio")

# ANEXO IX

# tab_balanco_energitico_consolidado
tab_en <- readr::read_rds("./data-raw/rds/en/dados_para_tabela_download_anexo_ix.rds") |> 
  dplyr::select(
    grupo_en = conta_nivel_4,
    tipo_en = tipo_de_energia,
    fonte_en = fontes_de_energia
  )

tab <- readr::read_rds("./data-raw/rds/pt/dados_para_tabela_download_anexo_ix.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(
    ano,
    grupo = conta_nivel_4,
    grupo_en,
    tipo = tipo_de_energia,
    tipo_en,
    fonte = fontes_de_energia,
    fonte_en,
    valor = valores
  ) |> 
  dplyr::mutate(valor = as.numeric(valor))

salvar_tab_bd(tab, "tab_balanco_energitico_consolidado")

# ANEXO X

# tab_balanco_energitico_unidades_comerciais

tab_en <- readr::read_rds("./data-raw/rds/en/dados_para_tabela_download_anexo_x.rds") |> 
  dplyr::select(
    grupo_en = conta_nivel_4,
    fonte_en = fonte_de_energia_com_unidade
  )

tab <- readr::read_rds("./data-raw/rds/pt/dados_para_tabela_download_anexo_x.rds") |>
  dplyr::bind_cols(tab_en) |>
  dplyr::select(
    ano,
    grupo = conta_nivel_4,
    grupo_en,
    fonte = fonte_de_energia_com_unidade,
    fonte_en,
    valor
  )

salvar_tab_bd(tab, "tab_balanco_energitico_unidades_comerciais")
