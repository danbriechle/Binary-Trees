require 'rubocop/rake_task'

task default: %w[lint test]

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['app/**/*.rb', 'test/**/*.rb']
  task.fail_on_error = false
end

task :run do
  ruby 'app/tree.rb'
end

task :test do
  ruby 'test/tree_test.rb'
  ruby 'test/node_test.rb'
end