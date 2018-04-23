#Caminho da common => /lib/common.rb
require 'common'


class FuncoesGenericas

  include PageObject
  include Locators
  include Variaveis

  #Seta do filtro Demitidos e Aposentados
  button(:seta_do_filtro_demitidos_e_aposentados, :id => Locators::LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_SETA)
  # Checkboxes do filtro Demitidos e Aposentados
  checkbox(:da_selecionartudo, :id => Locators::LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_SELECIONAR_TUDO)
  checkbox(:da_todas, :id => Locators::LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_TODAS)
  checkbox(:da_nao, :id => Locators::LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_NAO)
  checkbox(:da_naoidentificado, :id => Locators::LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_NAO_IDENTIFICADO)
  checkbox(:da_sim, :id => Locators::LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS_CHECKBOX_SIM)

  # Checkboxes do filtro Produto
  checkbox(:pr_todas, :id => Locators::LOCATOR_FILTRO_PRODUTO_CHECKBOX_TODAS)

  #Seta do filtro Filial Empresa
  button(:seta_do_filtro_filial_empresa, :id => Locators::LOCATOR_FILTRO_FILIAL_EMPRESA_SETA)
  #Checkboxes do filtro Filial Empresa
  checkbox(:fe_todas, :id => Locators::LOCATOR_FILTRO_FILIAL_EMPRESA_CHECKBOX_TODAS)

  #Seta do filtro Data de Competência Gestao Saude
  button(:seta_do_filtro_data_de_competencia_gestao_saude, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_SETA_GESTAO_SAUDE)

  #Seta do filtro Data de Competência Gestao Dental
  button(:seta_do_filtro_data_de_competencia_gestao_dental, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_SETA_GESTAO_DENTAL)

  #Seta do filtro Data de Competência DICOP Saúde
  button(:seta_do_filtro_data_de_competencia_dicop_saude, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_SETA_DICOP_SAUDE)


  #Checkboxes do filtro Data de Competência Gestão Saúde
  checkbox(:dc_selecionartudo, :name => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_0)
  checkbox(:janeiro2017, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_146)
  checkbox(:fevereiro2017, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_147)
  checkbox(:marco2017, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_148)
  checkbox(:abril2017, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_149)
  checkbox(:maio2017, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_150)
  checkbox(:junho2017, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_151)
  checkbox(:julho2017, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_152)
  checkbox(:agosto2017, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_153)
  checkbox(:setembro2017, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_154)
  checkbox(:outubro2017, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_155)
  checkbox(:novembro2017, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_156)
  checkbox(:dezembro2017, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_157)
  checkbox(:janeiro2018, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_158)
  checkbox(:fevereiro2018, :id => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA_CHECKBOX_INDEX_159)

  #Seta do filtro Empresa
  button(:seta_do_filtro_empresa, :id => Locators::LOCATOR_FILTRO_EMPRESA_SETA)
  #Checkboxes do filtro Empresa
  checkbox(:e_todas, :id => Locators::LOCATOR_FILTRO_EMPRESA_CHECKBOX_TODAS)

  #Seta do filtro Produto
  button(:seta_do_filtro_produto, :id => Locators::LOCATOR_FILTRO_PRODUTO_SETA)

  #Lista do filtro Moeda
  select_list(:selecionar_moeda_no_fltro_moeda_gestao_saude, :id => Locators::LOCATOR_FILTRO_MOEDA_GESTAO_SAUDE_LISTBOX)
  select_list(:selecionar_moeda_no_fltro_moeda_gestao_dental, :id => Locators::LOCATOR_FILTRO_MOEDA_GESTAO_DENTAL_LISTBOX)
  select_list(:selecionar_moeda_no_fltro_moeda_dicop_saude, :id => Locators::LOCATOR_FILTRO_MOEDA_DICOP_SAUDE_LISTBOX)

  #Lista do filtro Tipo de Evento Relatório 192
  select_list(:selecionar_tipo_evento_no_fltro_tipo_de_evento_dicop_saude, :id => Locators::LOCATOR_FILTRO_TIPO_DE_EVENTO_DICOP_SAUDE_LISTBOX)  
  
  #Botão Exibir Relatório
  button(:acionar_botao_exibir_relatorio, :id => Locators::LOCATOR_BOTAO_EXIBIR_RELATORIO)

  #Seta do filtro Filial Amil Relatório 192
  button(:seta_do_filtro_filial_amil, :id => Locators::LOCATOR_FILTRO_FILIAL_AMIL_RELATORIO192_SETA)
  #checkboxes do filtro Filial Amil Relatório 192
  checkbox(:fa_todas_192, :id => Locators::LOCATOR_FILTRO_FILIAL_AMIL_RELATORIO192_CHECKBOX_TODAS)

  #Seta do filtro Empresa Relatório 192
  button(:seta_do_filtro_empresa_192, :id => Locators::LOCATOR_FILTRO_EMPRESA_RELATORIO192_SETA)
  #Checkboxes do filtro Empresa Relatório 192
  checkbox(:e_todas_192, :id => Locators::LOCATOR_FILTRO_EMPRESA_RELATORIO192_CHECKBOX_TODAS)

  #Seta do filtro Célula Relatório 192
  button(:seta_do_filtro_celula_192, :id => Locators::LOCATOR_FILTRO_CELULA_RELATORIO192_SETA)
  #Checkboxes do filtro Célula Relatório 192
  checkbox(:ce_todas_192, :id => Locators::LOCATOR_FILTRO_CELULA_RELATORIO192_CHECKBOX_TODAS)

  #Seta do filtro Operadora Relatório 192
  button(:seta_do_filtro_operadora_192, :id => Locators::LOCATOR_FILTRO_OPERADORA_RELATORIO192_SETA)
  #Checkboxes do filtro Operadora Relatório 192
  checkbox(:op_todas_192, :id => Locators::LOCATOR_FILTRO_OPERADORA_RELATORIO192_CHECKBOX_TODAS)

  #Seta do filtro Filial Empresa Relatório 192
  button(:seta_do_filtro_filial_empresa_192, :id => Locators::LOCATOR_FILTRO_FILIAL_EMPRESA_RELATORIO192_SETA)
  #Checkboxes do filtro Filial Emnpresa Relatório 192
  checkbox(:fe_todas_192, :id => Locators::LOCATOR_FILTRO_FILIAL_EMPRESA_RELATORIO192_CHECKBOX_TODAS)

  #Seta do filtro P&L Relatório 192
  button(:seta_do_filtro_pl_192, :id => Locators::LOCATOR_FILTRO_PL_RELATORIO192_SETA)
  #Checkboxes do filtro P&L Relatório 192
  checkbox(:pl_todas_192, :id => Locators::LOCATOR_FILTRO_PL_RELATORIO192_CHECKBOX_TODAS)

  #Locator que retorna todas as empresas filiais do relatório 192 DICO Saúde
  span(:retornar_empresas_filiadas_relatorio192_dicop_saude, :xpath => Locators::LOCATOR_RETORNAR_EMPRESAS_FILIADAS_RELATORIO192_DICOP_SAUDE)

  #Função para selecionar especialidades do relatório 192 DICOP Saúde
  def selecionar_especialidade_na_tabela_de_especialidades(especialidade)
    begin
      wait_until do
        if @browser.element(:text => "#{especialidade}").visible? == true
          @browser.link(:text => "#{especialidade}").click
          sleep 4
          #Aguarndo o ícone de carregamento da tela desaparecer
          @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
        end
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar a especialidade #{especialidade} na tabela de Especialidades!!!")
    end 
  end

  #Função para selecionar beneficiários do relatório 192 DICOP Saúde
  def selecionar_beneficiario_na_tabela_de_beneficiarios(beneficiario)
    begin
      wait_until do
        if @browser.element(:text => "#{beneficiario}").visible? == true
          @browser.link(:text => "#{beneficiario}").click
          sleep 4
          #Aguarndo o ícone de carregamento da tela desaparecer
          @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
        end
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar o beneficário #{beneficiario} na tabela de Beneficiários!!!")
    end 
  end

  def pressionar_botao_exibir_relatorio
    begin
      @browser.button(:name => Locators::LOCATOR_BOTAO_EXIBIR_RELATORIO).click
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível acionar o botão Exibir Relatório!!!")
    end
  end

  def selecionar_quantidade_de_competencias_em_meses_gestao_saude(meses)
    self.seta_do_filtro_data_de_competencia_gestao_saude
    contador = 1
    index_checkboxes_data_de_competencia = 60
    while contador <= meses do
      if @browser.div(:id => Locators::LOCATOR_CAMPO_DATA_DE_COMPETENCIA_LISTA_GESTAO_SAUDE).span(:index, index_checkboxes_data_de_competencia).checkbox.set? == true
        $world.puts "Checkbox de index #{index_checkboxes_data_de_competencia} já estava selecionado no campo Data de Competência!!!"
        index_checkboxes_data_de_competencia -= 1
        contador += 1
      else
        @browser.div(:id => Locators::LOCATOR_CAMPO_DATA_DE_COMPETENCIA_LISTA_GESTAO_SAUDE).span(:index, index_checkboxes_data_de_competencia).click
        index_checkboxes_data_de_competencia -= 1
        contador += 1
      end
    end
  end

  def selecionar_quantidade_de_competencias_em_meses_gestao_dental(meses)
    self.seta_do_filtro_data_de_competencia_gestao_dental
    contador = 1
    index_checkboxes_data_de_competencia = 60
    while contador <= meses do
      if @browser.div(:id => Locators::LOCATOR_CAMPO_DATA_DE_COMPETENCIA_LISTA_GESTAO_DENTAL).span(:index, index_checkboxes_data_de_competencia).checkbox.set? == true
        $world.puts "Checkbox de index #{index_checkboxes_data_de_competencia} já estava selecionado no campo Data de Competência!!!"
        index_checkboxes_data_de_competencia -= 1
        contador += 1
      else
        @browser.div(:id => Locators::LOCATOR_CAMPO_DATA_DE_COMPETENCIA_LISTA_GESTAO_DENTAL).span(:index, index_checkboxes_data_de_competencia).click
        index_checkboxes_data_de_competencia -= 1
        contador += 1
      end
    end
  end

  def selecionar_quantidade_de_competencias_em_meses_dicop_saude(meses)
    self.seta_do_filtro_data_de_competencia_dicop_saude
    contador = 1
    index_checkboxes_data_de_competencia = 60
    while contador <= meses do
      if @browser.div(:id => Locators::LOCATOR_CAMPO_DATA_DE_COMPETENCIA_LISTA_DICOP_SAUDE).span(:index, index_checkboxes_data_de_competencia).checkbox.set? == true
        $world.puts "Checkbox de index #{index_checkboxes_data_de_competencia} já estava selecionado no campo Data de Competência!!!"
        index_checkboxes_data_de_competencia -= 1
        contador += 1
      else
        @browser.div(:id => Locators::LOCATOR_CAMPO_DATA_DE_COMPETENCIA_LISTA_DICOP_SAUDE).span(:index, index_checkboxes_data_de_competencia).click
        index_checkboxes_data_de_competencia -= 1
        contador += 1
      end
    end
  end

  def selecionar_opcao_no_filtro_demitidos_e_aposentados(opcao)
    begin
      self.seta_do_filtro_demitidos_e_aposentados
      auxiliar = self.send "#{opcao.downcase.gsub(/\s+/,'')}_checked?"
      if auxiliar == true
        $world.puts "Opção #{opcao} já estava selecionada no filtro Demitidos e Aposentados!!!"
        else
        self.send "check_#{opcao.downcase.gsub(/\s+/,'')}"    
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar a opção #{opcao} no filtro Demitidos e Aposentados!!!")
    end
    self.seta_do_filtro_demitidos_e_aposentados
    #Aguarndo o ícone de carregamento da tela desaparecer
    @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
  end

  def selecionar_opcao_no_filtro_filial_amil(opcao)
    begin
      self.seta_do_filtro_filial_amil
      auxiliar = self.send "#{opcao.downcase.gsub(/\s+/,'')}_checked?"
      if auxiliar == true
        $world.puts "Opção #{opcao} já estava selecionada no filtro Filial Amil!!!"
        else
        self.send "check_#{opcao.downcase.gsub(/\s+/,'')}"    
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar a opção #{opcao} no filtro Filial Amil!!!")
    end
    self.seta_do_filtro_filial_amil
    #Aguarndo o ícone de carregamento da tela desaparecer
    @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
  end

  def selecionar_opcao_no_filtro_filial_empresa(opcao)
    begin
      self.seta_do_filtro_filial_empresa
      auxiliar = self.send "#{opcao.downcase.gsub(/\s+/,'')}_checked?" 
      if auxiliar == true
        $world.puts "Opção #{opcao} já estava selecionada no filtro Filial Empresa!!!"
        else
        self.send "check_#{opcao.downcase.gsub(/\s+/,'')}"    
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar a opção #{opcao} no filtro Filial Empresa!!!")
    end
    self.seta_do_filtro_filial_empresa
    #Aguarndo o ícone de carregamento da tela desaparecer
    @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
  end

  def selecionar_opcao_no_filtro_data_de_competencia(opcao)
    begin
      self.seta_do_filtro_data_de_competencia_gestao_saude
      auxiliar = self.send "#{opcao.downcase.gsub(/\s+/,'')}_checked?" 
      if auxiliar == true
        $world.puts "Opção #{opcao} já estava selecionada no filtro Data de Competência!!!"
        else
        self.send "check_#{opcao.downcase.gsub(/\s+/,'')}"
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar a opção #{opcao} no filtro Data de Competência!!!")
    end
    self.seta_do_filtro_data_de_competencia_gestao_saude
    #Aguarndo o ícone de carregamento da tela desaparecer
    @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
  end

  def selecionar_opcao_no_filtro_empresa(opcao)
    begin
      self.seta_do_filtro_empresa
      auxiliar = self.send "#{opcao.downcase.gsub(/\s+/,'')}_checked?" 
      if auxiliar == true
        $world.puts "Opção #{opcao} já estava selecionada no filtro Empresa!!!"
        else
        self.send "check_#{opcao.downcase.gsub(/\s+/,'')}"
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar a opção #{opcao} no filtro Empresa!!!")
    end
    self.seta_do_filtro_empresa
    #Aguarndo o ícone de carregamento da tela desaparecer
    @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
  end

  def selecionar_opcao_no_filtro_empresa_relatorio192(opcao) 
    begin
      self.seta_do_filtro_empresa_192
      auxiliar = self.send "#{opcao.downcase.gsub(/\s+/,'')}_checked?" 
      if auxiliar == true
        $world.puts "Opção #{opcao} já estava selecionada no filtro Filial Empresa do Relatório 192!!!"
        else
        self.send "check_#{opcao.downcase.gsub(/\s+/,'')}"    
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar a opção #{opcao} no filtro Filial Empresa do Relatório 192!!!")
    end
    self.seta_do_filtro_empresa_192
    #Aguarndo o ícone de carregamento da tela desaparecer
    @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
  end

  def selecionar_opcao_no_filtro_celula_relatorio192(opcao) 
    begin
      self.seta_do_filtro_celula_192
      auxiliar = self.send "#{opcao.downcase.gsub(/\s+/,'')}_checked?" 
      if auxiliar == true
        $world.puts "Opção #{opcao} já estava selecionada no filtro Célula do Relatório 192!!!"
        else
        self.send "check_#{opcao.downcase.gsub(/\s+/,'')}"    
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar a opção #{opcao} no filtro Célula do Relatório 192!!!")
    end
    self.seta_do_filtro_celula_192
    #Aguarndo o ícone de carregamento da tela desaparecer
    @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
  end

  def selecionar_opcao_no_filtro_operadora_relatorio192(opcao) 
    begin
      self.seta_do_filtro_operadora_192
      auxiliar = self.send "#{opcao.downcase.gsub(/\s+/,'')}_checked?" 
      if auxiliar == true
        $world.puts "Opção #{opcao} já estava selecionada no filtro Operadora do Relatório 192!!!"
        else
        self.send "check_#{opcao.downcase.gsub(/\s+/,'')}"    
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar a opção #{opcao} no filtro Operadora do Relatório 192!!!")
    end
    self.seta_do_filtro_operadora_192
    #Aguarndo o ícone de carregamento da tela desaparecer
    @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
  end

  def selecionar_opcao_no_filtro_filial_empresa_relatorio192(opcao) 
    begin
      self.seta_do_filtro_filial_empresa_192
      auxiliar = self.send "#{opcao.downcase.gsub(/\s+/,'')}_checked?" 
      if auxiliar == true
        $world.puts "Opção #{opcao} já estava selecionada no filtro Filial Empresa do Relatório 192!!!"
        else
        self.send "check_#{opcao.downcase.gsub(/\s+/,'')}"    
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar a opção #{opcao} no filtro Filial Empresa do Relatório 192!!!")
    end
    self.seta_do_filtro_filial_empresa_192
    #Aguarndo o ícone de carregamento da tela desaparecer
    @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
  end

  def selecionar_opcao_no_filtro_pl_relatorio192(opcao) 
    begin
      self.seta_do_filtro_pl_192
      auxiliar = self.send "#{opcao.downcase.gsub(/\s+/,'')}_checked?" 
      if auxiliar == true
        $world.puts "Opção #{opcao} já estava selecionada no filtro P&L do Relatório 192!!!"
        else
        self.send "check_#{opcao.downcase.gsub(/\s+/,'')}"    
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar a opção #{opcao} no filtro P&L do Relatório 192!!!")
    end
    self.seta_do_filtro_pl_192
    #Aguarndo o ícone de carregamento da tela desaparecer
    @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
  end

  def selecionar_opcao_no_filtro_produto(opcao)
    begin
      self.seta_do_filtro_produto
      auxiliar = self.send "#{opcao.downcase.gsub(/\s+/,'')}_checked?" 
      if auxiliar == true
        $world.puts "Opção #{opcao} já estava selecionada no filtro Empresa!!!"
        else
        self.send "check_#{opcao.downcase.gsub(/\s+/,'')}"
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Não foi possível selecionar a opção #{opcao} no filtro Produto!!!")
    end
    self.seta_do_filtro_produto
    #Aguarndo o ícone de carregamento da tela desaparecer
    @browser.div(:id => Locators::LOCATOR_ICONE_CARREGANDO).wait_while_present
  end

	def relatorio_visivel?(relatorio)
		begin
 			if @browser.text.include?("#{relatorio}")
    			puts "Relatório #{relatorio} apresentado com sucesso!!!"
  			else
    			fail("Relatório #{relatorio} não foi apresentado!!!")
  			end
  		rescue Watir::Exception::UnknownObjectException
  			puts "Erro ao apresentar o relatório"
		end
	end

  <<-DOC
  Método para verificar visibilidade dos campos Demitidos e Aposentados, Filial Empresa, Data de Competência, Empresa e Moeda
  DOC
  def campos_exibir_relatorio31_visiveis?
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Demitidos e Aposentados não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_FILIAL_EMPRESA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Filial Empresa não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Data de Competência não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_EMPRESA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Empresa não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_MOEDA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Moeda não foi exibido!!!")
    end
  end

  def campos_exibir_relatorio36_visiveis?
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Demitidos e Aposentados não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_FILIAL_EMPRESA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Filial Empresa não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Data de Competência não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_EMPRESA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Empresa não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_MOEDA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Moeda não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_PRODUTO).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Produto não foi exibido!!!")
    end
  end

  def campos_exibir_relatorio192_visiveis?
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_DEMITIDOS_E_APOSENTADOS).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Demitidos e Aposentados não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_FILIAL_AMIL).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Filial Amil não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_EMPRESA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Empresa não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_MOEDA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Moeda não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_TIPO_DE_EVENTO).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Tipo de Evendo não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_CELULA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Célula não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_OPERADORA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Operadora não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_FILIAL_EMPRESA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Filial Empresa não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_DATA_DE_COMPETENCIA).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo Data de Competência não foi exibido!!!")
    end
    begin
      wait_until do
        @browser.element(:xpath => Locators::LOCATOR_FILTRO_PL).visible?
      end
    rescue Watir::Exception::UnknownObjectException 
      fail("Campo P&L não foi exibido!!!")
    end
  end

  def verificar_filiais_da_empresa_relatorio192(empresa)
    begin
      empresa_matriz_apresentada = verificar_empresa_matriz_apresentada_relatorio192_dicop_saude(empresa)
      if @browser.element(:xpath => empresa_matriz_apresentada).visible? == true
        empresas_filiadas = self.retornar_empresas_filiadas_relatorio192_dicop_saude
        if empresas_filiadas == Variaveis::FILIAIS_EMPRESA_PRICE_RELATORIO192_DICOP_SAUDE
          $world.puts "Empresas filiadas da empresa #{empresa} apresentadas com sucesso!!!"
        end
      end
    rescue Watir::Exception::UnknownObjectException
      fail("Empresas filiadas da empresa #{empresa} não foram apresentadas!!!")
    end
  end

  def verificar_especialidade_apresentada_relatorio192_2(especialidade)
    begin
      especialidade_apresentada = verificar_especialidade_apresentada_relatorio192_2_dicop_saude(especialidade)
      if @browser.element(:xpath => especialidade_apresentada).visible? == true
          $world.puts "Especialidade #{especialidade} apresentada com sucesso!!!"
      end
    rescue Watir::Exception::UnknownObjectException
      fail("Especialidade #{especialidade} não foi apresentada!!!")
    end
  end

  def verificar_beneficiario_apresentado_relatorio192_3(beneficiario)
    begin
      beneficiario_apresentado = verificar_beneficiario_apresentado_relatorio192_3_dicop_saude(beneficiario)
      if @browser.element(:xpath => beneficiario_apresentado).visible? == true
          $world.puts "Beneficiário #{beneficiario} apresentado com sucesso!!!"
      end
    rescue Watir::Exception::UnknownObjectException
      fail("Beneficiário #{beneficiario} não foi apresentado!!!")
    end
  end

end