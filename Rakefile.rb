require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'capybara'
require 'selenium-webdriver'
require 'allure-cucumber'
require 'site_prism'
require 'site_prism/all_there'

namespace :cucumber do

  Cucumber::Rake::Task.new(:mailjet_api) do |t|
    t.cucumber_opts = 'features/mailjet_backend/test'
  end

end

#  allure generate report\allure-results -o report\allure-report  --clean
# rake cucumber:api
# # rake cucumber:ui
# rake cucumber:nazar_ui
# rake cucumber:nazar_api
# rake cucumber:mailjet_api