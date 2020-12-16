# require 'capybara'
# require 'capybara/cucumber'
# require 'selenium-webdriver'
# require 'pry'
# require 'allure-cucumber'
# require 'rspec'
# require 'site_prism'
# require 'site_prism/all_there'
# require 'require_all'
#
# require_all 'app'
#
# Before('@GmailFeature') do
#   unless $ui_setup_is_done
#     create_logger('log/ui/nazar_logs.txt')
#     CapybaraConfig.register_drivers
#     CapybaraConfig.set_default_config
#     $ui_setup_is_done = true
#   end
# end
#
# After('@ui_scenario') do |scenario|
#   if scenario.failed?
#     attach_screen
#   end
# end
