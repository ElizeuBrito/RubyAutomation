Quando("seleciono a opção Gestão Dental") do
  on(MenusTopo).selecionar_menu_gestao_dental
end

Quando("seleciono a opção {string} no filtro Moeda Gestao Dental") do |moeda|
  on(FuncoesGenericas).selecionar_moeda_no_fltro_moeda_gestao_dental = moeda
end

Quando("seleciono {int} da última competência mais duas competências anteriores") do |competencias_em_meses|
    on(FuncoesGenericas).selecionar_quantidade_de_competencias_em_meses_gestao_dental(competencias_em_meses)
end

E("seleciono a opção Análise de Custos e Receita Emitida Contábil no menu Gestão Dental") do
  navigate_to(OpcoesMenuGestaoDental, :using => :rotas_menu_gestao_dental).selecionar_analise_de_custos_e_receita_emitida_contabil_menu_gestao_dental
end

Então("os campos Demitidos e Aposentados, Filial Empresa, Moeda, Empresa, Data de Competência e Produto são apresentados") do
  on(FuncoesGenericas).campos_exibir_relatorio36_visiveis?
end

Então("confiro os dados do relatório36_01 com os dados do banco de dados para as competências {string}, {string} e {string}") do |competencia1, competencia2, competencia3|
	on(GestaoDentalGerarRelatorio).conferir_dados_do_relatorio36_01(competencia1, competencia2, competencia3)
end

Então("confiro os dados do relatório36_02 com os dados do banco de dados para as competências {string}, {string} e {string}") do |competencia1, competencia2, competencia3|
	on(GestaoDentalGerarRelatorio).conferir_dados_do_relatorio36_02(competencia1, competencia2, competencia3)
end

Então("confiro os dados do relatório36_03 com os dados do banco de dados para as competências {string}, {string} e {string}") do |competencia1, competencia2, competencia3|
	on(GestaoDentalGerarRelatorio).conferir_dados_do_relatorio36_03(competencia1, competencia2, competencia3)
end

Então("confiro os dados do relatório36_04 com os dados do banco de dados para as competências {string}, {string} e {string}") do |competencia1, competencia2, competencia3|
	on(GestaoDentalGerarRelatorio).conferir_dados_do_relatorio36_04(competencia1, competencia2, competencia3)
end