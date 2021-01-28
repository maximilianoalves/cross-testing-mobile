# frozen_string_literal: true

require 'allure-cucumber'
require 'appium_lib'
require 'cucumber'
require 'selenium-webdriver'

$wait = Selenium::WebDriver::Wait.new(timeout: 60)
time  = Time.new
time = time.strftime('%d-%m-%Y')
$logger = Logger.new("./exec-logs/exec-log-#{time}.log")
env = ENV['PLATFORM_NAME'].downcase

AllureCucumber.configure do |c|
  c.clean_results_directory = true
  c.logging_level = Logger::INFO
end

def load_appium_configuration(platform)
  dir = "#{Dir.pwd}/configs/#{platform}/appium.txt"
  Appium.load_appium_txt file: File.expand_path(dir, __FILE__), verbose: true
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

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object
