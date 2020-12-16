require 'allure-cucumber'
require_relative '../capybara/capybara_screens'
require_relative 'allute_attachment'

module Reporter
  include Tools

  cattr_accessor :logger

  def log_step(step_description)
    log_info(step_description) if $log_each_step
    Allure.run_step step_description do
      yield
    end
    attach_screen if $screenshot_each_step && $executing_ui
  end

  def attach_screen
    screen = CapybaraScreens.save_screenshot("#{Time.now.min+Time.now.sec}-screen")
    AllureAttachment.attach_screenshot(screen, 'step_screen')
  end

  def log_info(message)
      logger.info(message)
  end
end 
