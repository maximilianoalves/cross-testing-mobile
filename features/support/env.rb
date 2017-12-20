require 'appium_lib'
require 'cucumber'
require 'selenium-webdriver'
require 'allure-cucumber'

$wait = Selenium::WebDriver::Wait.new(:timeout => 60)

time  = Time.new
time = time.strftime('%d-%m-%Y')
$logger = Logger.new("./exec-logs/exec-log-#{time}.log")

AllureCucumber.configure do |c|
  c.output_dir = './allure-results/'
  c.clean_dir  = true
end

def load_appium_configuration(platform)
  Appium.load_appium_txt :file => File.expand_path("#{Dir.pwd}/config/#{platform}/appium.txt", __FILE__), verbose: true
end

if ENV['PLATFORM_NAME'].nil?
  raise 'Por favor defina a variavel de ambiente PLATFORM_NAME, como: export PLATFORM_NAME=android'
else
  env = ENV['PLATFORM_NAME'].downcase
end

case env
when 'android'
  caps = load_appium_configuration(env)
  caps[:appium_lib][:export_session] = true
when 'ios'
  caps = load_appium_configuration(env)
  caps[:appium_lib][:export_session] = true
else
  raise("Plataforma não suportada #{ENV['PLATFORM_NAME']}")
end

Appium::Driver.new(caps)
Appium.promote_appium_methods Object