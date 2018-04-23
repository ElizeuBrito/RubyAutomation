#Caminho da common => /lib/common.rb
require "common"
require "test/unit"
require "test/unit/assertion-failed-error"
require "test/unit/assertions"
include Test::Unit::Assertions

class Relatorio36

	include PageObject

	def teste2(meses)
		foo1 = GerarRelatorio.new
		bar = ClasseGenerica.new
		bar.belizeu = foo1
		bar.elizeu(10)
		puts "Estou no método teste2"
	end

end