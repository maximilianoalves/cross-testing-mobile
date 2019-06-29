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
    puts "#{tags} --guess #{set_reporting(platform, true)}"
    t.cucumber_opts = "#{tags} --guess #{set_reporting(platform, true)}"
  end

  Rake::Task[:run].invoke
end

###
# Helpers
###

def run_rake_task(name, platform, tags)
  begin
    Rake::Task[name].invoke(platform, tags)
  rescue StandardError => e
    puts e.to_s
    return false
  end
  true
end

def set_reporting(platform, rerun)
  #reporting = "--format AllureCucumber::Formatter --out allure-results/#{platform}/"
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
