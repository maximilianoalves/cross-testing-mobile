# frozen_string_literal: true

###
# Main Rakefile
###

Dir.glob('rake_tasks/*.rake').each { |r| load r }

desc 'Executar os testes selecionando a plataforma (ios|android), e.g.: single_run_acceptance[android,@homepage]'
task :single_run_acceptance, :platform, :tags do |_, args|
  Rake::Task[:start_appium_server].invoke
  result = run_rake_task('run_acceptance', args[:platform], args[:tags])

  begin
    Rake::Task[:stop_appium_server].invoke
  rescue StandardError => e
    puts "#{e.class}: #{e.message}"
  end

  raise 'Os testes do cucumber falharam' unless result
end

desc 'Executar os testes de regressão e reexecutar os testes que falharam'
task :single_run_acceptance_with_retry, :platform, :tags do |_, args|
  Rake::Task[:start_appium_server].invoke
  result = run_rake_task('acceptance_with_retry', args[:platform], args[:tags])

  begin
    Rake::Task[:stop_appium_server].invoke
  rescue StandardError => e
    puts "#{e.class}: #{e.message}"
  end

  raise 'Os testes do cucumber falharam' unless result
end
