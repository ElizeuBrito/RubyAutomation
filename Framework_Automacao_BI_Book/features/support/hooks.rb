require 'watir'
require 'report_builder'

include Selenium

caps = Selenium::WebDriver::Remote::Capabilities.ie
caps.version = 12
caps.platform = :WINDOWS
caps[:name] = "Watir"

@browser = Watir::Browser.new(:remote, :url=>"http://10.12.101.64:5555/wd/hub", :desired_capabilities=> caps)

Before do |scenario|
  puts 'Scenario running: ' + scenario.name
	$world = self
	ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
	#@browser = Watir::Browser.new :ie
	#@browser.driver.manage.window.maximize
end

# after each step
AfterStep do |scenario_name|
  encoded_img = @browser.driver.screenshot_as(:base64)
  embed("data:image/png;base64,#{encoded_img}",'image/png')
  #@browser.driver.save_screenshot("./results/#{scenario_name}_screenshot.png")
  #embed "./results/#{scenario_name}_screenshot.png", "image/png"
end

After do |scenario|
	begin
 		if scenario.failed?
      		Dir::mkdir('Evidencias_Falhas') if not File.directory?('Evidencias_Falhas')
      		screenshot = "./Evidencias_Falhas/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      		@browser.driver.save_screenshot(screenshot)
      		embed screenshot, 'image/png'
      		puts 'Scenario failed: ' + scenario.name
  		end
  		if scenario.passed?
  			Dir::mkdir('Evidencias_Sucesso') if not File.directory?('Evidencias_Sucesso')
  			screenshot = "./Evidencias_Sucesso/PASSED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
  			@browser.driver.save_screenshot(screenshot)
      	embed screenshot, 'image/png'
      	puts 'Scenario succeeded: ' + scenario.name
      	end
  	ensure
		@browser.cookies.clear
		@browser.close
 end

    at_exit do
      ReportBuilder.configure do |config|
      config.json_path = 'reports'
      config.report_path = 'report'
      config.report_types = [:html]
      config.report_tabs = [:overview, :features, :scenarios, :errors]
      config.report_title = 'BI BOOK - Resultado dos testes automatizados'
      config.compress_images = true
      config.include_images = true
      config.additional_info = {Browser: 'Internet Explorer', Environment: 'Produção'}
      config.color = 'orange'
      end
      ReportBuilder.build_report
    end
end