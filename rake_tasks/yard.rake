require 'yard'
require 'cucumber/platform'
require 'cucumber/core/gherkin/parser'
require 'gherkin/parser'
require 'cucumber/core/gherkin/tag_expression'

###
# Tasks
###

desc 'Documentacao BDD'

task :documentation do
  YARD::Rake::YardocTask.new(:run) do |t|
    t.files = ['features/**/*.feature', 'features/**/*.rb']
  end

  Rake::Task[:run].invoke
end
