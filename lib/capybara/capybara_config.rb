module Tools
  class CapybaraConfig
    def self.register_drivers
      Capybara.register_driver :selenium do |app|
        browser = ENV.fetch('browser', 'chrome').to_sym
        caps = Selenium::WebDriver::Remote::Capabilities.chrome(
            'goog:chromeOptions':
                {
                    'args': ["--window-size=1920,1280"],
                    'excludeSwitches': ["enable-logging"]
                }
        )
        Capybara::Selenium::Driver.new(app, browser: browser, desired_capabilities: caps)
      end
    end

    def self.set_default_config
      Capybara.default_max_wait_time = 15
      Capybara.default_driver = :selenium
      Capybara.default_selector = :xpath
      Capybara.app_host = $ui_base_url
    end
  end
end
