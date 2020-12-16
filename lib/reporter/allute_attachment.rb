require 'allure-cucumber'

module AllureAttachment

  def attach_screenshot(screen, name)
    Allure.add_attachment(name: name, source: screen, type: Allure::ContentType::PNG)
  end

  def attach_file(file, file_name)
    Allure.add_attachment(name: file_name, source: file, type: Allure::ContentType::TXT)
  end

end

