# require 'capybara/cucumber'
# require 'selenium-webdriver'
require 'allure-cucumber'
# require 'site_prism'
# require 'site_prism/all_there'

require_all 'config'
require_all 'app'
require_all 'lib'

include ConfigManager
include DataManager
include AllureAttachment
include Tools

Before do |scenario|
  $scenario = scenario
  $executing_ui = scenario.match_tags?('@ui_scenario')
end

AllureCucumber.configure do |c|
  c.results_directory = 'report'
  c.clean_results_directory = true
  c.vcs_link_pattern = 'https://github.com/TarasTsyhanko/ruby_ui_api_tests/blob/master'
  c.vcs_prefix = 'VCS_LINK:'
end

def create_logger(path)
  logger = CustomLogger::MyLogger.new(path)
  RestClient.log = logger
  Reporter.logger = logger
end

