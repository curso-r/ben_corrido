
<!-- README.md is generated from README.Rmd. Please edit that file -->

# benCorrido

## Mudanças com relação à versão anterior

### Tecnologia

- O Shiny não é mais utilizado para geração do Balanço. Todas as
  funcionalidades reativas foram transformadas em conteúdos estáticos.

- Por “conteúdo estático”, entende-se que o usuário não se conectará
  mais com um servidor rodando uma sessão de R — na qual as tabelas e
  gráficos eram geradas conforme a escolha de filtros —, mas sim com um
  coleção de arquivos HTML gerados previamente.

- Os arquivos HTML que compõem o Balanço precisam ser gerados apenas uma
  vez a cada atualização dos dados ou do seu conteúdo. Todas as
  visualizações disponíveis no documento são geradas nesse momento.

- Os filtros reativos da versão anterior foram transformados em:

  - abas que mostram e escondem visualizações;
  - carrosséis de gráficos;
  - filtros estáticos — todas as visualizões já existem no HTML e são
    mostradas ou escondidas a depender do filtro selecionado.

- A tecnologia [Quarto](https://quarto.org/) foi adotada para a geração
  do documento, em detrimento do R Markdown, por ser atualmente a
  tecnologia no estado da arte para geração de documentos de análise de
  dados e por ser agnóstica à linguagem R (i.e., também está disponível
  para Python).

- Entre os layouts disponíveis no Quarto, o Balanço é gerado no formato
  livro (`quarto_book`).

### Dados

- Os arquivos de dados `rds` da versão anterior foram agregados em um
  único banco de dados `duckdb`, referenciado aqui como “banco de dados
  ouro”. Esse banco contém todas os dados necessários para gerar as
  tabelas e dados do relatório.

- Esse banco pode ser gerado pela execução do script
  `inst/scripts/gerar_banco_ouro.R`, que lê os arquivos `rds` da pasta
  `data-raw/rds` e gera o banco de dados na pasta `data-raw`.

- Em geral, para cada visualização, apenas uma tabela é gerada, contendo
  as informações necessárias para internacionalização.

### Texto

- Os textos dos capítulos não ficam mais dentro da planilha de tradução,
  mas sim dentro do seu respectivo arquivo `.qmd` na pasta
  `inst/quarto/pt` — para a versão em português — ou `inst/quarto/en` —
  para a versão em inglês.

- Os títulos dos capítulos e seções são gerados pelas marcações de
  *heading*, para que fiquem destacados do texto e sejam estilizados
  automaticamente.

- As referências cruzadas são geradas automaticamente pelo quarto, a
  partir do argumento `label` e da marcação `@fig-xxx` (para figuras) ou
  `@tbl-xxx` (para tabelas).

- As “Notas” foram inseridas nas legendas dos gráficos e tabelas.

### Gráficos

- Cada gráfico possui sua própria função, que recebe a conexão com o
  banco de dados ouro, o idioma e, em alguns casos, parâmetros
  específicos de filtro.

### Tabelas

- Cada tabela possui sua própria função, que recebe a conexão com o
  banco de dados ouro, o idioma e, em alguns casos, parâmetros
  específicos de filtro.

### Internacionalização

- A função `traduz()` não é mais utilizada, assim como a planilha de
  dicionário que a alimentava.

- Cada idioma possui seu próprio conjunto de arquivos, que dividem uma
  mesma coleção de códigos para geração das tabelas e gráficos.

- A versão em português do relatório está na pasta `inst/quarto/pt`,
  enquanto a versão em inglês está na pasta `inst/quarto/en`.

## Gerar o Balanço

1.  [Instalar o Quarto](https://quarto.org/docs/get-started/).

2.  Instalar este pacote.

3.  Rodar o seguinte comando no R, sendo

- `out_dir` o diretório onde os documentos do Balanço serão salvos;
- `profiles` os idiomas que serão gerados (pode ser apenas “pt” ou “en”,
  ou ambos);
- `duckdb_path` o caminho para o banco de dados ouro.

``` r
benCorrido::gerar_livro(
  out_dir = "~/Desktop",
  profiles = c("pt", "en"),
  duckdb_path = "bd_ouro.duckdb"
)
```

## Alterar o conteúdo do Balanço

O conteúdo do Balanço pode ser alterado diretamente no Azure DevOps,
editando os arquivos necessários individualmente, ou a partir de um
ambiente de desenvolvimento.

Recomendamos a atualização direto no DevOps apenas para alteração de
textos e a utilização de ambientes de desenvolvimento para alterações de
código.

As ferramentas de desenvolvimento mais indicadas para este projeto são:

- [RStudio](hhttps://posit.co/download/rstudio-desktop/)
- [Visual Studio Code](https://code.visualstudio.com/)

As alterações devem ser enviadas de volta para o repositório remoto (no
Azure DevOps) via
[Git](https://git-scm.com/about/branching-and-merging).

### Texto

- Alterar os arquivos `.qmd` na pasta `inst/quarto/pt` para a versão em
  português ou `inst/quarto/en` para a versão em inglês. Esses arquivos
  contêm o texto dos capítulos e anexos do Balanço.

### Gráficos

- Para alterar um gráfico, localizar a função correspondente na pasta
  `R/gráficos` e editar o código dentro dela.

- Se necessário, alterar a chamada da função no arquivo `.qmd`
  correspondente dentro da pasta `inst/quarto/pt` ou `inst/quarto/en`.

### Tabelas

- Para alterar uma tabela, localizar a função correspondente na pasta
  `R/tabelas` e editar o código dentro dela.

- Se necessário, alterar a chamada da função no arquivo `.qmd`
  correspondente dentro da pasta `inst/quarto/pt` ou `inst/quarto/en`.

### Carrosséis

- Para alterar o jeito como os carrosséis são gerados, alterar a função
  `criar_carrossel()` no arquivo `R/utils_slickR.R`.

- Para incluir mais um elemento a um carrossel existente, localizar a
  chamada do carrossel em questão no arquivo `.qmd` correspondente e
  adicionar o objeto diretamente como um novo parâmetro da função.

``` r
benCorrido::criar_carrossel(elemento_1, elemento_2, novo_elemento, lang = "pt")
```

### Filtros

- Para alterar o jeito como os filtros são gerados, alterar a função
  `create_dropdown()` no arquivo `R/drowpdown`.

- Para incluir mais um filtro, localizar a chamada do filtro em questão
  no arquivo `.qmd` correspondente e adicionar:

  - a nova visualização na lista de objetos passados ao argumento
    `elementos`;
  - o novo filtro ao vetor de valores passados ao argumento `params`.

``` r
benCorrido::create_dropdown(
  elementos = lista_de_visualizacoes, # incluir o novo objeto a esta lista
  id = "id_do_filtro",
  params = lista_de_valores_do_filtro, # incluir o novo filtro a este vetor
  label = "Label do filtro",
  dropdown_width = "200px" # Comprimento do filtro na tela
)
```
