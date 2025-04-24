# Gráficos ---------------------------------------------------------------------

# CAPÍTULO 1

# grafico_geracao_energia_fontes_nr
tab <- readr::read_rds("data-raw/rds/pt/dados_agregados_1_1_a_tratados.rds")
tab_en <- readr::read_rds("data-raw/rds/en/dados_agregados_1_1_a_tratados.rds") |>
  dplyr::select(variavel_en = variavel)
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

# grafico_oferta_interna_energia
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

salvar_tab_bd(tab, "grafico_oferta_interna_energia")

# grafico_sankey_fluxo_energetico

source("inst/scripts/gerar_fluxo_energetico.R")
salvar_tab_bd(grafico_sankey_fluxo_energetico, "grafico_sankey_fluxo_energetico")

# grafico_sankey_fluxo_eletrico

source("inst/scripts/gerar_fluxo_energetico.R")
salvar_tab_bd(grafico_sankey_fluxo_eletrico, "grafico_sankey_fluxo_eletrico")


# grafico_comp_oferta_energia_fonte

tab <- readr::read_rds("./data-raw/rds/pt/dados_grafico_anexo_iii_1.rds")
tab_en <- readr::read_rds("./data-raw/rds/en/dados_grafico_anexo_iii_1.rds") |>
  dplyr::select(variavel_en = variavel)
tab <- cbind(tab, tab_en)

salvar_tab_bd(tab, "grafico_comp_oferta_energia_fonte")

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

# CAPÍTULO 7

# CAPÍTULO 8

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

# CAPÍTULO 8
