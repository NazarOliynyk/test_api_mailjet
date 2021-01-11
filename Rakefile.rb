
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features/"
end

task default: %w[features]

Cucumber::Rake::Task.new(:frontend) do |t|
  t.cucumber_opts = "--require features features/frontend/"
end

Cucumber::Rake::Task.new(:backend) do |t|
  t.cucumber_opts = "--require features features/mailjet_backend/"
end

# rake
# rake backend
# rake frontend
#  allure generate report\allure-results -o report\allure-report  --clean