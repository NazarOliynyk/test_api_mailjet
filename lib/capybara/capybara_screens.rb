module Tools
  module CapybaraScreens
    def self.save_screenshot(name)
      dirname = File.dirname('report/screenshots/')
      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end
      Capybara.current_session.driver.browser.save_screenshot("#{dirname}/#{name}.png")
    end
  end
end
