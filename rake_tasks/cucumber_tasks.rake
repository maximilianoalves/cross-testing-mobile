require 'cucumber'
require 'cucumber/rake/task'


###
# Tasks
###

desc 'Executar os testes de aceitação com a plataforma selecionada (ios|android) Ex.: run_acceptance[android,@homepage]'
task :run_acceptance, :platform, :tags do |_, args|
  platform_check(args)

  tags = ''
  unless args[:tags].nil?
    tags = "--tags #{args[:tags]}"
  end

  platform = args[:platform]

  Cucumber::Rake::Task.new(:run) do |t|
    t.cucumber_opts = "#{tags} --guess #{set_reporting(platform)}"
  end

  Rake::Task[:run].invoke
end

desc 'Executar os relatórios dos testes de aceitação'
task :report, :platform do |_, args|
  sh(" allure serve allure-results/#{args[:platform]}")

end

###
# Helpers
###

def set_reporting(platform)
  return "--format AllureCucumber::CucumberFormatter --out allure-results/#{platform}/"
end

def platform_check(args)
  raise 'Por favor defina a plataforma (android|ios)' if args.nil? or args[:platform].nil?

  case args[:platform].downcase
  when 'android'
    ENV['PLATFORM_NAME'] = args[:platform]
  when 'ios'
    ENV['PLATFORM_NAME'] = args[:platform]
  else
    raise("Testes não suportados para esta plataforma #{args[:platform]}")
  end
end
