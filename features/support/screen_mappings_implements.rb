require 'yaml'
require 'logger'

def get_screen_mappings screen, package
  $platform = ENV['PLATFORM_NAME'].downcase
  # require 'pry'; binding.pry
  screen_mappings = YAML.load_file "#{Dir.pwd}/features/#{package}/elements/screen_mappings_#{screen}.yaml"
  @mappings = screen_mappings[$platform]
end