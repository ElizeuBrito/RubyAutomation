require 'rspec'
require 'page-object'
require 'fig_newton'
require 'watir'
require 'require_all'
require 'cucumber'
require 'magic_encoding'
require 'common'
require 'pry'
require 'selenium-webdriver'
require 'syntax'
require 'tiny_tds'
require 'test-unit'
require 'active_support'
require 'rake'
require 'report_builder'
require 'require_all'

World(PageObject::PageFactory)

require './lib/common'

FigNewton.load('dados_padrao.yml,queries.yml')

def browser_path
  (ENV['BPATH'])
end

def browser_name
  (ENV['BROWSER'] ||= 'firefox').downcase.to_sym
end

def environment
  (ENV['ENV'] ||= 'grid').downcase.to_sym
end

def browser_version
  (ENV['VER'])
end