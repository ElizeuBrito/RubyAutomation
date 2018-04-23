require 'tiny_tds'

class BancoDeDadosBIBook

	def tres_ultimas_competencias(competencia1, competencia2, competencia3)
		@competencia1 = competencia1
		@competencia2 = competencia2
		@competencia3 = competencia3
	end

	def competencias_de_um_ano(competencia1, competencia2, competencia3, competencia4, competencia5, competencia6, competencia7, competencia8, competencia9, competencia10, competencia11,
		competencia12, competencia13)
		@competencia1 = competencia1
		@competencia2 = competencia2
		@competencia3 = competencia3
		@competencia4 = competencia4
		@competencia5 = competencia5
		@competencia6 = competencia6
		@competencia7 = competencia7
		@competencia8 = competencia8
		@competencia9 = competencia9
		@competencia10 = competencia10
		@competencia11 = competencia11
		@competencia12 = competencia12
		@competencia13 = competencia13
	end

	def recuperar_dados_bd_bi_book_ultimas_tres_competencias_demitidos_aposentados_todos_filial_empresa

		client = TinyTds::Client.new username: FigNewton.credenciais_banco_de_dados.usuario,
									 password: FigNewton.credenciais_banco_de_dados.senha,
									 host: FigNewton.credenciais_banco_de_dados.host,
    								 port: FigNewton.credenciais_banco_de_dados.port,
    								 database: FigNewton.credenciais_banco_de_dados.database,
    								 adapter: FigNewton.credenciais_banco_de_dados.adapter,
    								 timeout: FigNewton.credenciais_banco_de_dados.timeout

		puts 'Conectando no SQL Server!!!'

		if client.active? == true then puts 'Tudo pronto!!!' end

		puts "Obtendo dados da tabela!!!"

		result = client.execute("SELECT 
	Data_de_Competencia       AS 'Data de Competência', 
	SUM(Receita)              AS 'Receita', 
	SUM(Custo_Total)          AS 'Custo Total', 
	AVG(Sinistralidade)   	  AS 'Sinistralidade', 
	SUM(Qtde_Benef_Atendidos) AS 'Qtde Benef. Atendidos', 
	AVG(Custo_per_Capita) 	  AS 'Custo per Capita', 
	SUM(Qtde_de_Vidas)        AS 'Qtde de Vidas' 
FROM 
( 

SELECT
	COMPETENCIA        AS 'Data_de_Competencia', 
	Receita            AS 'Receita', 
	VL_Custo           AS 'Custo_Total', 
	VL_Custo/NULLIF(Receita,0)   AS 'Sinistralidade', 
	QTD_ATENDIMENTOS   AS 'Qtde_Benef_Atendidos', 
	VL_Custo/NULLIF(QTD_VIDAS,0) AS 'Custo_per_Capita', 
	QTD_VIDAS          AS 'Qtde_de_Vidas' 
FROM
( 
	SELECT 
		COMPETENCIA        AS 'COMPETENCIA', 
		SUM(Receita)            AS 'Receita', 
		SUM(VL_Custo)           AS 'VL_Custo', 
		SUM(QTD_ATENDIMENTOS)   AS 'QTD_ATENDIMENTOS', 
		SUM(QTD_VIDAS)          AS 'QTD_VIDAS' 
	FROM 
	( 
		SELECT
			FREEM_COMPETENCIA AS 'COMPETENCIA', 
			SUM(FREEM_VL_A_PAGAR) AS Receita,  
			COUNT (DISTINCT FREEM_NR_MARCA_OTICA_VIDA) AS 'QTD_VIDAS',  
			0 AS 'QTD_ATENDIMENTOS', 
			0 AS 'VL_Custo' 
		FROM
		BIOP_DWH.dbo.book_FREEM_RECEITA_EMITIDA 
		WHERE
			FREEM_CD_CONTRATO <> '-2-2' AND 
			FREEM_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}') AND 
			FREEM_CD_CONTRATO LIKE '120624%' AND
			FREEM_CD_PRODUTO_ASSISTENCIA = '1' 
		GROUP BY FREEM_COMPETENCIA
	UNION ALL 
	SELECT 
		num_mes AS 'COMPETENCIA', 
		0 AS Receita, 
		0 AS 'QTD_VIDAS', 
		SUM(QTD_ATENDIMENTOS) AS 'QTD_ATENDIMENTOS', 
		SUM(VL_Custo) AS 'VL_Custo' 
	FROM 
	( 
		SELECT 
			num_mes, 
			SUM(VL_Custo) AS 'VL_Custo', 
			SUM(QTD_ATENDIDOS) AS 'QTD_ATENDIMENTOS' 
		FROM 
		( 
			SELECT 
				num_mes, 
				SUM(ISNULL(FPRSA_VL_CALCULADO, 0)) AS VL_Custo , 
				COUNT(DISTINCT FPRSA_NR_MARCA_OTICA) AS 'QTD_ATENDIDOS' 
			FROM 
			BIOP_DWH.dbo.book_VW_FT_PROCEDIMENTO_SAUDE P 
				INNER JOIN biop_dwh.dbo.book_VW_DIM_CONTRATO C 
					ON C.CD_CONTRATO = P.FPRSA_CD_CONTRATO 
			WHERE 
				C.Tip_Pessoa IN ('J', 'I') AND 
				num_mes IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}') AND
				C.CD_CONTRATO LIKE '120624%'
			GROUP BY num_mes 
			UNION 
			SELECT FPECO_DS_COMPETENCIA, SUM(FPECO_VL_PEONA_CONTRATO) AS VL_Custo , 0 
		 	FROM BIOP_DWH.dbo.book_VW_FT_PEONA_CONTABIL_CONTRATO PE 
			INNER JOIN biop_dwh.dbo.book_VW_DIM_CONTRATO C 
				ON PE.FPECO_CD_CONTRATO = C.CD_CONTRATO 
			WHERE  
				C.Tip_Pessoa IN ('J', 'I') AND 
				FPECO_DS_COMPETENCIA  IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}') AND
				C.CD_CONTRATO LIKE '120624%'
			GROUP BY FPECO_DS_COMPETENCIA 
		) AS X2 
	GROUP BY num_mes) AS x3 
GROUP BY num_mes) AS x4 
GROUP BY COMPETENCIA) AS x5
 ) AS x_all 
GROUP BY Data_de_Competencia 
ORDER BY Data_de_Competencia")
		resultado = result.each do |rowset| end
  		return resultado
		client.close
	end

	def recuperar_dados_bd_bi_book_ultimas_tres_competencias_demitidos_aposentados_todos

		client = TinyTds::Client.new username: FigNewton.credenciais_banco_de_dados.usuario,
									 password: FigNewton.credenciais_banco_de_dados.senha,
									 host: FigNewton.credenciais_banco_de_dados.host,
    								 port: FigNewton.credenciais_banco_de_dados.port,
    								 database: FigNewton.credenciais_banco_de_dados.database,
    								 adapter: FigNewton.credenciais_banco_de_dados.adapter,
    								 timeout: FigNewton.credenciais_banco_de_dados.timeout

		puts 'Conectando no SQL Server!!!'

		if client.active? == true then puts 'Tudo pronto!!!' end

		puts "Obtendo dados da tabela!!!"

		result = client.execute("SELECT
									Data_de_Competencia       AS 'Data de Competência', 
									SUM(Receita)              AS 'Receita', 
									SUM(Custo_Total)          AS 'Custo Total', 
									AVG(Sinistralidade)   	  AS 'Sinistralidade', 
									SUM(Qtde_Benef_Atendidos) AS 'Qtde Benef. Atendidos', 
									AVG(Custo_per_Capita) 	  AS 'Custo per Capita', 
									SUM(Qtde_de_Vidas) 		  AS 'Qtde de Vidas' 
								FROM 
								( 

								SELECT
									COMPETENCIA        AS 'Data_de_Competencia', 
									Receita            AS 'Receita', 
									VL_Custo           AS 'Custo_Total', 
									VL_Custo/NULLIF(Receita,0)   AS 'Sinistralidade', 
									QTD_ATENDIMENTOS   AS 'Qtde_Benef_Atendidos', 
									VL_Custo/NULLIF(QTD_VIDAS,0) AS 'Custo_per_Capita', 
									QTD_VIDAS          AS 'Qtde_de_Vidas' 
								FROM
								( 
									SELECT 
										COMPETENCIA        AS 'COMPETENCIA', 
										SUM(Receita)            AS 'Receita', 
										SUM(VL_Custo)           AS 'VL_Custo', 
										SUM(QTD_ATENDIMENTOS)   AS 'QTD_ATENDIMENTOS', 
										SUM(QTD_VIDAS)          AS 'QTD_VIDAS' 
									FROM 
									( 
										SELECT
											FREEM_COMPETENCIA AS 'COMPETENCIA', 
											SUM(FREEM_VL_A_PAGAR) AS Receita,  
											COUNT (DISTINCT FREEM_NR_MARCA_OTICA_VIDA) AS 'QTD_VIDAS',  
											0 AS 'QTD_ATENDIMENTOS', 
											0 AS 'VL_Custo' 
										FROM
											BIOP_DWH.dbo.book_FREEM_RECEITA_EMITIDA 
										WHERE
											FREEM_CD_CONTRATO <> '-2-2' AND 
											FREEM_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}') AND 
											FREEM_CD_PRODUTO_ASSISTENCIA = '1' 
										GROUP BY FREEM_COMPETENCIA
								UNION ALL 
								SELECT 
									num_mes AS 'COMPETENCIA', 
									0 AS Receita, 
									0 AS 'QTD_VIDAS', 
									SUM(QTD_ATENDIMENTOS) AS 'QTD_ATENDIMENTOS', 
									SUM(VL_Custo) AS 'VL_Custo' 
								FROM 
									( 
										SELECT 
											num_mes, 
											SUM(VL_Custo) AS 'VL_Custo', 
											SUM(QTD_ATENDIDOS) AS 'QTD_ATENDIMENTOS' 
										FROM 
												( 
													SELECT 
														num_mes, 
														SUM(ISNULL(FPRSA_VL_CALCULADO, 0)) AS VL_Custo , 
														COUNT(DISTINCT FPRSA_NR_MARCA_OTICA) AS 'QTD_ATENDIDOS' 
													FROM 
														BIOP_DWH.dbo.book_VW_FT_PROCEDIMENTO_SAUDE P 
														INNER JOIN biop_dwh.dbo.book_VW_DIM_CONTRATO C 
															ON C.CD_CONTRATO = P.FPRSA_CD_CONTRATO 
													WHERE 
														C.Tip_Pessoa IN ('J', 'I') AND 
														num_mes IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}') 
													GROUP BY num_mes 
													UNION 
													SELECT FPECO_DS_COMPETENCIA, SUM(FPECO_VL_PEONA_CONTRATO) AS VL_Custo , 0 
													FROM BIOP_DWH.dbo.book_VW_FT_PEONA_CONTABIL_CONTRATO PE 
													INNER JOIN biop_dwh.dbo.book_VW_DIM_CONTRATO C 
														ON PE.FPECO_CD_CONTRATO = C.CD_CONTRATO 
													WHERE  
														C.Tip_Pessoa IN ('J', 'I') AND 
														FPECO_DS_COMPETENCIA  IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}') 
													GROUP BY FPECO_DS_COMPETENCIA 
										) AS X2 
									GROUP BY num_mes) AS x3 
								GROUP BY num_mes) AS x4 
								GROUP BY COMPETENCIA) AS x5
 								) AS x_all 
								GROUP BY Data_de_Competencia 
								ORDER BY Data_de_Competencia")
		resultado = result.each do |rowset| end
  		return resultado
		client.close
	end

	def recuperar_dados_bd_bi_book_ultimas_tres_competencias_demitidos_aposentados_sim

		client = TinyTds::Client.new username: FigNewton.credenciais_banco_de_dados.usuario,
									 password: FigNewton.credenciais_banco_de_dados.senha,
									 host: FigNewton.credenciais_banco_de_dados.host,
    								 port: FigNewton.credenciais_banco_de_dados.port,
    								 database: FigNewton.credenciais_banco_de_dados.database,
    								 adapter: FigNewton.credenciais_banco_de_dados.adapter,
    								 timeout: FigNewton.credenciais_banco_de_dados.timeout

		puts 'Conectando no SQL Server!!!'

		if client.active? == true then puts 'Tudo pronto!!!' end

		puts "Obtendo dados da tabela!!!"

		result = client.execute("SELECT 
									Data_de_Competencia       AS 'Data de Competência', 
									SUM(Receita)              AS 'Receita', 
									SUM(Custo_Total)          AS 'Custo Total', 
									AVG(Sinistralidade)      AS 'Sinistralidade', 
									SUM(Qtde_Benef_Atendidos) AS 'Qtde Benef. Atendidos', 
									AVG(Custo_per_Capita)   AS 'Custo per Capita', 
									SUM(Qtde_de_Vidas)        AS 'Qtde de Vidas' 
								FROM 
								( 

									SELECT
										COMPETENCIA        AS 'Data_de_Competencia', 
										Receita            AS 'Receita', 
										VL_Custo           AS 'Custo_Total', 
										VL_Custo/NULLIF(Receita,0)   AS 'Sinistralidade', 
										QTD_ATENDIMENTOS   AS 'Qtde_Benef_Atendidos', 
										VL_Custo/NULLIF(QTD_VIDAS,0) AS 'Custo_per_Capita', 
										QTD_VIDAS          AS 'Qtde_de_Vidas' 
									FROM
									( 
										SELECT 
											COMPETENCIA        AS 'COMPETENCIA', 
											SUM(Receita)            AS 'Receita', 
											SUM(VL_Custo)           AS 'VL_Custo', 
											SUM(QTD_ATENDIMENTOS)   AS 'QTD_ATENDIMENTOS', 
											SUM(QTD_VIDAS)          AS 'QTD_VIDAS' 
										FROM 
										( 
											SELECT
												FREEM_COMPETENCIA AS 'COMPETENCIA', 
												SUM(FREEM_VL_A_PAGAR) AS Receita,  
												COUNT (DISTINCT FREEM_NR_MARCA_OTICA_VIDA) AS 'QTD_VIDAS',  
												0 AS 'QTD_ATENDIMENTOS', 
												0 AS 'VL_Custo' 
												FROM
												BIOP_DWH.dbo.book_FREEM_RECEITA_EMITIDA 
												WHERE
												FREEM_CD_CONTRATO <> '-2-2' AND 
												FREEM_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}') AND 
												FREEM_IN_APOS_DEMITIDO = 'S' AND
												FREEM_CD_PRODUTO_ASSISTENCIA = '1' 
												GROUP BY FREEM_COMPETENCIA
												UNION ALL 
												SELECT 
												num_mes AS 'COMPETENCIA', 
												0 AS Receita, 
												0 AS 'QTD_VIDAS', 
												SUM(QTD_ATENDIMENTOS) AS 'QTD_ATENDIMENTOS', 
												SUM(VL_Custo) AS 'VL_Custo' 
												FROM 
												( 
													SELECT 
														num_mes, 
														SUM(VL_Custo) AS 'VL_Custo', 
														SUM(QTD_ATENDIDOS) AS 'QTD_ATENDIMENTOS' 
														FROM 
													( 
														SELECT 
															num_mes, 
															SUM(ISNULL(FPRSA_VL_CALCULADO, 0)) AS VL_Custo , 
															COUNT(DISTINCT FPRSA_NR_MARCA_OTICA) AS 'QTD_ATENDIDOS' 
															FROM 
															BIOP_DWH.dbo.book_VW_FT_PROCEDIMENTO_SAUDE P 
															INNER JOIN biop_dwh.dbo.book_VW_DIM_CONTRATO C 
															ON C.CD_CONTRATO = P.FPRSA_CD_CONTRATO 
															WHERE 
															C.Tip_Pessoa IN ('J', 'I') AND 
															num_mes IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')  AND
															FPRSA_IND_APOS_DEMITIDO = 'S'
															GROUP BY num_mes 
														) AS X2 
															GROUP BY num_mes) AS x3 
															GROUP BY num_mes) AS x4 
															GROUP BY COMPETENCIA) AS x5
 														) AS x_all 
														GROUP BY Data_de_Competencia 
														ORDER BY Data_de_Competencia")
		resultado = result.each do |rowset| end
  		return resultado
		client.close
	end

	def recuperar_dados_bd_bi_book_competencias_de_um_ano_demitidos_aposentados_todos

		client = TinyTds::Client.new username: FigNewton.credenciais_banco_de_dados.usuario,
									 password: FigNewton.credenciais_banco_de_dados.senha,
									 host: FigNewton.credenciais_banco_de_dados.host,
    								 port: FigNewton.credenciais_banco_de_dados.port,
    								 database: FigNewton.credenciais_banco_de_dados.database,
    								 adapter: FigNewton.credenciais_banco_de_dados.adapter,
    								 timeout: FigNewton.credenciais_banco_de_dados.timeout

		puts 'Conectando no SQL Server!!!'

		if client.active? == true then puts 'Tudo pronto!!!' end

		puts "Obtendo dados da tabela!!!"

		result = client.execute("SELECT
									Data_de_Competencia       AS 'Data de Competência', 
									SUM(Receita)              AS 'Receita', 
									SUM(Custo_Total)          AS 'Custo Total', 
									AVG(Sinistralidade)   	  AS 'Sinistralidade', 
									SUM(Qtde_Benef_Atendidos) AS 'Qtde Benef. Atendidos', 
									AVG(Custo_per_Capita) 	  AS 'Custo per Capita', 
									SUM(Qtde_de_Vidas) 		  AS 'Qtde de Vidas' 
								FROM 
								( 

								SELECT
									COMPETENCIA        AS 'Data_de_Competencia', 
									Receita            AS 'Receita', 
									VL_Custo           AS 'Custo_Total', 
									VL_Custo/NULLIF(Receita,0)   AS 'Sinistralidade', 
									QTD_ATENDIMENTOS   AS 'Qtde_Benef_Atendidos', 
									VL_Custo/NULLIF(QTD_VIDAS,0) AS 'Custo_per_Capita', 
									QTD_VIDAS          AS 'Qtde_de_Vidas' 
								FROM
								( 
									SELECT 
										COMPETENCIA        AS 'COMPETENCIA', 
										SUM(Receita)            AS 'Receita', 
										SUM(VL_Custo)           AS 'VL_Custo', 
										SUM(QTD_ATENDIMENTOS)   AS 'QTD_ATENDIMENTOS', 
										SUM(QTD_VIDAS)          AS 'QTD_VIDAS' 
									FROM 
									( 
										SELECT
											FREEM_COMPETENCIA AS 'COMPETENCIA', 
											SUM(FREEM_VL_A_PAGAR) AS Receita,  
											COUNT (DISTINCT FREEM_NR_MARCA_OTICA_VIDA) AS 'QTD_VIDAS',  
											0 AS 'QTD_ATENDIMENTOS', 
											0 AS 'VL_Custo' 
										FROM
											BIOP_DWH.dbo.book_FREEM_RECEITA_EMITIDA 
										WHERE
											FREEM_CD_CONTRATO <> '-2-2' AND 
											FREEM_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}', '#{@competencia4}', '#{@competencia5}', '#{@competencia6}', '#{@competencia7}',
											'#{@competencia8}', '#{@competencia9}', '#{@competencia10}', '#{@competencia11}', '#{@competencia12}', '#{@competencia13}') AND 
											FREEM_CD_PRODUTO_ASSISTENCIA = '1' 
										GROUP BY FREEM_COMPETENCIA
								UNION ALL 
								SELECT 
									num_mes AS 'COMPETENCIA', 
									0 AS Receita, 
									0 AS 'QTD_VIDAS', 
									SUM(QTD_ATENDIMENTOS) AS 'QTD_ATENDIMENTOS', 
									SUM(VL_Custo) AS 'VL_Custo' 
								FROM 
									( 
										SELECT 
											num_mes, 
											SUM(VL_Custo) AS 'VL_Custo', 
											SUM(QTD_ATENDIDOS) AS 'QTD_ATENDIMENTOS' 
										FROM 
												( 
													SELECT 
														num_mes, 
														SUM(ISNULL(FPRSA_VL_CALCULADO, 0)) AS VL_Custo , 
														COUNT(DISTINCT FPRSA_NR_MARCA_OTICA) AS 'QTD_ATENDIDOS' 
													FROM 
														BIOP_DWH.dbo.book_VW_FT_PROCEDIMENTO_SAUDE P 
														INNER JOIN biop_dwh.dbo.book_VW_DIM_CONTRATO C 
															ON C.CD_CONTRATO = P.FPRSA_CD_CONTRATO 
													WHERE 
														C.Tip_Pessoa IN ('J', 'I') AND 
														num_mes IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}', '#{@competencia4}', '#{@competencia5}', '#{@competencia6}', '#{@competencia7}',
														'#{@competencia8}', '#{@competencia9}', '#{@competencia10}', '#{@competencia11}', '#{@competencia12}', '#{@competencia13}') 
													GROUP BY num_mes 
													UNION 
													SELECT FPECO_DS_COMPETENCIA, SUM(FPECO_VL_PEONA_CONTRATO) AS VL_Custo , 0 
													FROM BIOP_DWH.dbo.book_VW_FT_PEONA_CONTABIL_CONTRATO PE 
													INNER JOIN biop_dwh.dbo.book_VW_DIM_CONTRATO C 
														ON PE.FPECO_CD_CONTRATO = C.CD_CONTRATO 
													WHERE  
														C.Tip_Pessoa IN ('J', 'I') AND 
														FPECO_DS_COMPETENCIA  IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}', '#{@competencia4}', '#{@competencia5}', '#{@competencia6}', '#{@competencia7}',
														'#{@competencia8}', '#{@competencia9}', '#{@competencia10}', '#{@competencia11}', '#{@competencia12}', '#{@competencia13}') 
													GROUP BY FPECO_DS_COMPETENCIA 
										) AS X2 
									GROUP BY num_mes) AS x3 
								GROUP BY num_mes) AS x4 
								GROUP BY COMPETENCIA) AS x5
 								) AS x_all 
								GROUP BY Data_de_Competencia 
								ORDER BY Data_de_Competencia")
		resultado = result.each do |rowset| end
  		return resultado
		client.close
	end




	<<-DOC
	Queries do relatório 36
	Data de Criação do Script: 03/04/2018
	Hora: 09:00
	Autor: Elizeu Donizete de Brito
	DOC
	#----------------------------Relatorio_36_01----------------------------#
	# Demitidos e Aposentados = Todas										#
	# Filial Empresa = Todas												#
	# Data Competência = Última competência mais 2 competências anteriores	#
	# Empresas = Todas 														#
	# Moeda = Real   														#
	# Produtos = Todos														#
	#-----------------------------------------------------------------------#
	def recuperar_dados_bd_bi_book_relatorio_36_01

		client = TinyTds::Client.new username: FigNewton.credenciais_banco_de_dados.usuario,
									 password: FigNewton.credenciais_banco_de_dados.senha,
									 host: FigNewton.credenciais_banco_de_dados.host,
    								 port: FigNewton.credenciais_banco_de_dados.port,
    								 database: FigNewton.credenciais_banco_de_dados.database,
    								 adapter: FigNewton.credenciais_banco_de_dados.adapter,
    								 timeout: FigNewton.credenciais_banco_de_dados.timeout

		puts 'Conectando no SQL Server!!!'

		if client.active? == true then puts 'Tudo pronto!!!' end

		puts "Obtendo dados da tabela!!!"

		result = client.execute("USE BIOP_DWH;
							SELECT
							Data_de_Competencia AS 'Data de Competência',
							CAST(SUM(Receita) AS DECIMAL(15,5)) AS 'Receita', 
							CAST(SUM(Custo_Medico) AS DECIMAL(15,5)) AS 'Custo Odontológico', 
							CAST(AVG(Sinistralidade) AS DECIMAL(15,5)) AS 'Sinistralidade', 
							SUM(Qtde_Benef_Atendidos) AS 'Qtde usuários', 
							CAST(AVG(Custo_per_Capita) AS DECIMAL(15,5)) AS 'Custo per Capita', 
							SUM(Qtde_de_Vidas) AS 'Qtde de Vidas'
							FROM 
							( 
								SELECT
								COMPETENCIA        AS 'Data_de_Competencia',
								Receita            AS 'Receita',
								VL_Custo           AS 'Custo_Medico', 
								VL_Custo/NULLIF(Receita,0)   AS 'Sinistralidade', 
								QTD_ATENDIMENTOS   AS 'Qtde_Benef_Atendidos', 
								VL_Custo/NULLIF(QTD_VIDAS,0) AS 'Custo_per_Capita',
								QTD_VIDAS          AS 'Qtde_de_Vidas'
								FROM 
								( 
								SELECT 
								COMPETENCIA             AS 'COMPETENCIA', 
								SUM(Receita)            AS 'Receita', 
								SUM(VL_Custo)           AS 'VL_Custo', 
								SUM(QTD_ATENDIMENTOS)   AS 'QTD_ATENDIMENTOS', 
								SUM(QTD_VIDAS)          AS 'QTD_VIDAS' 
								FROM 
								(
								  	SELECT 
							    	FREEM_COMPETENCIA AS 'COMPETENCIA',  
							    	SUM(FREEM_VL_A_PAGAR) AS 'Receita',
									0 AS 'VL_Custo', 
									0 AS 'QTD_ATENDIMENTOS',
									COUNT(DISTINCT CASE WHEN freem_cd_grupo_rubrica IN(1,6)
									THEN freem_nr_marca_otica ELSE NULL END)  AS 'QTD_VIDAS'
									FROM book_FREEM_RECEITA_EMITIDA AS FT
									INNER JOIN book_VW_DIM_CONTRATO CT 
									ON CT.CD_CONTRATO = FT.FREEM_CD_CONTRATO
									LEFT JOIN book_VW_DIM_BENEFICIARIO AS BN
									ON BN.NR_MARCA_OTICA = FT.FREEM_NR_MARCA_OTICA
									WHERE FREEM_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
									AND FREEM_CD_PRODUTO_ASSISTENCIA <> 1 
									AND CT.TIP_PESSOA IN('J','I') 
									GROUP BY FREEM_COMPETENCIA
									
									UNION ALL 
									
									SELECT
									FPRDE_DS_COMPETENCIA AS 'COMPETENCIA',
									0  AS 'Receita',
									0 AS 'VL_Custo', 
									COUNT(DISTINCT FPRDE_NR_MARCA_OTICA)  AS 'QTD_ATENDIMENTOS',
									0 AS 'QTD_VIDAS'
									FROM book_FPRDE_PROCEDIMENTO_DENTAL AS FT
									INNER JOIN book_VW_DIM_CONTRATO CT ON CT.CD_CONTRATO=FT.FPRDE_CD_CONTRATO
									LEFT JOIN book_VW_DIM_BENEFICIARIO AS BN ON BN.NR_MARCA_OTICA=FT.FPRDE_NR_MARCA_OTICA
									WHERE FPRDE_DS_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
									AND CT.TIP_PESSOA IN('J','I') --- regra inclusa no report
									GROUP BY FPRDE_DS_COMPETENCIA

									UNION ALL

									SELECT
									Competencia AS 'COMPETENCIA',
									0 AS 'Receita',
									SUM(Custo_Dental) AS 'VL_Custo',
									0 AS 'QTD_ATENDIMENTOS',
									0 AS 'QTD_VIDAS' 
									FROM
									(
										SELECT
										FPRDE_DS_COMPETENCIA AS Competencia,
										SUM(FPRDE_VL_PAGO)   AS Custo_Dental
										FROM book_FPRDE_PROCEDIMENTO_DENTAL AS FT
										INNER JOIN book_VW_DIM_CONTRATO CT ON CT.CD_CONTRATO=FT.FPRDE_CD_CONTRATO
										LEFT JOIN book_VW_DIM_BENEFICIARIO AS BN ON BN.NR_MARCA_OTICA=FT.FPRDE_NR_MARCA_OTICA
										WHERE 
										FPRDE_DS_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
										AND CT.TIP_PESSOA IN('J','I') --- regra inclusa no report
										GROUP BY
										FPRDE_DS_COMPETENCIA
										
										UNION
										
										SELECT
										FDERE_DS_COMPETENCIA  AS Competencia,
										SUM(FDERE_VL_REPASSE) AS Custo_Dental
										FROM book_FDERE_DETALHE_REPASSE_DENTAL
										INNER JOIN book_VW_DIM_CONTRATO AS CT ON CT.CD_CONTRATO=FDERE_CD_CONTRATO
										WHERE
										FDERE_DS_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
										AND CT.TIP_PESSOA IN('J','I') --- regra inclusa no report

										GROUP BY
										FDERE_DS_COMPETENCIA
									) AS CustoOdonto
									GROUP BY
									COMPETENCIA
												
									) AS x
									GROUP BY COMPETENCIA
								) AS x2
							) AS  x_all
GROUP BY Data_de_Competencia 
ORDER BY SUM(Custo_Medico) DESC")
		resultado = result.each do |rowset| end
  		return resultado
		client.close
	end

	#----------------------------Relatorio_36_02----------------------------#
	# Demitidos e Aposentados = Sim 										#
	# Filial Empresa = Todas												#
	# Data Competência = Última competência mais 2 competências anteriores	#
	# Empresas = Todas 														#
	# Moeda = Real   														#
	# Produtos = Todos														#
	#-----------------------------------------------------------------------#
	def recuperar_dados_bd_bi_book_relatorio_36_02

		client = TinyTds::Client.new username: FigNewton.credenciais_banco_de_dados.usuario,
									 password: FigNewton.credenciais_banco_de_dados.senha,
									 host: FigNewton.credenciais_banco_de_dados.host,
    								 port: FigNewton.credenciais_banco_de_dados.port,
    								 database: FigNewton.credenciais_banco_de_dados.database,
    								 adapter: FigNewton.credenciais_banco_de_dados.adapter,
    								 timeout: FigNewton.credenciais_banco_de_dados.timeout

		puts 'Conectando no SQL Server!!!'

		if client.active? == true then puts 'Tudo pronto!!!' end

		puts "Obtendo dados da tabela!!!"

		result = client.execute("USE BIOP_DWH;

										SELECT
										Data_de_Competencia AS 'Data de Competência',
										CAST(SUM(Receita) AS DECIMAL(15,5)) AS 'Receita', 
										CAST(SUM(Custo_Medico) AS DECIMAL(15,5)) AS 'Custo Odontológico', 
										CAST(AVG(Sinistralidade) AS DECIMAL(15,5)) AS 'Sinistralidade', 
										SUM(Qtde_Benef_Atendidos) AS 'Qtde usuários', 
										CAST(AVG(Custo_per_Capita) AS DECIMAL(15,5)) AS 'Custo per Capita', 
										SUM(Qtde_de_Vidas) AS 'Qtde de Vidas'
										FROM 
										( 
											SELECT
											COMPETENCIA        AS 'Data_de_Competencia',
											Receita            AS 'Receita',
											VL_Custo           AS 'Custo_Medico', 
											VL_Custo/NULLIF(Receita,0)   AS 'Sinistralidade', 
											QTD_ATENDIMENTOS   AS 'Qtde_Benef_Atendidos', 
											VL_Custo/NULLIF(QTD_VIDAS,0) AS 'Custo_per_Capita',
											QTD_VIDAS          AS 'Qtde_de_Vidas'
											FROM 
											( 
											SELECT 
											COMPETENCIA             AS 'COMPETENCIA', 
											SUM(Receita)            AS 'Receita', 
											SUM(VL_Custo)           AS 'VL_Custo', 
											SUM(QTD_ATENDIMENTOS)   AS 'QTD_ATENDIMENTOS', 
											SUM(QTD_VIDAS)          AS 'QTD_VIDAS' 
											FROM 
											(
											  	SELECT 
										    	FREEM_COMPETENCIA AS 'COMPETENCIA',  
										    	SUM(FREEM_VL_A_PAGAR) AS 'Receita',
												0 AS 'VL_Custo', 
												0 AS 'QTD_ATENDIMENTOS',
												COUNT(DISTINCT CASE WHEN freem_cd_grupo_rubrica IN(1,6)
												THEN freem_nr_marca_otica ELSE NULL END)  AS 'QTD_VIDAS'
												FROM book_FREEM_RECEITA_EMITIDA AS FT
												INNER JOIN book_VW_DIM_CONTRATO CT 
												ON CT.CD_CONTRATO = FT.FREEM_CD_CONTRATO
												LEFT JOIN book_VW_DIM_BENEFICIARIO AS BN
												ON BN.NR_MARCA_OTICA = FT.FREEM_NR_MARCA_OTICA
												WHERE FREEM_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
												AND FREEM_CD_PRODUTO_ASSISTENCIA <> 1 
												AND CT.TIP_PESSOA IN('J','I') 
												AND FREEM_IN_APOS_DEMITIDO = 'S'
												GROUP BY FREEM_COMPETENCIA
												
												UNION ALL 
												
												SELECT
												FPRDE_DS_COMPETENCIA AS 'COMPETENCIA',
												0  AS 'Receita',
												0 AS 'VL_Custo', 
												COUNT(DISTINCT FPRDE_NR_MARCA_OTICA)  AS 'QTD_ATENDIMENTOS',
												0 AS 'QTD_VIDAS'
												FROM book_FPRDE_PROCEDIMENTO_DENTAL AS FT
												INNER JOIN book_VW_DIM_CONTRATO CT ON CT.CD_CONTRATO=FT.FPRDE_CD_CONTRATO
												LEFT JOIN book_VW_DIM_BENEFICIARIO AS BN ON BN.NR_MARCA_OTICA=FT.FPRDE_NR_MARCA_OTICA
												WHERE FPRDE_DS_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
												AND CT.TIP_PESSOA IN('J','I') --- regra inclusa no report
												AND FPRDE_IND_APOS_DEMITIDO = 'S'
												GROUP BY FPRDE_DS_COMPETENCIA

												UNION ALL

												SELECT
												Competencia AS 'COMPETENCIA',
												0 AS 'Receita',
												SUM(Custo_Dental) AS 'VL_Custo',
												0 AS 'QTD_ATENDIMENTOS',
												0 AS 'QTD_VIDAS' 
												FROM
												(
													SELECT
													FPRDE_DS_COMPETENCIA AS Competencia,
													SUM(FPRDE_VL_PAGO)   AS Custo_Dental
													FROM book_FPRDE_PROCEDIMENTO_DENTAL AS FT
													INNER JOIN book_VW_DIM_CONTRATO CT ON CT.CD_CONTRATO=FT.FPRDE_CD_CONTRATO
													LEFT JOIN book_VW_DIM_BENEFICIARIO AS BN ON BN.NR_MARCA_OTICA=FT.FPRDE_NR_MARCA_OTICA
													WHERE 
													FPRDE_DS_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
													AND CT.TIP_PESSOA IN('J','I') --- regra inclusa no report
													AND FPRDE_IND_APOS_DEMITIDO = 'S'
													GROUP BY
													FPRDE_DS_COMPETENCIA
													
													UNION
													
													SELECT
													FDERE_DS_COMPETENCIA  AS Competencia,
													SUM(FDERE_VL_REPASSE) AS Custo_Dental
													FROM book_FDERE_DETALHE_REPASSE_DENTAL
													INNER JOIN book_VW_DIM_CONTRATO AS CT ON CT.CD_CONTRATO=FDERE_CD_CONTRATO
													WHERE
													FDERE_DS_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
													AND CT.TIP_PESSOA IN('J','I') --- regra inclusa no report

													GROUP BY
													FDERE_DS_COMPETENCIA
												) AS CustoOdonto
												GROUP BY
												COMPETENCIA
															
												) AS x
												GROUP BY COMPETENCIA
											) AS x2
										) AS  x_all
										GROUP BY Data_de_Competencia 
										ORDER BY SUM(Custo_Medico) DESC")
		resultado = result.each do |rowset| end
  		return resultado
		client.close
	end

	#----------------------------Relatorio_36_03-----------------------------------#
	# Demitidos e Aposentados = Todas 										       #
	# Filial Empresa = 948206/000, 948206/001, 948206/002, 948206/003, 948206/004  #
	# Data Competência = Última competência mais 2 competências anteriores	       #
	# Empresas = 948206 														   #
	# Moeda = Real   													      	   #
	# Produtos = Todos														       #
	#------------------------------------------------------------------------------#
	def recuperar_dados_bd_bi_book_relatorio_36_03

		client = TinyTds::Client.new username: FigNewton.credenciais_banco_de_dados.usuario,
									 password: FigNewton.credenciais_banco_de_dados.senha,
									 host: FigNewton.credenciais_banco_de_dados.host,
    								 port: FigNewton.credenciais_banco_de_dados.port,
    								 database: FigNewton.credenciais_banco_de_dados.database,
    								 adapter: FigNewton.credenciais_banco_de_dados.adapter,
    								 timeout: FigNewton.credenciais_banco_de_dados.timeout

		puts 'Conectando no SQL Server!!!'

		if client.active? == true then puts 'Tudo pronto!!!' end

		puts "Obtendo dados da tabela!!!"

		result = client.execute("USE BIOP_DWH;

										SELECT
										Data_de_Competencia AS 'Data de Competência',
										CAST(SUM(Receita) AS DECIMAL(15,5)) AS 'Receita', 
										CAST(SUM(Custo_Medico) AS DECIMAL(15,5)) AS 'Custo Odontológico', 
										CAST(AVG(Sinistralidade) AS DECIMAL(15,5)) AS 'Sinistralidade', 
										SUM(Qtde_Benef_Atendidos) AS 'Qtde usuários', 
										CAST(AVG(Custo_per_Capita) AS DECIMAL(15,5)) AS 'Custo per Capita', 
										SUM(Qtde_de_Vidas) AS 'Qtde de Vidas'
										FROM 
										( 
											SELECT
											COMPETENCIA        AS 'Data_de_Competencia',
											Receita            AS 'Receita',
											VL_Custo           AS 'Custo_Medico', 
											VL_Custo/NULLIF(Receita,0)   AS 'Sinistralidade', 
											QTD_ATENDIMENTOS   AS 'Qtde_Benef_Atendidos', 
											VL_Custo/NULLIF(QTD_VIDAS,0) AS 'Custo_per_Capita',
											QTD_VIDAS          AS 'Qtde_de_Vidas'
											FROM 
											( 
											SELECT 
											COMPETENCIA             AS 'COMPETENCIA', 
											SUM(Receita)            AS 'Receita', 
											SUM(VL_Custo)           AS 'VL_Custo', 
											SUM(QTD_ATENDIMENTOS)   AS 'QTD_ATENDIMENTOS', 
											SUM(QTD_VIDAS)          AS 'QTD_VIDAS' 
											FROM 
											(
											  	SELECT 
										    	FREEM_COMPETENCIA AS 'COMPETENCIA',  
										    	SUM(FREEM_VL_A_PAGAR) AS 'Receita',
												0 AS 'VL_Custo', 
												0 AS 'QTD_ATENDIMENTOS',
												COUNT(DISTINCT CASE WHEN freem_cd_grupo_rubrica IN(1,6)
												THEN freem_nr_marca_otica ELSE NULL END)  AS 'QTD_VIDAS'
												FROM book_FREEM_RECEITA_EMITIDA AS FT
												INNER JOIN book_VW_DIM_CONTRATO CT 
												ON CT.CD_CONTRATO = FT.FREEM_CD_CONTRATO
												LEFT JOIN book_VW_DIM_BENEFICIARIO AS BN
												ON BN.NR_MARCA_OTICA = FT.FREEM_NR_MARCA_OTICA
												WHERE FREEM_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
												AND FREEM_CD_PRODUTO_ASSISTENCIA <> 1 
												AND CT.TIP_PESSOA IN('J','I') 
												AND FREEM_CD_CONTRATO LIKE '948206%' 
												GROUP BY FREEM_COMPETENCIA
												
												UNION ALL 
												
												SELECT
												FPRDE_DS_COMPETENCIA AS 'COMPETENCIA',
												0  AS 'Receita',
												0 AS 'VL_Custo', 
												COUNT(DISTINCT FPRDE_NR_MARCA_OTICA)  AS 'QTD_ATENDIMENTOS',
												0 AS 'QTD_VIDAS'
												FROM book_FPRDE_PROCEDIMENTO_DENTAL AS FT
												INNER JOIN book_VW_DIM_CONTRATO CT ON CT.CD_CONTRATO=FT.FPRDE_CD_CONTRATO
												LEFT JOIN book_VW_DIM_BENEFICIARIO AS BN ON BN.NR_MARCA_OTICA=FT.FPRDE_NR_MARCA_OTICA
												WHERE FPRDE_DS_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
												AND CT.TIP_PESSOA IN('J','I') --- regra inclusa no report
												AND CT.CD_CONTRATO like '948206%'
												GROUP BY FPRDE_DS_COMPETENCIA

												UNION ALL

												SELECT
												Competencia AS 'COMPETENCIA',
												0 AS 'Receita',
												SUM(Custo_Dental) AS 'VL_Custo',
												0 AS 'QTD_ATENDIMENTOS',
												0 AS 'QTD_VIDAS' 
												FROM
												(
													SELECT
													FPRDE_DS_COMPETENCIA AS Competencia,
													SUM(FPRDE_VL_PAGO)   AS Custo_Dental
													FROM book_FPRDE_PROCEDIMENTO_DENTAL AS FT
													INNER JOIN book_VW_DIM_CONTRATO CT ON CT.CD_CONTRATO=FT.FPRDE_CD_CONTRATO
													LEFT JOIN book_VW_DIM_BENEFICIARIO AS BN ON BN.NR_MARCA_OTICA=FT.FPRDE_NR_MARCA_OTICA
													WHERE 
													FPRDE_DS_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
													AND CT.TIP_PESSOA IN('J','I') --- regra inclusa no report
													AND CT.CD_CONTRATO LIKE ('948206%')
													GROUP BY
													FPRDE_DS_COMPETENCIA
													
													UNION
													
													SELECT
													FDERE_DS_COMPETENCIA  AS Competencia,
													SUM(FDERE_VL_REPASSE) AS Custo_Dental
													FROM book_FDERE_DETALHE_REPASSE_DENTAL
													INNER JOIN book_VW_DIM_CONTRATO AS CT ON CT.CD_CONTRATO=FDERE_CD_CONTRATO
													WHERE
													FDERE_DS_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
										AND CT.CD_CONTRATO LIKE ('948206%')
													AND CT.TIP_PESSOA IN('J','I') --- regra inclusa no report

													GROUP BY
													FDERE_DS_COMPETENCIA
												) AS CustoOdonto
												GROUP BY
												COMPETENCIA
															
												) AS x
												GROUP BY COMPETENCIA
											) AS x2
										) AS  x_all
										GROUP BY Data_de_Competencia 
										ORDER BY SUM(Custo_Medico) DESC")
		resultado = result.each do |rowset| end
  		return resultado
		client.close
	end


	#----------------------------Relatorio_36_04----------------------------------------------#
	# Demitidos e Aposentados = Todas 										                  #
	# Filial Empresa = 446315/000, 948206/000, 948206/001, 948206/002, 948206/003, 948206/004 #
	# Data Competência = Última competência mais 2 competências anteriores	                  #  
	# Empresas = 446315; 948206 														      #
	# Moeda = Real   														                  #
	# Produtos = Todos														                  #
	#-----------------------------------------------------------------------------------------#
	def recuperar_dados_bd_bi_book_relatorio_36_04

		client = TinyTds::Client.new username: FigNewton.credenciais_banco_de_dados.usuario,
									 password: FigNewton.credenciais_banco_de_dados.senha,
									 host: FigNewton.credenciais_banco_de_dados.host,
    								 port: FigNewton.credenciais_banco_de_dados.port,
    								 database: FigNewton.credenciais_banco_de_dados.database,
    								 adapter: FigNewton.credenciais_banco_de_dados.adapter,
    								 timeout: FigNewton.credenciais_banco_de_dados.timeout

		puts 'Conectando no SQL Server!!!'

		if client.active? == true then puts 'Tudo pronto!!!' end

		puts "Obtendo dados da tabela!!!"

		result = client.execute("USE BIOP_DWH;

										SELECT
										Data_de_Competencia AS 'Data de Competência',
										CAST(SUM(Receita) AS DECIMAL(15,5)) AS 'Receita', 
										CAST(SUM(Custo_Medico) AS DECIMAL(15,5)) AS 'Custo Odontológico', 
										CAST(AVG(Sinistralidade) AS DECIMAL(15,5)) AS 'Sinistralidade', 
										SUM(Qtde_Benef_Atendidos) AS 'Qtde usuários', 
										CAST(AVG(Custo_per_Capita) AS DECIMAL(15,5)) AS 'Custo per Capita', 
										SUM(Qtde_de_Vidas) AS 'Qtde de Vidas'
										FROM 
										( 
											SELECT
											COMPETENCIA        AS 'Data_de_Competencia',
											Receita            AS 'Receita',
											VL_Custo           AS 'Custo_Medico', 
											VL_Custo/NULLIF(Receita,0)   AS 'Sinistralidade', 
											QTD_ATENDIMENTOS   AS 'Qtde_Benef_Atendidos', 
											VL_Custo/NULLIF(QTD_VIDAS,0) AS 'Custo_per_Capita',
											QTD_VIDAS          AS 'Qtde_de_Vidas'
											FROM 
											( 
											SELECT 
											COMPETENCIA             AS 'COMPETENCIA', 
											SUM(Receita)            AS 'Receita', 
											SUM(VL_Custo)           AS 'VL_Custo', 
											SUM(QTD_ATENDIMENTOS)   AS 'QTD_ATENDIMENTOS', 
											SUM(QTD_VIDAS)          AS 'QTD_VIDAS' 
											FROM 
											(
											  	SELECT 
										    	FREEM_COMPETENCIA AS 'COMPETENCIA',  
										    	SUM(FREEM_VL_A_PAGAR) AS 'Receita',
												0 AS 'VL_Custo', 
												0 AS 'QTD_ATENDIMENTOS',
												COUNT(DISTINCT CASE WHEN freem_cd_grupo_rubrica IN(1,6)
												THEN freem_nr_marca_otica ELSE NULL END)  AS 'QTD_VIDAS'
												FROM book_FREEM_RECEITA_EMITIDA AS FT
												INNER JOIN book_VW_DIM_CONTRATO CT 
												ON CT.CD_CONTRATO = FT.FREEM_CD_CONTRATO
												LEFT JOIN book_VW_DIM_BENEFICIARIO AS BN
												ON BN.NR_MARCA_OTICA = FT.FREEM_NR_MARCA_OTICA
												WHERE FREEM_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
												AND FREEM_CD_PRODUTO_ASSISTENCIA <> 1 
												AND CT.TIP_PESSOA IN('J','I') 
												AND FREEM_CD_CONTRATO in ('446315000', '948206000', '948206001', '948206002', '948206003', '948206004')
												GROUP BY FREEM_COMPETENCIA
												
												UNION ALL 
												
												SELECT
												FPRDE_DS_COMPETENCIA AS 'COMPETENCIA',
												0  AS 'Receita',
												0 AS 'VL_Custo', 
												COUNT(DISTINCT FPRDE_NR_MARCA_OTICA)  AS 'QTD_ATENDIMENTOS',
												0 AS 'QTD_VIDAS'
												FROM book_FPRDE_PROCEDIMENTO_DENTAL AS FT
												INNER JOIN book_VW_DIM_CONTRATO CT ON CT.CD_CONTRATO=FT.FPRDE_CD_CONTRATO
												LEFT JOIN book_VW_DIM_BENEFICIARIO AS BN ON BN.NR_MARCA_OTICA=FT.FPRDE_NR_MARCA_OTICA
												WHERE FPRDE_DS_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
												AND CT.TIP_PESSOA IN('J','I') --- regra inclusa no report
												AND CT.CD_CONTRATO in ('446315000', '948206000', '948206001', '948206002', '948206003', '948206004')
												GROUP BY FPRDE_DS_COMPETENCIA

												UNION ALL

												SELECT
												Competencia AS 'COMPETENCIA',
												0 AS 'Receita',
												SUM(Custo_Dental) AS 'VL_Custo',
												0 AS 'QTD_ATENDIMENTOS',
												0 AS 'QTD_VIDAS' 
												FROM
												(
													SELECT
													FPRDE_DS_COMPETENCIA AS Competencia,
													SUM(FPRDE_VL_PAGO)   AS Custo_Dental
													FROM book_FPRDE_PROCEDIMENTO_DENTAL AS FT
													INNER JOIN book_VW_DIM_CONTRATO CT ON CT.CD_CONTRATO=FT.FPRDE_CD_CONTRATO
													LEFT JOIN book_VW_DIM_BENEFICIARIO AS BN ON BN.NR_MARCA_OTICA=FT.FPRDE_NR_MARCA_OTICA
													WHERE 
													FPRDE_DS_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
													AND CT.TIP_PESSOA IN('J','I') --- regra inclusa no report
													AND CT.CD_CONTRATO in ('446315000', '948206000', '948206001', '948206002', '948206003', '948206004')
													GROUP BY
													FPRDE_DS_COMPETENCIA
													
													UNION
													
													SELECT
													FDERE_DS_COMPETENCIA  AS Competencia,
													SUM(FDERE_VL_REPASSE) AS Custo_Dental
													FROM book_FDERE_DETALHE_REPASSE_DENTAL
													INNER JOIN book_VW_DIM_CONTRATO AS CT ON CT.CD_CONTRATO=FDERE_CD_CONTRATO
													WHERE
													FDERE_DS_COMPETENCIA IN ('#{@competencia1}','#{@competencia2}','#{@competencia3}')
													AND CT.CD_CONTRATO in ('446315000', '948206000', '948206001', '948206002', '948206003', '948206004')
													AND CT.TIP_PESSOA IN('J','I') --- regra inclusa no report

													GROUP BY
													FDERE_DS_COMPETENCIA
												) AS CustoOdonto
												GROUP BY
												COMPETENCIA
															
												) AS x
												GROUP BY COMPETENCIA
											) AS x2
										) AS  x_all
										GROUP BY Data_de_Competencia 
										ORDER BY SUM(Custo_Medico) DESC")
		resultado = result.each do |rowset| end
  		return resultado
		client.close
	end

	#----------------------------Relatorio_192_1-----------------------------------------------------------------------------------------------------------#
	# Demitidos e Aposentados = Todas																													   #
	# Filial Amil = Todas                                                                                                                                  #  
	# Empresa: 000509 - PRICE                                                                                                                              #
	# Moeda = Real                        																												   #
	# Tipo de Evento = CONSULTA                                                                               											   #
	# Célula = Todas																																	   #
	# Operadora = Todas 										                                                                                           #  
	# Filial Empresa = 000509/000, 000509/001, 000509/002, 000509/003, 000509/004, 000509/005, 000509/006, 000509/007, 000509/008, 000509/009, 000509/010, #
	# 000509/000, 000509/011, 000509/012, 000509/013, 000509/014, 000509/015                                                                               #
	# Data Competência = Última competência mais 2 competências anteriores	                															   #  
	# P&L = Todas   														                  															   #
	#------------------------------------------------------------------------------------------------------------------------------------------------------#
	def recuperar_dados_bd_bi_book_especialidades_relatorio_192

		client = TinyTds::Client.new username: FigNewton.credenciais_banco_de_dados.usuario,
									 password: FigNewton.credenciais_banco_de_dados.senha,
									 host: FigNewton.credenciais_banco_de_dados.host,
    								 port: FigNewton.credenciais_banco_de_dados.port,
    								 database: FigNewton.credenciais_banco_de_dados.database,
    								 adapter: FigNewton.credenciais_banco_de_dados.adapter,
    								 timeout: FigNewton.credenciais_banco_de_dados.timeout

		puts 'Conectando no SQL Server!!!'

		if client.active? == true then puts 'Tudo pronto!!!' end

		puts "Obtendo dados da tabela!!!"

		result = client.execute("SELECT
										R1.Especialidade
										,R1.Qtde
										,CASE
										   WHEN R1.QTD_TOTAL > 0 THEN ROUND((R1.Qtde/R1.QTD_TOTAL)*100,2)
										END AS QTD_PERC
										,R1.Custo_Medico
										,CASE
										   WHEN R1.CUSTO_MEDICO_TOTAL > 0 THEN ROUND((R1.Custo_Medico/R1.CUSTO_MEDICO_TOTAL)*100,2)
										END AS CUSTO_PERC


										FROM 
										(
										SELECT
										    Especialidade     AS 'Especialidade',
										    SUM(Qtde)         AS 'Qtde',
										--    Custo_Medico/SUM(Custo_Medico) AS '%QTDE', 
										    SUM(Custo_Medico) AS 'Custo_Medico',
										    QTD_TOTAL,
										    CUSTO_MEDICO_TOTAL
										FROM
										    (
										        SELECT
										            NM_ESPECIALIDADE                  AS 'Especialidade',
										            SUM(ISNULL(FPRSA_QT_REALIZADA,0)) AS 'Qtde',
										            SUM(ISNULL(FPRSA_VL_CALCULADO,0)) AS 'Custo_Medico',
										                (
										                        SELECT
										                            SUM(ISNULL(FPRSA_QT_REALIZADA,0)) AS 'Qtde1'
										                --            SUM(ISNULL(FPRSA_VL_CALCULADO,0)) AS 'Custo_Medico'
										                            
										                        FROM
										                            BIOP_DWH.dbo.book_FPRSA_PROCEDIMENTO_SAUDE P
										                        INNER JOIN biop_dwh.dbo.book_VW_DIM_CONTRATO C
										                        ON
										                            C.CD_CONTRATO=P.FPRSA_CD_CONTRATO
										                        INNER JOIN biop_dwh.dbo.book_VW_DIM_ESPECIALIDADE_SAUDE E
										                        ON
										                            E.CD_ESPECIALIDADE=P.FPRSA_CD_ESPECIALIDADE
										                        INNER JOIN biop_dwh.dbo.book_VW_DIM_TIPO_EVENTO T
										                        ON
										                            T.COD_EVENTO=P.FPRSA_CD_TIPO_EVENTO
										                        WHERE
										                            C.Tip_Pessoa IN('J','I')
										                        AND FPRSA_DS_COMPETENCIA IN('#{@competencia1}','#{@competencia2}','#{@competencia3}')
										                   AND  C.CD_EMPRESA = '000509' 
										                   AND     T.DS_EVENTO = 'CONSULTA'
										                 ) as QTD_TOTAL,
										                 (
										                        SELECT
										                           -- SUM(ISNULL(FPRSA_QT_REALIZADA,0)) AS 'Qtde1'
										                             SUM(ISNULL(FPRSA_VL_CALCULADO,0)) AS 'Custo_Medico_Total'
										                            
										                        FROM
										                            BIOP_DWH.dbo.book_FPRSA_PROCEDIMENTO_SAUDE P
										                        INNER JOIN biop_dwh.dbo.book_VW_DIM_CONTRATO C
										                        ON
										                            C.CD_CONTRATO=P.FPRSA_CD_CONTRATO
										                        INNER JOIN biop_dwh.dbo.book_VW_DIM_ESPECIALIDADE_SAUDE E
										                        ON
										                            E.CD_ESPECIALIDADE=P.FPRSA_CD_ESPECIALIDADE
										                        INNER JOIN biop_dwh.dbo.book_VW_DIM_TIPO_EVENTO T
										                        ON
										                            T.COD_EVENTO=P.FPRSA_CD_TIPO_EVENTO
										                        WHERE
										                            C.Tip_Pessoa IN('J','I')
										                        AND FPRSA_DS_COMPETENCIA IN('#{@competencia1}','#{@competencia2}','#{@competencia3}')
										                   AND  C.CD_EMPRESA = '000509' 
										                   AND     T.DS_EVENTO = 'CONSULTA'
										                 ) as CUSTO_MEDICO_TOTAL
										                 

										            
										        FROM
										            BIOP_DWH.dbo.book_FPRSA_PROCEDIMENTO_SAUDE P
										        INNER JOIN biop_dwh.dbo.book_VW_DIM_CONTRATO C
										        ON
										            C.CD_CONTRATO=P.FPRSA_CD_CONTRATO
										        INNER JOIN biop_dwh.dbo.book_VW_DIM_ESPECIALIDADE_SAUDE E
										        ON
										            E.CD_ESPECIALIDADE=P.FPRSA_CD_ESPECIALIDADE
										        INNER JOIN biop_dwh.dbo.book_VW_DIM_TIPO_EVENTO T
										        ON
										            T.COD_EVENTO=P.FPRSA_CD_TIPO_EVENTO
										        WHERE
										            C.Tip_Pessoa IN('J','I')
										        AND FPRSA_DS_COMPETENCIA IN('#{@competencia1}','#{@competencia2}','#{@competencia3}')
										   AND  C.CD_EMPRESA = '000509' 
										   AND     T.DS_EVENTO = 'CONSULTA'
										        GROUP BY
										            NM_ESPECIALIDADE
										    ) AS x_all
										GROUP BY
										    Especialidade, QTD_TOTAL , CUSTO_MEDICO_TOTAL
										--ORDER BY
										--    Especialidade
										)R1
										ORDER BY 
										R1.Especialidade")
		resultado = result.each do |rowset| end
  		return resultado
		client.close
	end

	def recuperar_dados_bd_bi_book_detalhamento_especialidade_relatorio_192

		client = TinyTds::Client.new username: FigNewton.credenciais_banco_de_dados.usuario,
									 password: FigNewton.credenciais_banco_de_dados.senha,
									 host: FigNewton.credenciais_banco_de_dados.host,
    								 port: FigNewton.credenciais_banco_de_dados.port,
    								 database: FigNewton.credenciais_banco_de_dados.database,
    								 adapter: FigNewton.credenciais_banco_de_dados.adapter,
    								 timeout: FigNewton.credenciais_banco_de_dados.timeout

		puts 'Conectando no SQL Server!!!'

		if client.active? == true then puts 'Tudo pronto!!!' end

		puts "Obtendo dados da tabela!!!"

		result = client.execute("SELECT
                                    R1.Beneficiario
                                    ,r1.Tipo_Beneficiario
                                    ,R1.Qtde
                                    ,CASE
                                       WHEN R1.QTD_TOTAL > 0 THEN ROUND((R1.Qtde/R1.QTD_TOTAL)*100,2)
                                    END AS QTD_PERC
                                    ,R1.Custo_Medico
                                    ,CASE
                                       WHEN R1.CUSTO_MEDICO_TOTAL > 0 THEN ROUND((R1.Custo_Medico/R1.CUSTO_MEDICO_TOTAL)*100,2)
                                    END AS CUSTO_PERC


                                    FROM
                                    (
                                    SELECT
                                        Beneficiario      AS 'Beneficiario',
                                        Tipo_Beneficiario AS 'Tipo_Beneficiario',
                                        SUM(Qtde)         AS 'Qtde',
                                        SUM(Custo_Medico) AS 'Custo_Medico',
                                        QTD_TOTAL,
                                        CUSTO_MEDICO_TOTAL
                                    FROM
                                        (
                                            SELECT
                                                NM_BENEFICIARIO                    AS 'Beneficiario',
                                                ds_tipo_associado                  AS 'Tipo_Beneficiario',
                                                SUM(ISNULL(FPRSA_QT_REALIZADA, 0)) AS 'Qtde',
                                                SUM(ISNULL(FPRSA_VL_CALCULADO, 0)) AS 'Custo_Medico',
                                                (
                                                    SELECT
                                                        SUM(ISNULL(FPRSA_QT_REALIZADA,0)) AS 'Qtde1'
                                                    FROM
                                                        BIOP_DWH.dbo.book_FPRSA_PROCEDIMENTO_SAUDE P
                                                    INNER JOIN
                                                        biop_dwh.dbo.book_VW_DIM_CONTRATO C
                                                    ON
                                                        C.CD_CONTRATO = P.FPRSA_CD_CONTRATO
                                                    INNER JOIN
                                                        biop_dwh.dbo.book_VW_DIM_ESPECIALIDADE_SAUDE E
                                                    ON
                                                        E.CD_ESPECIALIDADE=P.FPRSA_CD_ESPECIALIDADE
                                                    INNER JOIN
                                                        biop_dwh.dbo.book_VW_DIM_TIPO_EVENTO T
                                                    ON
                                                        T.COD_EVENTO = P.FPRSA_CD_TIPO_EVENTO
                                                    INNER JOIN
                                                        BIOP_DWH.dbo.book_VW_DIM_BENEFICIARIO B
                                                    ON
                                                        B.NR_MARCA_OTICA = P.FPRSA_NR_MARCA_OTICA
                                                    INNER JOIN
                                                        BIOP_DWH.dbo.book_VW_DIM_TIPO_ASSOCIADO A
                                                    ON
                                                        A.in_tipo_associado = B.in_tipo_associado
                                                    WHERE
                                                        C.Tip_Pessoa IN ('J',
                                                                         'I')
                                                    AND FPRSA_DS_COMPETENCIA IN('#{@competencia1}',
                                                                                '#{@competencia2}',
                                                                                '#{@competencia3}')
                                                    AND C.CD_EMPRESA = '000509'
                                                    AND T.DS_EVENTO = 'CONSULTA'
                                                    AND CD_ESPECIALIDADE = '1' --Clínica Médica
                                                ) AS QTD_TOTAL,
                                                (
                                                    SELECT
                                                        SUM (ISNULL(FPRSA_VL_CALCULADO,0)) AS 'Custo_Medico_Total'
                                                    FROM
                                                        BIOP_DWH.dbo.book_FPRSA_PROCEDIMENTO_SAUDE P
                                                    INNER JOIN
                                                        biop_dwh.dbo.book_VW_DIM_CONTRATO C
                                                    ON
                                                        C.CD_CONTRATO=P.FPRSA_CD_CONTRATO
                                                    INNER JOIN
                                                        biop_dwh.dbo.book_VW_DIM_ESPECIALIDADE_SAUDE E
                                                    ON
                                                        E.CD_ESPECIALIDADE=P.FPRSA_CD_ESPECIALIDADE
                                                    INNER JOIN
                                                        biop_dwh.dbo.book_VW_DIM_TIPO_EVENTO T
                                                    ON
                                                        T.COD_EVENTO=P.FPRSA_CD_TIPO_EVENTO
                                                    INNER JOIN
                                                        BIOP_DWH.dbo.book_VW_DIM_BENEFICIARIO B
                                                    ON
                                                        B.NR_MARCA_OTICA = P.FPRSA_NR_MARCA_OTICA
                                                    INNER JOIN
                                                        BIOP_DWH.dbo.book_VW_DIM_TIPO_ASSOCIADO A
                                                    ON
                                                        A.in_tipo_associado = B.in_tipo_associado
                                                    WHERE
                                                        C.Tip_Pessoa IN ('J',
                                                                         'I')
                                                    AND FPRSA_DS_COMPETENCIA IN('#{@competencia1}',
                                                                                '#{@competencia2}',
                                                                                '#{@competencia3}')
                                                    AND C.CD_EMPRESA = '000509'
                                                    AND T.DS_EVENTO = 'CONSULTA'
                                                    AND CD_ESPECIALIDADE = '1' --Clínica Médica
                                                ) AS CUSTO_MEDICO_TOTAL
                                            FROM
                                                BIOP_DWH.dbo.book_FPRSA_PROCEDIMENTO_SAUDE P
                                            INNER JOIN
                                                biop_dwh.dbo.book_VW_DIM_CONTRATO C
                                            ON
                                                C.CD_CONTRATO=P.FPRSA_CD_CONTRATO
                                            INNER JOIN
                                                biop_dwh.dbo.book_VW_DIM_ESPECIALIDADE_SAUDE E
                                            ON
                                                E.CD_ESPECIALIDADE=P.FPRSA_CD_ESPECIALIDADE
                                            INNER JOIN
                                                biop_dwh.dbo.book_VW_DIM_TIPO_EVENTO T
                                            ON
                                               T.COD_EVENTO=P.FPRSA_CD_TIPO_EVENTO
                                            INNER JOIN
                                                BIOP_DWH.dbo.book_VW_DIM_BENEFICIARIO B
                                            ON
                                                B.NR_MARCA_OTICA = P.FPRSA_NR_MARCA_OTICA
                                            INNER JOIN
                                                BIOP_DWH.dbo.book_VW_DIM_TIPO_ASSOCIADO A
                                            ON
                                                A.in_tipo_associado = B.in_tipo_associado
                                            WHERE
                                                C.Tip_Pessoa IN ('J',
                                                                 'I')
                                            AND FPRSA_DS_COMPETENCIA IN('#{@competencia1}',
                                                                        '#{@competencia2}',
                                                                        '#{@competencia3}')
                                            AND C.CD_EMPRESA = '000509'
                                            AND T.DS_EVENTO = 'CONSULTA'
                                            AND CD_ESPECIALIDADE = '1' --Clínica Médica
                                            GROUP BY
                                                NM_BENEFICIARIO
                                                ,ds_tipo_associado
                                                ) AS x_all
                                    GROUP BY
                                        Beneficiario,
                                        QTD_TOTAL ,
                                        CUSTO_MEDICO_TOTAL ,
                                        Tipo_Beneficiario
                                        )R1 ORDER BY R1.Beneficiario")
		resultado = result.each do |rowset| end
  		return resultado
		client.close
	end


end